/*/
File: fn_AIXHeliInsert.sqf
Author:

	Quiksilver
	
Last modified:

	21/10/2017 A3 1.76 by Quiksilver
	
Description:

	AI Behaviour - Heli Insert
	
Parameters:

	0 - Position
	1 - Side
	2 - Helo type
	3 - # of units ( percentage of cargo seats )
	4 - Unit Types
	5 - Use support
	6 - Support type
	7 - Manage squad after
__________________________________________________/*/

params [
	['_position',[0,0,0]],
	['_side',EAST],
	['_heliType','O_Heli_Transport_04_covered_black_F'],
	['_nUnits',0.5],
	['_unitTypes',['O_V_Soldier_ghex_F']],
	['_useSupport',FALSE],
	['_supportType','O_Heli_Attack_02_dynamicLoadout_black_F'],
	['_useUnits',[]],
	['_manageGroup',FALSE]
];
missionNamespace setVariable ['QS_AI_insertHeli_helis',((missionNamespace getVariable 'QS_AI_insertHeli_helis') select {(alive _x)}),FALSE];
if (_heliType isEqualType []) then {
	_heliType = selectRandomWeighted _heliType;
};
if (_supportType isEqualType []) then {
	_supportType = selectRandomWeighted _supportType;
};
_worldName = worldName;
_worldSize = worldSize + 2000;
if (_unitTypes isEqualTo []) then {
	if (_side isEqualTo EAST) then {
		_unitTypes = [
			['o_soldier_f'],
			['o_t_soldier_f']
		] select (_worldName isEqualTo 'Tanoa');
	};
	if (_side isEqualTo WEST) then {
		_unitTypes = [
			['b_soldier_f'],
			['b_t_soldier_f']
		] select (_worldName isEqualTo 'Tanoa');
	};
	if (_side isEqualTo RESISTANCE) then {
		_unitTypes = ['i_soldier_f'];
	};
};
_flyInHeight = 50;
_mapEdgePositions = [
	[-1000,-1000,_flyInHeight],
	[-1000,_worldSize,_flyInHeight],
	[_worldSize,_worldSize,_flyInHeight],
	[_worldSize,-1000,_flyInHeight],
	[-1000,(_worldSize / 2),_flyInHeight],
	[(_worldSize / 2),_worldSize,_flyInHeight],
	[_worldSize,(_worldSize / 2),_flyInHeight],
	[(_worldSize / 2),-1000,_flyInHeight]
];

