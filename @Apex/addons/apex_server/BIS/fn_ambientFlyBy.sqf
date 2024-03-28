/*
	Author: Nelson Duarte (tweaked by Quiksilver)

	Description:
	Spawns an ambient air unit, makes it move and deletes it when it reaches destination
	Vehicle will never engage and will be flagged as captive
	Good for simple creation of ambient fly by's

	Parameter(s):
	_this select 0:	ARRAY - The position where vehicle will spawn
	_this select 1:	ARRAY - The end position of the vehicle, it will be deleted here
	_this select 2:	NUMBER - The spawn and flight height of the vehicle
	_this select 3:	STRING - The speed the vehicle will move ("LIMITED", "NORMAL", "FULL")
	_this select 4:	STRING - The classname of the vehicle to spawn
	_this select 5:	SIDE - The side the vehicle belongs
	
	Returns:
	BOOL - true on success
*/

//Params
private ['_direction',"_vehicleContainer", "_vehicle", "_vehicleCrew", "_vehicleGroup",'_waypoint','_array'];
_start 		= _this param [0, [0,0,0], [[]]];
_end 		= _this param [1, [100,100,100], [[]]];
_height 	= _this param [2, 100, [0]];
_speed		= _this param [3, "NORMAL", [""]];
_class 		= _this param [4, "B_Heli_Light_01_F", [""]];
_side		= _this param [5, WEST, [WEST]];

_array = [];

//Set spawn height
_start set [2, _height];

//The starting direction of the vehicle
_direction = _start getDir _end;

//Spawn the vehicle

_vehicleContainer	= [_start, _direction, _class, _side] call (missionNamespace getVariable 'BIS_fnc_spawnVehicle');
_vehicle 		= _vehicleContainer select 0;
_vehicleCrew		= _vehicleContainer select 1;
_vehicleGroup		= _vehicleContainer select 2;

//The vehicle/group should ignore it's surroundings
_vehicle setVehicleRadar 2;
_vehicle setVehicleReportRemoteTargets FALSE;
_vehicle setVehicleReceiveRemoteTargets FALSE;
_vehicle setVehicleReportOwnPosition FALSE;
_vehicle setVariable ['QS_hidden',TRUE,TRUE];
_vehicle setVariable ['QS_dynSim_ignore',TRUE,TRUE];
_vehicle enableDynamicSimulation FALSE;
_array pushBack _vehicle;
{
	_vehicle disableAI _x;
} forEach [
	'TARGET',
	'AUTOTARGET',
	'COVER',
	'AUTOCOMBAT',
	'WEAPONAIM'
];
{
	//_x setCaptive TRUE;
	_x disableAI 'TARGET';
	_x disableAI 'AUTOTARGET';
	_x disableAI 'COVER';
	_x disableAI 'AUTOCOMBAT';
	_x disableAI 'WEAPONAIM';
	_x setSkill 0;
	_array pushBack _x;
} forEach (crew _vehicle);
_vehicleGroup allowFleeing 0;

//Fly height
_vehicle flyInHeight _height;

//Add waypoint

_waypoint = _vehicleGroup addWaypoint [_end, 0];

//Set waypoint properties
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointSpeed _speed;
_waypoint setWaypointForceBehaviour TRUE;

//The waypoint statements
//Once unit completes waypoint we clean up crew/vehicle/group
_waypoint setWaypointStatements [
	"TRUE",
	"
	if (!local this) exitWith {};
	_group = group this; 
	_vehicle = vehicle this; 
	{ deleteVehicle _x } forEach units _group; 
	deleteVehicle _vehicle; 
	deleteGroup _group;"
];
{
	(missionNamespace getVariable 'QS_garbageCollector') pushBack [_x,'DELAYED_FORCED',(time + 300)];
} forEach _array;