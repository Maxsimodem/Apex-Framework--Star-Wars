/*/
File: fn_initPlayerLocal.sqf
Author:
	
	Quiksilver

Last modified:

	19/08/2022 A3 2.10 by Quiksilver
	
Description:

	Player Init
______________________________________________________/*/

if (!isNil {missionNamespace getVariable 'QS_init_doorCloser'}) exitWith {
	hint parseText 'Uho! It appears something has gone wrong. Please report this error code to staff:<br/><br/>191<br/><br/>Thank you for your assistance.';
};
diag_log format ['***** Mission Profile Namespace Loaded - %1 *****',isMissionProfileNamespaceLoaded];
if (!isMissionProfileNamespaceLoaded) then {
    saveMissionProfileNamespace;
	diag_log format ['***** Mission Profile Namespace Loaded - %1 *****',isMissionProfileNamespaceLoaded];
};
missionNamespace setVariable ['QS_init_doorCloser',TRUE,FALSE];
uiNamespace setVariable ['BIS_fnc_advHint_hintHandlers',TRUE];
['BASE'] call (missionNamespace getVariable 'QS_fnc_localObjects');
sleep 1;
private ['_validated','_playerClass','_reviveSetup','_roleDescription','_exit','_qs_1pv','_position','_qs_stamina','_stamina','_aimcoef','_spawnPos','_QS_radioChannels','_QS_radioChannels_profile'];
_exit = FALSE;
_uid = getPlayerUID player;
_roleDescription = roleDescription player;
_playerClass = typeOf player;
_validated = [_uid] call (missionNamespace getVariable 'QS_fnc_atNameCheck');
if (!(_validated)) exitWith {};
_fn_inString = missionNamespace getVariable 'QS_fnc_inString';
if (_uid in (['ALL'] call (missionNamespace getVariable 'QS_fnc_whitelist'))) then {
	_code = compileFinal "
		params ['','','','_array'];
		_array params ['_object','_action'];
		private _n = name _object;
		private _text = '';
		private _val = 9;
		if (_action isEqualTo 'KICK') then {_val = 9;};
		if (_action isEqualTo 'BAN') then {_val = 10;};
		if (!isNull _object) then {
			[42,[_object,_val,player]] remoteExec ['QS_fnc_remoteExec',2,FALSE];
			{
				player removeAction _x;
			} count (missionNamespace getVariable 'QS_kiddieActions');
			missionNamespace setVariable ['QS_kiddieActions',[],FALSE];
			systemChat format ['%1 %2',(str _n),localize 'STR_QS_Chat_135'];
			_text = format ['%1 %2',(str _n),localize 'STR_QS_Hints_124'];
			(missionNamespace getVariable 'QS_managed_hints') pushBack [3,FALSE,7.5,-1,_text,[],-1];
		} else {
			systemChat (localize 'STR_QS_Chat_136');
			(missionNamespace getVariable 'QS_managed_hints') pushBack [3,FALSE,7.5,-1,localize 'STR_QS_Hints_125',[],-1];
		};	
	";
	missionNamespace setVariable ['QS_fnc_actionEjectSuspect',_code,FALSE];
};
setPlayerRespawnTime 5;

/*/=========================== PLAYER JOIN TOKEN/*/

if (isNil {missionProfileNamespace getVariable 'QS_IA_joinToken'}) then {
	missionProfileNamespace setVariable ['QS_IA_joinToken',1];
} else {
	if ((missionProfileNamespace getVariable 'QS_IA_joinToken') isEqualType 0) then {
		missionProfileNamespace setVariable [
			'QS_IA_joinToken',
			((missionProfileNamespace getVariable 'QS_IA_joinToken') + 1)
		];
	} else {
		missionProfileNamespace setVariable ['QS_IA_joinToken',1];
	};
};
saveMissionProfileNamespace;

/*/=========================== STAMINA/SWAY/*/
player enableStamina TRUE;
if (isNil {missionProfileNamespace getVariable 'QS_stamina'}) then {
	if ((missionNamespace getVariable ['QS_missionConfig_stamina',0]) isEqualTo 0) then {
		player enableStamina FALSE;
	};
	player setCustomAimCoef 0.1;
	player setVariable ['QS_stamina',[(isStaminaEnabled player),0.1],FALSE];
	missionProfileNamespace setVariable ['QS_stamina',FALSE];
	saveMissionProfileNamespace;
} else {
	_qs_stamina = missionProfileNamespace getVariable ['QS_stamina',[TRUE,0.1]];
	if (_qs_stamina isEqualType []) then {
		_qs_stamina params ['_stamina','_aimcoef'];
		if (!(_aimcoef isEqualType 0)) then {
			_aimcoef = 0.1;
		};
		if ((missionNamespace getVariable ['QS_missionConfig_stamina',0]) isEqualTo 0) then {
			if (_stamina isEqualType TRUE) then {
				player enableStamina _stamina;
			} else {
				player enableStamina FALSE;
			};
		};
		if (!(_aimcoef isEqualType 0)) then {
			_aimcoef = 0.1;
		};
		player setCustomAimCoef _aimcoef;
		player setVariable ['QS_stamina',[(isStaminaEnabled player),_aimcoef],FALSE];
	} else {
		if ((missionNamespace getVariable ['QS_missionConfig_stamina',0]) isEqualTo 0) then {
			player enableStamina FALSE;
		};
		player setCustomAimCoef 0.1;
		player setVariable ['QS_stamina',[(isStaminaEnabled player),0.1],FALSE];
	};
};

