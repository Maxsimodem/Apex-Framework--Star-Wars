/*
	Author: Bravo Zero One development
	- John_Spartan

	Description:
	- This function is designed to implement semi-authenthic ejection system on fixed wing aircrfat that have such functionality enabled/configured.

	Exucution:
	- Call the function via user action added to the aircrfat itself.

			class Plane_Eject_UserActionExample
			{
				priority = 0.05;
				shortcut = "Eject";
				displayName = "$STR_A3_action_eject";
				condition = "player in this";
				statement = "[this] spawn BIS_fnc_planeEjection";
				position = "pilotcontrol";
				radius = 10;
				onlyforplayer = 1;
				showWindow = 0;
		                hideOnUse = 1;
			};

	Requirments:
	- Compatible aircrfat must have a config definition for all sub-sytems that will be invoked by this function.
		1. Old legacy ejection must be disabled in aircrfat's cfgVehicles configuration.
		driverCanEject = 0;
		gunnerCanEject = 0;
		cargoCanEject = 0;

		2. Aircrfat must have a set of parameters defined in CfgVehicles subClass (EjectionSystem) for ejection system. Theese parameters will affect the ejection behaviour.
		example of cfgVehicles subclass definitions;

		class EjectionSystem
		{
			EjectionSeatEnabled = 1;										//enable advanced ejection system
			EjectionDual = 0;											//currently only single seat aircraft ejectiion supported (to do for latter)
			EjectionSeatClass = "B_Ejection_Seat_Plane_Fighter_01_F";								//class name of ejector seat to use (separate vehicle/object)
			CanopyClass = "Plane_Fighter_01_Canopy_F";								//class name of canopy to use (separate vehicle/object)
			EjectionSeatHideAnim = "ejection_seat_hide";								//name of the hide animation that will hide ejector seat mesh in plane
			EjectionSeatRailAnim = "ejection_seat_motion";								//name of the animation that will be played to start a smooth ejection motion out of cockpit
			CanopyHideAnim = "canopy_hide";										//name of the hide animation that will hide canopy mesh in plane
			EjectionSeatPos = "pos_eject";										//position memory point whwre to attach ejector seat
			CanopyPos = "pos_eject_canopy";										//position memory point where to attach dummy canopy
			EjectionSoundExt = "Plane_Fighter_01_ejection_ext_sound";						//sound to play when ejection trigered (external)
			EjectionSoundInt = "Plane_Fighter_01_ejection_in_sound";						//sound to play when ejection trigered (in-ternal)
			EjectionParachute = "Steerable_Parachute_F";								//class name parachute used in ejection
			EjectionSeatForce = 50;											//ejection seat blast force
			CanopyForce = 30;											//canopy bast force

		};

		3. Aircrfat model must have momory points definig positions where to attach new vehicle ejector seat, new vehicle canopy.
		4. Aircrfat model (in model cfg & class AnimationSources) must have a set of hide animations defined to hide ejector seat and canopy in model when new seaparate vehicles are spawned.

		In model.cfg
		class canopy_hide
		{
			type="hide";
			source="user";
			selection="canopy_hide";
			minValue = 0.0;
			maxValue = 1.0;
			minPhase = 0.0;
			maxPhase = 1.0;
			initPhase = 0;
			hideValue = 0.001;
		};

		class ejection_seat_hide
		{
			type="hide";
			source="user";
			selection="ejection_seat";
			minValue = 0.0;
			maxValue = 1.0;
			minPhase = 0.0;
			maxPhase = 1.0;
			initPhase = 0;
			hideValue = 0.001;
		}

		In cfgVehicles >> class AnimationSources
		class canopy_hide
		{
			source = "user";
			animPeriod = 0.001;
			initPhase = 0;
		};

		class ejection_seat_hide
		{
			source = "user";
			animPeriod = 0.001;
			initPhase = 0;
		};

		5. Aircrfat model must have an animation for initial ejection stage, where new ejector seat with pilot is pushed gradualy out of cockpit (done to avaoid PhysX colisions and make this feature look good, rathre than spawnig ejetor seat above plane).
		New ejector seat with pilot will be attached to this animation (via animated meory point).
		Memory point EjectionSeatPos must be part of this animated selection.

		In model.cfg
		class ejection_seat_motion
		{
			type = "translation";
			source = "user";
			selection = "ejection_seat";
			begin = "tns_ejection_seat";
			end = "tns_ejection_seat_e";
			animPeriod = 0;
			memory = 1;
			minValue = 0.0;
			maxValue = 1.0;
			offset0 = 0.0;
			offset1 = 3.0;
		};

		In cfgVehicles >> class AnimationSources
		class ejection_seat_motion
		{
			source = "user";
			animPeriod = 0.25;
			initPhase = 0;
		};

		6. Ejector seat and canopy must be created/defined as separate objects. Can be reused.

	Parameter(s):
		_this select 0: mode (Scalar)
		0: plane/object

		other parameters are gathered from configuration files.

	Returns: nothing
	Result: Pilot will be ejected from aircraft. Semi-authenthic behaviour.

*/

private _plane = param [0,objNull];

if (isNull _plane || {!alive _plane || {unitIsUAV _plane}}) exitWith {};

private _pilot = driver _plane;

if (isNull _pilot || {!alive _pilot}) exitWith {};