private _mapEdgePosition = selectRandom _mapEdgePositions;
private _testDist = 99999;
if ((random 1) > 0.333) then {
	{
		if ((_x distance2D _position) < _testDist) then {
			_testDist = _x distance2D _position;
			_mapEdgePosition = _x;
		};
	} forEach _mapEdgePositions;
} else {
	_mapEdgePosition = selectRandom _mapEdgePositions;
};
private _foundHLZ = FALSE;
private _HLZ = [0,0,0];
_helipadType = 'Land_HelipadEmpty_F';
for '_x' from 0 to 99 step 1 do {
	_HLZ = [_position,0,300,17,0,0.5,0] call (missionNamespace getVariable 'QS_fnc_findSafePos');
	if ((nearestObjects [_HLZ,[_helipadType],75,TRUE]) isEqualTo []) then {
		if ((nearestTerrainObjects [_HLZ,['TREE','SMALL TREE'],12,FALSE,TRUE]) isEqualTo []) then {
			if ((allPlayers findIf {((_x distance2D _HLZ) < 50)}) isEqualTo -1) then {
				if ((_HLZ distance2D _position) < 300) then {
					_foundHLZ = TRUE;
				};
			};
		};
	};
	if (_foundHLZ) exitWith {};
};
if (!(_foundHLZ)) exitWith {};
_HLZ set [2,0];
private _array = [];
_heli = createVehicle [_heliType,_mapEdgePosition,[],500,'FLY'];
_heli setVariable ['QS_dynSim_ignore',TRUE,TRUE];
_heli enableDynamicSimulation FALSE;
_heliGroup = createVehicleCrew _heli;
_array pushBack _heli;
{
	_x setVariable ['QS_dynSim_ignore',TRUE,TRUE];
	_x enableDynamicSimulation FALSE;
} forEach (units _heliGroup);
_heli setVariable ['QS_heli_spawnPosition',_mapEdgePosition,FALSE];
_heli setVariable ['QS_heli_centerPosition',_position,FALSE];
clearWeaponCargoGlobal _heli;
clearMagazineCargoGlobal _heli;
clearItemCargoGlobal _heli;
clearBackpackCargoGlobal _heli;
_heli lockInventory TRUE;
[_heli,1,[]] call (missionNamespace getVariable 'QS_fnc_vehicleLoadouts');
_heli engineOn TRUE;
_heli addEventHandler [
	'HandleDamage',
	{
		params ['_vehicle','_selectionName','_damage','','','','',''];
		private _scale = 0.2;
		_oldDamage = [(_vehicle getHit _selectionName),(damage _vehicle)] select (_selectionName isEqualTo '');
		if (_selectionName isEqualTo '?') then {
			_scale = 0.2;
		};
		if ((_vehicle getHit 'tail_rotor_hit') > 0) then {
			_vehicle setHit ['tail_rotor_hit',0,TRUE];
		};
		_damage = ((_damage - _oldDamage) * _scale) + _oldDamage;
		_damage;
	}
];
_heli addEventHandler [
	'Deleted',
	{
		params ['_entity'];
		{
			deleteVehicle _x;
		} forEach (crew _killed);
		_helipad = _entity getVariable ['QS_assignedHelipad',objNull];
		if (!isNull _helipad) then {
			deleteVehicle _helipad;
		};
	}
];
_heli addEventHandler [
	'Killed',
	{
		params ['_killed','','',''];
		{
			deleteVehicle _x;
		} forEach (crew _killed);
		_killed removeAllEventHandlers 'Hit';
		_killed removeAllEventHandlers 'HandleDamage';
		_helipad = _killed getVariable ['QS_assignedHelipad',objNull];
		if (!isNull _helipad) then {
			deleteVehicle _helipad;
		};
	}
];
_heli addEventHandler ['Killed',(missionNamespace getVariable 'QS_fnc_vKilled2')];
_heli addEventHandler [
	'GetOut',
	{
		(_this select 2) setDamage [1,TRUE];
	}
];
_heli addEventHandler [
	'IncomingMissile',
	{
		params ['_vehicle','_ammo','_shooter','_instigator'];
		private _projectile = nearestObject [_shooter,_ammo];
		if (alive (driver _vehicle)) then {
			(driver _vehicle) forceWeaponFire ['CMFlareLauncher','AIBurst'];
			[driver _vehicle,_shooter,_projectile] spawn {
				params ['_pilot','_shooter','_projectile'];
				scriptName 'QS Incoming Missile Flares';
				_pilot forceWeaponFire ['CMFlareLauncher','AIBurst'];
				sleep 1;
				_pilot forceWeaponFire ['CMFlareLauncher','AIBurst'];
				sleep 1;
				_pilot forceWeaponFire ['CMFlareLauncher','AIBurst'];
				(vehicle _pilot) setVehicleAmmo 1;
				[_projectile,objNull] remoteExec ['setMissileTarget',_shooter,FALSE];
			};
		};
	}
];
['setFeatureType',_heli,2] remoteExec ['QS_fnc_remoteExecCmd',-2,_heli];
_heliGroup enableAttack FALSE;
_heliGroup addVehicle _heli;
{
	_x allowDamage FALSE;
	_x addEventHandler [
		'GetOutMan',
		{
			(_this select 0) setDamage [1,TRUE];
		}
	];
	_x disableAI 'AUTOCOMBAT';
	_x disableAI 'COVER';
	_x disableAI 'TARGET';
	_x disableAI 'AUTOTARGET';
	_x disableAI 'SUPPRESSION';
	_x enableStamina FALSE;
	_x enableFatigue FALSE;
	_x setSkill 0;
	_x allowFleeing 0;
	removeAllWeapons _x;
	_array pushBack _x;
} forEach (units _heliGroup);
_heli setUnloadInCombat [FALSE,FALSE];
_heli allowCrewInImmobile TRUE;
_heli flyInHeight (25 + (random 30));
_heli lock 3;
_direction = _mapEdgePosition getDir _HLZ;
_heli setDir _direction;
(missionNamespace getVariable 'QS_AI_insertHeli_helis') pushBack _heli;
private _unit = objNull;
private _units = [];
private _spawnUnits = _useUnits isEqualTo [];
private _exit = FALSE;
if (_spawnUnits) then {
	_infantryGroup = createGroup [_side,TRUE];
};
_emptyPositions = _heli emptyPositions 'Cargo';
for '_x' from 0 to ((round (_emptyPositions * _nUnits)) - 1) step 1 do {
	if (_spawnUnits) then {
		_unitType = selectRandom _unitTypes;
		_unit = _infantryGroup createUnit [_unitType,[-100,-100,0],[],0,'NONE'];
	} else {
		if (!isNil {_useUnits select _x}) then {
			_unit = _useUnits select _x;
		} else {
			_exit = TRUE;
		};
	};
	if (_exit) exitWith {};
	_unit assignAsCargo _heli;
	_unit moveInCargo _heli;
	_unit setVariable ['QS_dynSim_ignore',TRUE,TRUE];
	_unit enableDynamicSimulation FALSE;
	_unit disableAI 'AUTOCOMBAT';
	_unit disableAI 'COVER';
	_unit enableStamina FALSE;
	_unit enableFatigue FALSE;
	_unit setVariable ['QS_AI_HELICARGO',TRUE,FALSE];
	_unit allowDamage FALSE;
	_unit setSkill 1;
	_unit = _unit call (missionNamespace getVariable 'QS_fnc_unitSetup');
	_unit addEventHandler [
		'GetOutMan',
		{
			(_this select 0) removeEventHandler ['GetOutMan',_thisEventHandler];
			(_this select 0) allowDamage TRUE;
		}
	];
	_units pushBack _unit;
};
if (!(_spawnUnits)) then {
	{
		if (!(_x in _units)) then {
			deleteVehicle _x;
		};
	} forEach _useUnits;
};
//comment 'Radial positions';
if (_spawnUnits) then {
	_infantryGroup enableAttack TRUE;
	[(units _infantryGroup),2] call (missionNamespace getVariable 'QS_fnc_serverSetAISkill');
	private _radialIncrement = 45;
	private _radialStart = round (random 360);
	_radialOffset = 100;
	private _radialPatrolPositions = [];
	private _patrolPosition = _position getPos [_radialOffset,_radialStart];
	if (!surfaceIsWater _patrolPosition) then {
		_radialPatrolPositions pushBack _patrolPosition;
	};
	for '_x' from 0 to 6 step 1 do {
		_radialStart = _radialStart + _radialIncrement;
		_patrolPosition = _position getPos [_radialOffset,_radialStart];
		if (!surfaceIsWater _patrolPosition) then {
			_radialPatrolPositions pushBack _patrolPosition;
		};
	};
	if (!(_radialPatrolPositions isEqualTo [])) then {
		_radialPatrolPositions = _radialPatrolPositions call (missionNamespace getVariable 'QS_fnc_arrayShuffle');
	};
	_infantryGroup setVariable ['QS_AI_GRP',TRUE,FALSE];
	_infantryGroup setVariable ['QS_AI_GRP_CONFIG',['GENERAL','INFANTRY',(count (units _infantryGroup))],FALSE];
	_infantryGroup setVariable ['QS_AI_GRP_DATA',[],FALSE];
	_infantryGroup setVariable ['QS_AI_GRP_TASK',['PATROL',_radialPatrolPositions,diag_tickTime,-1],FALSE];
};
_helipad = _helipadType createVehicleLocal _HLZ;
_array pushBack _helipad;
_heli setVariable ['QS_assignedHelipad',_helipad,FALSE];
_heliGroup setSpeedMode 'NORMAL';
_wp = _heliGroup addWaypoint [_HLZ,0];
_wp setWaypointType 'MOVE';		/*/ 'TR UNLOAD' /*/
_wp setWaypointSpeed 'NORMAL';
_wp setWaypointBehaviour 'CARELESS';
_wp setWaypointCombatMode 'BLUE';
_wp setWaypointStatements [
	'TRUE',
	'
		if (!(local this)) exitWith {};
		[this] spawn QS_fnc_AIXHeliInsertLanding;
	'
];
private _supportGroup = grpNull;
if (_useSupport) then {
	if ((count allPlayers) > 5) then {
		_supportSpawnPosition = _heli getRelPos [100,90];
		_supportSpawnPosition set [2,50];
		_supportHeli = createVehicle [_supportType,_supportSpawnPosition,[],0,'FLY'];
		_supportHeli setVariable ['QS_dynSim_ignore',TRUE,TRUE];
		_supportHeli enableDynamicSimulation FALSE;
		_supportGroup = createVehicleCrew _supportHeli;
		_array pushBack _supportHeli;
		{
			_x setSkill 1;
			_x setVariable ['QS_dynSim_ignore',TRUE,TRUE];
			_x enableDynamicSimulation FALSE;
			removeAllWeapons _x;
			_array pushBack _x;
		} forEach (units _supportGroup);	
		_supportHeli setDir _direction;
		[_supportHeli,1,[]] call (missionNamespace getVariable 'QS_fnc_vehicleLoadouts');
		(missionNamespace getVariable 'QS_AI_insertHeli_helis') pushBack _supportHeli;
		if ((random 1) > 0.333) then {
			_supportHeli flyInHeight (random [150,200,300]);
		};
		_supportGroup addVehicle _supportHeli;
		_supportHeli setUnloadInCombat [FALSE,FALSE];
		_supportHeli allowCrewInImmobile TRUE;
		_supportHeli lock 3;
		clearWeaponCargoGlobal _supportHeli;
		clearMagazineCargoGlobal _supportHeli;
		clearItemCargoGlobal _supportHeli;
		clearBackpackCargoGlobal _supportHeli;
		_supportHeli lockInventory TRUE;
		['setFeatureType',_supportHeli,2] remoteExec ['QS_fnc_remoteExecCmd',-2,_supportHeli];
		//[_supportHeli,1,[]] call (missionNamespace getVariable 'QS_fnc_vehicleLoadouts');
		_wp = _supportGroup addWaypoint [_HLZ,0];
		_wp setWaypointType 'LOITER';
		_wp setWaypointLoiterType 'CIRCLE_L';
		_wp setWaypointLoiterRadius (random [150,200,300]);
		//comment "_wp setWaypointType 'SAD';";
		_wp setWaypointBehaviour 'AWARE';
		_wp setWaypointCombatMode 'RED';
		_wp setWaypointForceBehaviour TRUE;
		_supportGroup setBehaviourStrong 'COMBAT';
		_supportGroup lockWP TRUE;
		_supportGroup enableAttack TRUE;
		_supportGroup setBehaviour 'COMBAT';
		_supportGroup setCombatMode 'RED';
		_supportGroup setSpeedMode 'FULL';
		_supportHeli addEventHandler [
			'Deleted',
			{
				params ['_entity'];
				{
					deleteVehicle _x;
				} forEach (crew _entity);
			}
		];
		_supportHeli addEventHandler [
			'Killed',
			{
				params ['_killed','','',''];
				{
					deleteVehicle _x;
				} forEach (crew _killed);
			}
		];
		_supportHeli addEventHandler ['Killed',(missionNamespace getVariable 'QS_fnc_vKilled2')];
		_supportHeli addEventHandler [
			'GetOut',
			{
				(_this select 2) setDamage [1,FALSE];
			}
		];
		_heli addEventHandler [
			'Hit',
			{
				params ['_vehicle','_causedBy','_damage','_instigator'];
				_supportGroup = _vehicle getVariable ['QS_heliInsert_supportGroup',grpNull];
				if (!isNull _supportGroup) then {
					_supportGroup reveal [_instigator,4];
				};
			}
		];
		_supportHeli addEventHandler [
			'IncomingMissile',
			{
				params ['_vehicle','_ammo','_shooter','_instigator'];
				private _projectile = nearestObject [_shooter,_ammo];
				if (alive (driver _vehicle)) then {
					(driver _vehicle) forceWeaponFire ['CMFlareLauncher','AIBurst'];
					[driver _vehicle,_shooter,_projectile] spawn {
						params ['_pilot','_shooter','_projectile'];
						scriptName 'QS Incoming Missile Flares';
						_pilot forceWeaponFire ['CMFlareLauncher','AIBurst'];
						sleep 1;
						_pilot forceWeaponFire ['CMFlareLauncher','AIBurst'];
						sleep 1;
						_pilot forceWeaponFire ['CMFlareLauncher','AIBurst'];
						(vehicle _pilot) setVehicleAmmo 1;
						if ((vehicle _shooter) isKindOf 'Air') then {
							[_projectile,objNull] remoteExec ['setMissileTarget',_shooter,FALSE];
						};
					};
				};
			}
		];
		_heli setVariable ['QS_heliInsert_supportHeli',_supportHeli,FALSE];
		_heli setVariable ['QS_heliInsert_supportGroup',_supportGroup,FALSE];
		_timeDelete = time + 900;
		{
			if (_x isEqualType objNull) then {
				0 = (missionNamespace getVariable 'QS_garbageCollector') pushBack [_x,'DELAYED_DISCREET',_timeDelete];
			};
		} forEach _array;
	};
};
if ((_manageGroup) && (_spawnUnits)) then {
	//comment 'Monitor';
	_timeout = time + 900;
	for '_x' from 0 to 1 step 0 do {
		if (!(((units _infantryGroup) findIf {(alive _x)}) isEqualTo -1)) then {
			{
				if (isNull (objectParent _x)) then {
					doStop _x;
					_x doMove [((_position select 0) + (10 - (random 20))),((_position select 1) + (10 - (random 20))),(_position select 2)];
				};
				sleep 0.1;
			} forEach (units _infantryGroup);
		};
		if (!isNull _supportGroup) then {
			if (!(((units _supportGroup) findIf {(alive _x)}) isEqualTo -1)) then {
				{
					if (!((behaviour _x) in ['COMBAT','AWARE'])) then {
						_x setBehaviour 'COMBAT';
					};				
				} forEach (units _supportGroup);
				if (!((combatMode _supportGroup) in ['RED','YELLOW'])) then {
					_supportGroup setCombatMode 'RED';
				};
			};
		};
		if (time > _timeout) exitWith {};
		sleep 10;
	};
};