/*/=========================== 1PV/*/

if ((allMissionObjects 'EmptyDetector') isNotEqualTo []) then {
	{
		if (local _x) then {
			if (!(_x getVariable ['QS_missionObject_protected',FALSE])) then {
				deleteVehicle _x;
			};
		};
	} forEach (allMissionObjects 'EmptyDetector');
};
if (isNil {missionProfileNamespace getVariable 'QS_1PV'}) then {
	player setVariable ['QS_1PV',[FALSE,time],FALSE];
	missionProfileNamespace setVariable ['QS_1PV',FALSE];
	saveMissionProfileNamespace;
} else {
	_qs_1pv = missionProfileNamespace getVariable 'QS_1PV';
	if (_qs_1pv isEqualType TRUE) then {
		player setVariable ['QS_1PV',[(missionProfileNamespace getVariable 'QS_1PV'),time],FALSE];
	};
};

/*/=========================== QUACKTAC HUD/*/

if (!isNil {missionProfileNamespace getVariable 'QS_QTHUD'}) then {
	private _QTHUD = missionProfileNamespace getVariable 'QS_QTHUD';
	if (_QTHUD isEqualType TRUE) then {
		if (_QTHUD) then {
			['Init'] call (missionNamespace getVariable 'QS_fnc_groupIndicator');
		};
	};
};

/*/========= UAV Operators/*/

0 spawn {
	uiSleep 3;
	if (!isNil {missionNamespace getVariable 'QS_atClientMisc'}) then {
		[nil,(missionNamespace getVariable 'QS_atClientMisc')] call (missionNamespace getVariable 'QS_fnc_atClientMisc');
		missionNamespace setVariable ['QS_atClientMisc',nil,FALSE];
	};
};

if (!isNil {missionNamespace getVariable 'RscMissionStatus_draw3D'}) then {
	removeMissionEventHandler ['Draw3D',(missionNamespace getVariable ['RscMissionStatus_draw3D',-1])];
};

/*/====================== MISSION NAMESPACE VARS/*/