private _configPath = configFile >> "CfgVehicles" >> typeOf _plane >> "EjectionSystem";
private _ejectionSeatEnabled = getNumber (_configPath >> "EjectionSeatEnabled"); if (_ejectionSeatEnabled == 0) exitWith {};

private _canopyHideAnim = getText (_configPath >> "CanopyHideAnim"); if (_plane animationPhase _canopyHideAnim > 0.01) exitWith {};
private _ejectionSeatClass = getText (_configPath >> "EjectionSeatClass");
private _ejectionSeatHideAnim = getText (_configPath >> "EjectionSeatHideAnim");
private _ejectionSeatRailAnim = getText (_configPath >> "EjectionSeatRailAnim");
private _ejectionSeatForce = getNumber (_configPath >> "EjectionSeatForce");
private _canopyForce = getNumber (_configPath >> "CanopyForce");
private _canopyClass = getText (_configPath >> "CanopyClass");
private _ejectionSeatPos = getText (_configPath >> "EjectionSeatPos");
private _canopyPos = getText (_configPath >> "CanopyPos");
private _ejectionParachute = getText (_configPath >> "EjectionParachute");
private _ejectionSeat = objNull;

//--------------------------
//Blast off the canopy first
//--------------------------
sleep 0.1;
if (!alive _plane || {!alive _pilot}) exitWith {};
private _planeVelocityModelSpace = velocityModelSpace _plane;
_planeVelocityModelSpace set [1,-5];
_plane animate [_canopyHideAnim,1,true];
private _canopy = createVehicle [_canopyClass, [0,0,1000],[],0,"CAN_COLLIDE"];
_canopy attachTo [_plane,[0,0,0],_canopyPos];
detach _canopy;
private _timer = time + 180;
waitUntil {
	sleep 0.1;
	((isNull _canopy) || (time > _timer) || (isNull (attachedTo _canopy)))
};
_canopy setVelocityModelSpace (_planeVelocityModelSpace vectorAdd [0,0,_canopyForce]);
sleep 0.1;

if (!alive _plane) then
{
	deleteVehicle _canopy;
};

//------------------------------------
//Eject the pilot in the ejection seat
//------------------------------------
if (alive _plane && {alive _pilot}) then
{
	_ejectionSeat = createvehicle [_ejectionSeatClass,[0,0,1000],[],0,"CAN_COLLIDE"];
	_ejectionSeat attachTo [_plane,[0,0,0],_ejectionSeatPos];
	_plane animate [_ejectionSeatHideAnim,1,true];
	moveOut _pilot;
	waitUntil {
		sleep 0.1;
		(!((vehicle _pilot) isEqualTo _plane))
	};
	_pilot moveInCargo _ejectionSeat;
	_ejectionSeat lock 2;
	_plane animate [_ejectionSeatRailAnim,1];
	[_plane,_ejectionSeat] spawn (missionNamespace getVariable 'BIS_fnc_planeEjectionFX');
	waitUntil {
		sleep 0.1;
		(((_plane animationPhase _ejectionSeatRailAnim) > 0.75) || (!alive _plane))
	};
	private _planeVelocity = (velocity _plane) vectorAdd [1,0,0];
	_plane setVelocity _planeVelocity;
	detach _ejectionSeat;
	_planeVelocityModelSpace = (velocityModelSpace _plane) vectorAdd [0,0,_ejectionSeatForce];
	_ejectionSeat setVelocityModelSpace _planeVelocityModelSpace;
};

sleep 1.5;
if (!(isNull _ejectionSeat)) then {
	while {alive _pilot && {getpos _ejectionSeat select 2 > 350}} do
	{
		sleep 0.1;
	};

	//------------------------------------
	//Failsafe for low altitude ejections
	//------------------------------------
	if(getpos _ejectionSeat select 2 < 1) then {_pilot setDamage 1;};

	//------------------------------------
	//Deploy parachute if pilot is alive
	//------------------------------------
	if (((vehicle _pilot) isEqualTo _ejectionSeat) && {alive _pilot}) then
	{
		_ejectionSeat lock 0;
		_ejectionSeat setVelocity [0,0,0];
		moveOut _pilot;
		waitUntil {
			sleep 0.1;
			(!((vehicle _pilot) isEqualTo _ejectionSeat))
		};
		_parachute = _ejectionParachute createVehicle (getPos _ejectionSeat);
		_parachute attachTo [_ejectionSeat, [0,0,2.5]];
		_pilot moveInDriver _parachute;
		detach _parachute;
		_ejectionSeat lock 2;
		//------------------------------------
		//Set Steam Archivement state
		//------------------------------------
		setStatValue ["JetsPunchOut", 1];
	};

	//------------------------------------
	//Set state of non-funcional assets
	//------------------------------------
	_plane setFuel 0;
	_plane lock 2;
	sleep 10;

	//------------------------------------
	//Dispose of canopy & ejector seat
	//------------------------------------
	_timer = time + 60;
	waitUntil {
		sleep 0.5;
		((((getPos _ejectionSeat) select 2) <= 35) || (time > _timer))
	};
	sleep 1;
	if (!((getMissionConfigValue ['wreckManagerMode',0]) isEqualTo 0)) then {
		addToRemainsCollector [_ejectionSeat];
		if (!isNull _canopy) then {
			addToRemainsCollector [_canopy];
		};
	};
};