private _weaponsList = configFile >> 'CfgWeapons';
{
	missionNamespace setVariable _x;
} forEach [
	['BIS_fnc_showNotification_queue',[],FALSE],
	['RscMissionStatus_draw3D',-9,FALSE],
	['QS_dynSim_script',scriptNull,FALSE],
	['QS_medSys',FALSE,FALSE],
	['QS_client_deltaVD',scriptNull,FALSE],
	['QS_earplug_EH_respawn',nil,FALSE],
	['QS_earplug_action',nil,FALSE],
	['QS_repairing_vehicle',FALSE,FALSE],
	['QS_jumpEnabled',FALSE,FALSE],
	['QS_revive_KilledInventory',(getUnitLoadout player),FALSE],
	['QS_sub_sd',FALSE,FALSE],
	['QS_sub_actions',[],FALSE],
	['QS_underEnforcement',FALSE,FALSE],
	['QS_exitingEnforcedVehicle',FALSE,FALSE],
	['QS_module_fob_client_timeLastRespawn',time,FALSE],
	['QS_client_radioChannels',[],FALSE],
	['QS_client_radioChannels_dynamic',[FALSE,FALSE],FALSE],
	['QS_client_heartbeat',-1,FALSE],
	['QS_client_infoPanels',[(infoPanel 'left'),(infoPanel 'right')],FALSE],
	['QS_draw2D_projectiles',[],FALSE],
	[
		'QS_veh_repair_mkrs',
		[
			'QS_marker_veh_baseservice_01',
			'QS_marker_veh_baseservice_02',
			'QS_marker_veh_baseservice_03',
			'QS_marker_veh_fieldservice_01',
			'QS_marker_veh_fieldservice_02',
			'QS_marker_veh_fieldservice_03',
			'QS_marker_veh_fieldservice_04'
		],
		FALSE
	],
	[
		'QS_veh_baseservice_mkrs',
		[
			'QS_marker_veh_baseservice_01',
			'QS_marker_veh_baseservice_02',
			'QS_marker_veh_baseservice_03'
		],
		FALSE
	],
	[
		'QS_veh_fieldservice_mkrs',
		[		/*/field service markers/*/
			'QS_marker_veh_fieldservice_01',
			'QS_marker_veh_fieldservice_02',
			'QS_marker_veh_fieldservice_03',
			'QS_marker_veh_fieldservice_04'
		],
		FALSE
	],
	[
		'QS_veh_heliservice_mkrs',
		[
			'QS_marker_veh_baseservice_02'
		],
		FALSE
	],
	[
		'QS_veh_planeservice_mkrs',
		[
			'QS_marker_veh_baseservice_03'
		],
		FALSE
	],
	[
		'QS_veh_airservice_mkrs',
		[
			'QS_marker_veh_fieldservice_04'
		],
		FALSE
	],
	[
		'QS_veh_landservice_mkrs',
		[
			'QS_marker_veh_baseservice_01',
			'QS_marker_veh_fieldservice_01',
			'QS_marker_veh_fieldservice_02',
			'QS_marker_veh_fieldservice_03'
		],
		FALSE
	],
	[
		'QS_veh_inventory_mkrs',
		[
			'QS_marker_veh_inventoryService_01',
			'QS_marker_crate_area'
		],
		FALSE
	],
	['QS_script_incapacitated',scriptNull,FALSE],
	['QS_missionStatus_shown',TRUE,FALSE],
	['QS_draw3D_projectiles',[],FALSE],
	['QS_anim_script',scriptNull,FALSE],
	['QS_client_triggerGearCheck',TRUE,FALSE],
	['QS_client_medicIcons_units',[],FALSE],
	['QS_client_AIBehaviours_script',scriptNull,FALSE],
	[
		'QS_client_baseIcons',
		[
			[
				'a3\ui_f\data\igui\cfg\cursors\iconRepairAt_ca.paa',
				[1,1,1,1],
				(markerPos 'QS_marker_veh_baseservice_01'),
				1.5,
				1.5,
				0
			],
			[
				'a3\ui_f\data\igui\cfg\cursors\iconRepairAt_ca.paa',
				[1,1,1,1],
				(markerPos 'QS_marker_veh_baseservice_02'),
				1.5,
				1.5,
				0
			],
			[
				'a3\ui_f\data\igui\cfg\cursors\iconRepairAt_ca.paa',
				[1,1,1,1],
				(markerPos 'QS_marker_veh_baseservice_03'),
				1.5,
				1.5,
				0
			],
			[
				'a3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa',
				[1,1,1,1],
				(markerPos 'QS_marker_veh_inventoryService_01'),
				0.75,
				0.75,
				0
			]
		],
		FALSE
	],
	['QS_client_action_carrierLaunchCancel',[],FALSE],
	['QS_managed_hints',[],FALSE],
	['QS_projectile_manager',[],FALSE],
	['QS_vehicle_incomingMissiles',[],FALSE],
	['QS_HUD_show3DHex',(missionProfileNamespace getVariable ['QS_HUD_show3DHex',TRUE]),FALSE],
	['QS_HUD_toggleChatSpam',(missionProfileNamespace getVariable ['QS_HUD_toggleChatSpam',TRUE]),FALSE],
	['QS_HUD_toggleSuppression',(missionProfileNamespace getVariable ['QS_HUD_toggleSuppression',TRUE]),FALSE],
	['QS_HUD_toggleHitMarker',(missionProfileNamespace getVariable ['QS_HUD_toggleHitMarker',TRUE]),FALSE],
	['QS_heli_takeover_action',-1,FALSE],
	['QS_aircraft_critHit_array',[],FALSE],
	['QS_enabledWaypoints',(difficultyOption 'waypoints'),FALSE],
	['QS_managed_flares',[],FALSE],
	['QS_client_sendAccuracy',FALSE,FALSE],
	['QS_client_loadoutTarget',objNull,FALSE],
	['QS_hashmap_tracers',createHashMapFromArray (call QS_data_tracers),FALSE],
	['QS_hashmap_rockets',createHashMapFromArray (call QS_data_rockets),FALSE],
	['QS_session_weaponsList',((missionProfileNamespace getVariable ['QS_profile_weaponsList',[]]) select {(isClass (_weaponsList >> _x))})],
	['QS_session_magazineList',[]],
	['QS_session_weaponMagazines',createHashMap],
	['QS_client_hashmap_ammoConfig',createHashMap],
	['QS_client_ragdoll_script',scriptNull]
];
_weaponsList = nil;
if ((missionProfileNamespace getVariable ['QS_IA_joinToken',0]) < 10) then {
	if ((missionNamespace getVariable ['QS_arsenals',[]]) isNotEqualTo []) then {
		{
			(missionNamespace getVariable 'QS_client_baseIcons') pushBack [
				'a3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa',
				[1,1,1,1],
				[((position _x) # 0),((position _x) # 1),(((position _x) # 2) - 1)],
				0.75,
				0.75,
				0
			];
		} forEach (missionNamespace getVariable ['QS_arsenals',[]]);
	};
};
if (([] call (missionNamespace getVariable 'QS_fnc_clientGetSupporterLevel')) > 0) then {
	missionNamespace setVariable ['BIS_dg_fia',nil,FALSE];
};

/*/====================== UI VARS/*/
{
	uiNamespace setVariable _x;
} forEach [
	['RscMissionStatus_display',displayNull],
	['BIS_fnc_advHint_hintHandlers',TRUE],
	['RscEGSpectator_availableInsignias',((configFile >> 'CfgUnitInsignia') call (missionNamespace getVariable 'BIS_fnc_getCfgSubClasses'))],
	['QS_ui_timeLastRadioIn',diag_tickTime],
	['QS_ui_timeLastRadioOut',diag_tickTime],
	['QS_ui_mousePosition',getMousePosition],
	['QS_client_menu_interaction',FALSE]
];

/*/====================== PLAYER OBJECT VARS/*/
{
	player setVariable _x;
} forEach [
	['BIS_noCoreConversations',TRUE,FALSE],
	['QS_soundVolume',soundVolume,FALSE],
	['QS_combatDeafness',time,FALSE],
	['QS_seated',FALSE,FALSE],
	['QS_repackingMagazines',time,FALSE],
	['QS_animDone',FALSE,FALSE],
	['QS_revive_respawnType','',FALSE],
	['QS_RD_earplugs',FALSE,FALSE],
	['QS_RD_soundVolume',soundVolume,FALSE],
	['QS_earsCollected_session',0,FALSE],
	['QS_revive_killedVehiclePosition',[],FALSE],
	['QS_backpack_data',[(backpack player),(backpackItems player),(backpackMagazines player)],FALSE],
	['QS_backpack_lockState',FALSE,TRUE],
	['QS_backpack_lockTime',(time + 1),FALSE],
	['QS_client_vehicleEventHandlers',[],FALSE],
	['QS_client_afkTimeout',time,FALSE],
	['QS_client_hqLastSmoke',time,FALSE],
	['QS_client_assembledWeapons',[],FALSE],
	['QS_client_createdBoat',objNull,FALSE],
	['QS_client_lastGesture',time,FALSE],
	['QS_client_sectorScanLastRequest',time,FALSE],
	['QS_client_hc_waypoint',[],FALSE],
	['QS_client_uiLastAction',diag_tickTime,FALSE],
	['QS_client_soundControllers',[(getAllSoundControllers (vehicle player)),(getAllEnvSoundControllers (getPosWorld player))],FALSE],
	['QS_client_lastMedevacRequest',diag_tickTime,FALSE],
	['QS_respawn_disable',-1,FALSE],
	['QS_client_medevacRequested',FALSE,FALSE],
	['QS_client_inBaseArea',FALSE,FALSE],
	['QS_client_inFOBArea',FALSE,FALSE],
	['QS_client_inCarrierArea',FALSE,FALSE],
	['QS_client_inDestroyerArea',FALSE,FALSE],
	['QS_client_revivedAtHospital',-1,FALSE],
	['QS_client_animCancel',FALSE,FALSE],
	['QS_client_currentAnim',(animationState player),FALSE],
	['QS_client_playerViewChanged',TRUE,FALSE],
	['QS_module_fob_client_respawnEnabled',TRUE,TRUE],
	['QS_client_shots',0,FALSE],
	['QS_client_hits',0,FALSE],
	['QS_client_shots_sniper',0,FALSE],
	['QS_client_hits_sniper',0,FALSE]
];
/*/===== Remove BI Event Handlers/*/

/*/	This removes some unnecessary BIS stuff, but also breaks some mods
{
	player removeAllEventHandlers _x;
} forEach [
	'PostReset',
	'SoundPlayed',
	'HandleDamage',
	'Explosion',
	'Respawn'
];
/*/

// Remove BIS Zeus stuff
if (!isNil {player getVariable 'BIS_fnc_addCuratorPlayer_handler'}) then {
	player removeMPEventHandler ['MPRespawn',(player getVariable 'BIS_fnc_addCuratorPlayer_handler')];
};
/*/ Add Scripted Event Handlers /*/
{
	_x call (missionNamespace getVariable 'BIS_fnc_addScriptedEventHandler');
} forEach [
	[missionNamespace,'arsenalClosed',(missionNamespace getVariable 'QS_fnc_clientEventArsenalClosed')],
	[missionNamespace,'arsenalOpened',(missionNamespace getVariable 'QS_fnc_clientEventArsenalOpened')]
];
/*/ Add Mission Event Handlers /*/
{
	addMissionEventHandler _x;
} forEach [
	['Draw3D',{call (missionNamespace getVariable 'QS_fnc_clientEventDraw3D')}],
	['MapSingleClick',{call (missionNamespace getVariable 'QS_fnc_clientEventMapSingleClick')}],
	['Map',{call (missionNamespace getVariable 'QS_fnc_clientEventMap')}],
	['PlayerViewChanged',{call (missionNamespace getVariable 'QS_fnc_clientEventPlayerViewChanged')}],
	[
		'Map',
		{
			params ['_mapIsOpened','_mapIsForced'];
			((findDisplay 12) displayCtrl 51) ctrlMapAnimAdd [0.25,0.75,player];
			ctrlMapAnimCommit ((findDisplay 12) displayCtrl 51);
			removeMissionEventHandler [_thisEvent,_thisEventHandler];
			0 spawn {
				uiSleep 1;
				ctrlMapAnimClear ((findDisplay 12) displayCtrl 51);
			};
		}
	],
	['HandleChatMessage',{call (missionNamespace getVariable 'QS_fnc_clientEventHandleChatMessage')}]
];
{
	inGameUISetEventHandler _x;
} forEach [
	['Action',"_this call (missionNamespace getVariable 'QS_fnc_clientInGameUIAction');"],
	['NextAction',"_this call (missionNamespace getVariable 'QS_fnc_clientInGameUINextAction');"],
	['PrevAction',"_this call (missionNamespace getVariable 'QS_fnc_clientInGameUIPrevAction');"]
];
{
	player addEventHandler _x;
} forEach [
	['FiredMan',{call (missionNamespace getVariable 'QS_fnc_clientEventFiredMan')}],
	['Respawn',{call (missionNamespace getVariable 'QS_fnc_clientEventRespawn')}],
	['Killed',{call (missionNamespace getVariable 'QS_fnc_clientEventKilled')}],
	['Explosion',{call (missionNamespace getVariable 'QS_fnc_clientEventExplosion')}],
	['WeaponAssembled',{call (missionNamespace getVariable 'QS_fnc_clientEventWeaponAssembled')}],
	['WeaponDisassembled',{call (missionNamespace getVariable 'QS_fnc_clientEventWeaponDisassembled')}],
	['Hit',{call (missionNamespace getVariable 'QS_fnc_clientEventHit')}],
	['HandleDamage',{call (missionNamespace getVariable 'QS_fnc_clientEventHandleDamage')}],
	['FiredNear',{call (missionNamespace getVariable 'QS_fnc_clientEventFiredNear')}],
	//['GestureChanged',{call (missionNamespace getVariable 'QS_fnc_clientEventGestureChanged')}],					// These execute frequently when player is moving, only use if you have a reason. Test out in editor
	//['GestureDone',{call (missionNamespace getVariable 'QS_fnc_clientEventGestureDone')}],						// These execute frequently when player is moving, only use if you have a reason. Test out in editor
	['GetInMan',{call (missionNamespace getVariable 'QS_fnc_clientEventGetInMan')}],
	['GetOutMan',{call (missionNamespace getVariable 'QS_fnc_clientEventGetOutMan')}],
	['SeatSwitchedMan',{call (missionNamespace getVariable 'QS_fnc_clientEventSeatSwitchedMan')}],
	['Suppressed',{call (missionNamespace getVariable 'QS_fnc_clientEventSuppressed')}],
	['Reloaded',{call (missionNamespace getVariable 'QS_fnc_clientEventReloaded')}],
	['WeaponDeployed',{}],
	['WeaponRested',{}],
	['Take',{call (missionNamespace getVariable 'QS_fnc_clientEventTake')}],
	['Put',{call (missionNamespace getVariable 'QS_fnc_clientEventPut')}],
	['SoundPlayed',{call (missionNamespace getVariable 'QS_fnc_clientEventSoundPlayed')}],
	['InventoryOpened',{call (missionNamespace getVariable 'QS_fnc_clientEventInventoryOpened')}],
	['InventoryClosed',{call (missionNamespace getVariable 'QS_fnc_clientEventInventoryClosed')}],
	['HandleRating',{call (missionNamespace getVariable 'QS_fnc_clientEventHandleRating')}],
	['HandleHeal',{call (missionNamespace getVariable 'QS_fnc_clientEventHandleHeal')}],
	['AnimChanged',{call (missionNamespace getVariable 'QS_fnc_clientEventAnimChanged')}],
	['AnimDone',{call (missionNamespace getVariable 'QS_fnc_clientEventAnimDone')}],
	['AnimStateChanged',{}],
	['TaskSetAsCurrent',{call (missionNamespace getVariable 'QS_fnc_clientEventTaskSetAsCurrent')}],
	['PostReset',{call (missionNamespace getVariable 'QS_fnc_clientEventPostReset')}],
	['OpticsModeChanged',{call (missionNamespace getVariable 'QS_fnc_clientEventOpticsModeChanged')}],
	['OpticsSwitch',{call (missionNamespace getVariable 'QS_fnc_clientEventOpticsSwitch')}]
];
{
	addMusicEventHandler _x;
} forEach [
	['MusicStart',{}],
	['MusicStop',{}]
];
// Preload Arsenal
[player] call (missionNamespace getVariable 'QS_fnc_clientArsenal');
{
	if (simulationEnabled _x) then {
		if ((player knowsAbout _x) < 3) then {
			player reveal [_x,3];
		};
	};
} count ((getPosATL player) nearObjects ['All',30]);
if (!isNil {missionNamespace getVariable 'QS_arsenals'}) then {
	if ((missionNamespace getVariable 'QS_arsenals') isEqualType []) then {
		if ((count (missionNamespace getVariable 'QS_arsenals')) > 0) then {
			{
				if ((player knowsAbout _x) < 3) then {
					player reveal [_x,3];
				};
			} count (missionNamespace getVariable 'QS_arsenals');
		};
	};
};
0 spawn {
	uiSleep 1;
	if ((getPlayerUID player) in (['S3'] call (missionNamespace getVariable 'QS_fnc_whitelist'))) then {
		//comment 'Insignia';
		if (!isNil {missionProfileNamespace getVariable 'QS_ClientUnitInsignia2'}) then {
			if ((missionProfileNamespace getVariable 'QS_ClientUnitInsignia2') isEqualType '') then {
				if ((missionProfileNamespace getVariable 'QS_ClientUnitInsignia2') isNotEqualTo '') then {
					player setVariable ['QS_ClientUnitInsignia2',(missionProfileNamespace getVariable 'QS_ClientUnitInsignia2'),FALSE];
					[(missionProfileNamespace getVariable 'QS_ClientUnitInsignia2')] call (missionNamespace getVariable 'QS_fnc_clientSetUnitInsignia');
				};
			};
		};
		//comment 'Uniform';
		if (!isNil {missionProfileNamespace getVariable 'QS_ClientUTexture2'}) then {
			if ((missionProfileNamespace getVariable 'QS_ClientUTexture2') isEqualType '') then {
				if ((missionProfileNamespace getVariable 'QS_ClientUTexture2') isNotEqualTo '') then {
					if (!isNil {missionProfileNamespace getVariable 'QS_ClientUTexture2_Uniforms2'}) then {
						if ((missionProfileNamespace getVariable 'QS_ClientUTexture2_Uniforms2') isEqualType []) then {
							if ((missionProfileNamespace getVariable 'QS_ClientUTexture2_Uniforms2') isNotEqualTo []) then {
								if ((uniform player) in (missionProfileNamespace getVariable 'QS_ClientUTexture2_Uniforms2')) then {
									player setObjectTextureGlobal [0,(missionProfileNamespace getVariable 'QS_ClientUTexture2')];
									player setVariable ['QS_ClientUTexture2',(missionProfileNamespace getVariable 'QS_ClientUTexture2'),FALSE];
									player setVariable ['QS_ClientUTexture2_Uniforms2',(missionProfileNamespace getVariable 'QS_ClientUTexture2_Uniforms2'),FALSE];
									if ((vest player) isNotEqualTo '') then {
									
									};
									if ((backpack player) isNotEqualTo '') then {
									
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
private _itemToRemove = '';
if ((backpack player) isNotEqualTo '') then {
	_maxLoadBackpack = 1;
	if ((loadBackpack player) > _maxLoadBackpack) then {
		while {((loadBackpack player) > _maxLoadBackpack)} do {
			_itemToRemove = selectRandom ((backpackItems player) + (backpackMagazines player));
			if (!(_itemToRemove in ['ToolKit','Medikit'])) then {
				player removeItemFromBackpack _itemToRemove;
			};
		};
	};
};
if ((vest player) isNotEqualTo '') then {
	_maxLoadVest = 1;
	if ((loadVest player) > _maxLoadVest) then {
		while {((loadVest player) > _maxLoadVest)} do {
			_itemToRemove = selectRandom ((vestItems player) + (vestMagazines player));
			player removeItemFromVest _itemToRemove;
		};
	};
};
if ((uniform player) isNotEqualTo '') then {
	_maxLoadUniform = 1;
	if ((loadUniform player) > _maxLoadUniform) then {
		while {((loadUniform player) > _maxLoadUniform)} do {
			_itemToRemove = selectRandom ((uniformItems player) + (uniformMagazines player));
			player removeItemFromUniform _itemToRemove;
		};
	};	
};
0 spawn (missionNamespace getVariable 'QS_fnc_clientDiary');
0 spawn (missionNamespace getVariable 'QS_fnc_icons');
call (missionNamespace getVariable 'AR_Advanced_Rappelling_Install');
enableDynamicSimulationSystem FALSE;
disableRemoteSensors TRUE;
calculatePlayerVisibilityByFriendly FALSE;
useAISteeringComponent FALSE;
enableEngineArtillery ((missionNamespace getVariable ['QS_missionConfig_artyEngine',1]) isEqualTo 2);
if (isNil {missionProfileNamespace getVariable 'QS_options_ambientLife'}) then {
	missionProfileNamespace setVariable ['QS_options_ambientLife',TRUE];
	enableEnvironment [TRUE,TRUE];
	saveMissionProfileNamespace;
} else {
	_ambientLife = missionProfileNamespace getVariable 'QS_options_ambientLife';
	if (!(_ambientLife isEqualType TRUE)) then {
		missionProfileNamespace setVariable ['QS_options_ambientLife',TRUE];
		enableEnvironment [TRUE,TRUE];
		saveMissionProfileNamespace;
	} else {
		enableEnvironment [(missionProfileNamespace getVariable 'QS_options_ambientLife'),TRUE];
	};
};
if (missionProfileNamespace getVariable ['QS_options_dynSim',FALSE]) then {
	missionNamespace setVariable ['QS_options_dynSim',TRUE,FALSE];
	missionNamespace setVariable [
		'QS_dynSim_script',
		(1 spawn (missionNamespace getVariable 'QS_fnc_clientSimulationManager')),
		FALSE
	];
};
0 fadeSpeech 1;
enableSentences FALSE;
showSubtitles FALSE;
enableSaving [FALSE,FALSE];
enableTeamSwitch FALSE;
player disableConversation TRUE;
player setUnitFreefallHeight 50;
if ((rank player) isNotEqualTo 'PRIVATE') then {
	player setRank 'PRIVATE';
};
if ((toLowerANSI (speaker player)) isNotEqualTo 'novoice') then {
	player setSpeaker 'NoVoice';
};
player addRating (0 - (rating player));
{
	player enableAIFeature [_x,FALSE];
} count [
	'TEAMSWITCH',
	'FSM',
	'AIMINGERROR',
	'COVER',
	'AUTOCOMBAT'
];
player enableAIFeature ['MOVE',TRUE];
if (isNil {(group player) getVariable 'BIS_dg_reg'}) then {
	_allGroups = allGroups select {(((side _x) isEqualTo (player getVariable ['QS_unit_side',WEST])) && (isPlayer (leader _x)) && (!isNil {_x getVariable 'BIS_dg_reg'}) && (!(_x getVariable ['BIS_dg_pri',FALSE])))};
	if (_allGroups isNotEqualTo []) then {
		private _allGroupsSorted = [];
		{
			_allGroupsSorted pushBack [(count (units _x)),_x];
		} forEach _allGroups;
		_allGroupsSorted sort FALSE;
		if (_allGroups isNotEqualTo []) then {
			[player] joinSilent ((_allGroupsSorted # 0) # 1);
		};
	};
};
_squadParams = squadParams player;
if (_squadParams isNotEqualTo []) then {
	_squadName = (_squadParams # 0) # 0;
	private _exit3 = FALSE;
	{
		if ((side (group _x)) isEqualTo (player getVariable ['QS_unit_side',WEST])) then {
			if ((squadParams _x) isNotEqualTo []) then {
				if ((((squadParams _x) # 0) # 0) isEqualTo _squadName) then {
					[player] joinSilent (group _x);
					_exit3 = TRUE;
				};
			};
			if (_exit3) exitWith {};
		};
	} forEach allPlayers;
};
if (worldName isEqualTo 'Stratis') then {
	private _terrainLocation = nearestLocation [[3764.32,7944.11,0.0131321],'nameLocal'];
	private _editableLocation = createLocation [_terrainLocation];
	_editableLocation setText 'Rarek Island';
};
[29,(missionNamespace getVariable 'QS_module_fob_side')] call (missionNamespace getVariable 'QS_fnc_remoteExec');
[] call (missionNamespace getVariable 'QS_fnc_clientBaseLights');
[1] call (missionNamespace getVariable 'QS_fnc_aoFires');
if (!isNil {missionNamespace getVariable 'QS_setFeatureType'}) then {
	if ((missionNamespace getVariable 'QS_setFeatureType') isEqualType []) then {
		if ((missionNamespace getVariable 'QS_setFeatureType') isNotEqualTo []) then {
			{
				(_x # 0) setFeatureType (_x # 1);
			} forEach (missionNamespace getVariable 'QS_setFeatureType');
		};
	};
};

/*/================= Radio Channels/*/

enableRadio TRUE;
{
	(_x # 0) enableChannel (_x # 1);
} count [
	[0,[FALSE,FALSE]],
	[1,[TRUE,FALSE]],
	[2,[TRUE,TRUE]],
	[3,[TRUE,TRUE]],
	[4,[TRUE,TRUE]],
	[5,[TRUE,TRUE]]
];
if (currentChannel isEqualTo 4) then {
	setCurrentChannel 5;
};
private _QS_radioChannels = [1];
if ((player getUnitTrait 'QS_trait_pilot') || {(player getUnitTrait 'uavhacker')} || {(player getUnitTrait 'QS_trait_HQ')}) then {
	_QS_radioChannels pushBack 2;
};
{
	[1,_x] call (missionNamespace getVariable 'QS_fnc_clientRadio');
} forEach _QS_radioChannels;
if (isNil {missionProfileNamespace getVariable 'QS_client_radioChannels_profile'}) then {
	missionProfileNamespace setVariable ['QS_client_radioChannels_profile',[FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE]];
	saveMissionProfileNamespace;
} else {
	_QS_radioChannels_profile = missionProfileNamespace getVariable ['QS_client_radioChannels_profile',[FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE]];
	if ((count _QS_radioChannels_profile) isEqualTo 10) then {
		if ((_QS_radioChannels_profile # 2) isEqualType TRUE) then {
			if (_QS_radioChannels_profile # 2) then {
				missionNamespace setVariable [
					'QS_client_radioChannels_dynamic',
					[
						TRUE,
						((missionNamespace getVariable 'QS_client_radioChannels_dynamic') # 1)
					],
					FALSE
				];
			};
		};
		if ((_QS_radioChannels_profile # 3) isEqualType TRUE) then {
			if (_QS_radioChannels_profile # 3) then {
				missionNamespace setVariable [
					'QS_client_radioChannels_dynamic',
					[
						((missionNamespace getVariable 'QS_client_radioChannels_dynamic') # 0),
						TRUE
					],
					FALSE
				];
			};
		};
		if ((_QS_radioChannels_profile # 4) isEqualType TRUE) then {
			if (_QS_radioChannels_profile # 4) then {
				[1,5] call (missionNamespace getVariable 'QS_fnc_clientRadio');
			};
		};
		if ((_QS_radioChannels_profile # 5) isEqualType TRUE) then {
			if (_QS_radioChannels_profile # 5) then {
				[1,6] call (missionNamespace getVariable 'QS_fnc_clientRadio');
			};
		};
		if ((_QS_radioChannels_profile # 6) isEqualType TRUE) then {
			if (_QS_radioChannels_profile # 6) then {
				[1,7] call (missionNamespace getVariable 'QS_fnc_clientRadio');
			};
		};
		if ((_QS_radioChannels_profile # 7) isEqualType TRUE) then {
			if (_QS_radioChannels_profile # 7) then {
				[1,8] call (missionNamespace getVariable 'QS_fnc_clientRadio');
			};
		};
	};
};
if (isNil {uiNamespace getVariable 'QS_hasJoinedSession'}) then {
	uiNamespace setVariable ['QS_hasJoinedSession',TRUE];
	if ((random 1) > 0.333) then {
		_track = selectRandomWeighted [
			'Intro',0.1,
			'Intro2',0.1,
			'Intro3',0.1,
			'Intro4',0.1,
			'Intro5',0.1,
			'Intro6',0.1
		];
		if (isClass (missionConfigFile >> 'CfgSounds' >> _track)) then {
			playSound [_track,FALSE];
		};
	} else {
		1 fadeMusic 0.333;
		_musicClasses = [
			['EventTrack01_F_Jets',0.1],			// Track + probability weighting
			['LeadTrack01_F_Jets',0.1],
			['LeadTrack02_F_Jets',0.1],
			['AmbientTrack02_F_Exp',0.1],
			['AmbientTrack02a_F_Exp',0.1],
			['AmbientTrack02b_F_Exp',0.1],
			['AmbientTrack02c_F_Exp',0.1],
			['AmbientTrack02d_F_Exp',0.1],
			['AmbientTrack01_F_Orange',0.1],
			['AmbientTrack02_F_Orange',0.1],
			['LeadTrack01_F_Orange',0.1],
			['LeadTrack01_F_Malden',0.1],
			['AmbientTrack04a_F_Tacops',0.1],
			['AmbientTrack04b_F_Tacops',0.1],
			['LeadTrack01_F_Tank',0.1],
			['LeadTrack02_F_Tank',0.1],
			['LeadTrack03_F_Tank',0.1],
			['LeadTrack04_F_Tank',0.1],
			['LeadTrack05_F_Tank',0.1],
			['LeadTrack06_F_Tank',0.1]
		];
		private _music = [];
		{
			if (isClass (configFile >> 'CfgMusic' >> (_x # 0))) then {
				_music pushBack (_x # 0);
				_music pushBack (_x # 1);
			};
		} forEach _musicClasses;
		playMusic [(selectRandomWeighted _music),0];
	};
};
0 spawn (missionNamespace getVariable 'QS_fnc_clientCore');
if (userInputDisabled) then {
	disableUserInput FALSE;
};