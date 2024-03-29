/*/
File: fn_clientInteractSit.sqf
Author:

	Quiksilver
	
Last Modified:

	27/11/2022 A3 2.10 by Quiksilver
	
Description:

	Sit Down / Stand Up
_____________________________________/*/

_type = _this # 3;
_chairTypes = [
	'land_campingchair_v1_f',
	'land_campingchair_v2_f',
	'land_chairplastic_f',
	'land_rattanchair_01_f',
	'land_chairwood_f',
	'land_officechair_01_f',
	'land_armchair_01_f'
];
_chairModels = [
	'campingchair_v1_f.p3d',
	'campingchair_v2_f.p3d',
	'chairplastic_f.p3d',
	'rattanchair_01_f.p3d',
	'chairwood_f.p3d',
	'officechair_01_f.p3d',
	'armchair_01_f.p3d'
];
_sittingAnimations = [
	'hubsittingchaira_idle1','hubsittingchaira_idle2','hubsittingchaira_idle3',
	'hubsittingchairb_idle1','hubsittingchairb_idle2','hubsittingchairb_idle3',
	'hubsittingchairc_idle1','hubsittingchairc_idle2','hubsittingchairc_idle3',
	'hubsittingchairua_idle1','hubsittingchairua_idle2','hubsittingchairua_idle3',
	'hubsittingchairub_idle1','hubsittingchairub_idle2','hubsittingchairub_idle3',
	'hubsittingchairuc_idle1','hubsittingchairuc_idle2','hubsittingchairuc_idle3'
];
if (_type isEqualTo 0) then {
	if (!isNull (attachedTo player)) then {
		detach (attachedTo player);
	};
	_posInFront = player modelToWorldWorld [0,0.5,0];
	player setPosWorld _posInFront;
	if ((stance player) isNotEqualTo 'STAND') then {
		['switchMove',player,(player getVariable ['QS_seated_oldAnimState',''])] remoteExec ['QS_fnc_remoteExecCmd',0,FALSE];
	};
	if (!isNil {player getVariable 'QS_interact_actionStand'}) then {
		player removeAction (player getVariable 'QS_interact_actionStand');
		player setVariable ['QS_interact_actionStand',nil,FALSE];
	};
	player setVariable ['QS_seated_oldAnimState',nil,FALSE];
};
if (_type isEqualTo 1) then {
	_object = cursorObject;
	
	if (
		((player distance2D _object) > 2.5) ||
		{((!((toLowerANSI (typeOf _object)) in _chairTypes)) && {(!((toLowerANSI ((getModelInfo _object) # 0)) in _chairModels))})} ||
		{((attachedObjects _object) isNotEqualTo [])} ||
		{(!isNull (attachedTo _object))} ||
		{((stance player) isNotEqualTo 'STAND')}
	) exitWith {};
	if ((((getPosATL _object) nearEntities ['Man',0.75]) select {(_x isNotEqualTo player)}) isNotEqualTo []) exitWith {
		50 cutText [localize 'STR_QS_Text_145','PLAIN DOWN'];
	};
	if ((toLowerANSI (animationState player)) in _sittingAnimations) exitWith {
		50 cutText [localize 'STR_QS_Text_146','PLAIN DOWN'];
	};
	if (local _object) then {
		_object setVectorUp [0,0,1];
	} else {
		[36.5,_object] remoteExecCall ['QS_fnc_remoteExec',_object,FALSE];
	};
	_sittingAnimation = selectRandom _sittingAnimations;
	if (simulationEnabled _object) then {
		[39,_object,FALSE,profileName,(getPlayerUID player)] remoteExecCall ['QS_fnc_remoteExec',2,FALSE];
	};
	player setVariable ['QS_seated_oldAnimState',(animationState player),FALSE];
	['switchMove',player,_sittingAnimation] remoteExec ['QS_fnc_remoteExecCmd',0,FALSE];
	private _attachY = -0.1;
	if (((toLowerANSI (typeOf _object)) in ['land_armchair_01_f']) || {((toLowerANSI ((getModelInfo _object) # 0)) in ['armchair_01_f.p3d'])}) then {
		_attachY = 0;
	};
	player attachTo [_object,[0,_attachY,0]];
	player setVariable [
		'QS_interact_actionStand',
		(player addAction [localize 'STR_QS_Interact_066',(missionNamespace getVariable 'QS_fnc_clientInteractSit'),0,49,FALSE,TRUE,'','TRUE',-1,FALSE]),
		FALSE
	];
	player setUserActionText [(player getVariable 'QS_interact_actionStand'),((player actionParams (player getVariable 'QS_interact_actionStand')) # 0),(format ["<t size='3'>%1</t>",((player actionParams (player getVariable 'QS_interact_actionStand')) # 0)])];
	[_object] spawn {
		scriptName 'Seated thread';
		_object = _this # 0;
		detach player;
		private _sitDirectionOffset = 180;
		if (((toLowerANSI (typeOf _object)) in ['land_armchair_01_f']) || {((toLowerANSI ((getModelInfo _object) # 0)) in ['armchair_01_f.p3d'])}) then {
			_sitDirectionOffset = 0;
		};
		player setDir ((getDir _object) - _sitDirectionOffset);
		uiSleep 0.05;
		if (((toLowerANSI (typeOf _object)) in ['land_rattanchair_01_f','land_armchair_01_f']) || {((toLowerANSI ((getModelInfo _object) # 0)) in ['rattanchair_01_f.p3d','armchair_01_f.p3d'])}) then {
			private _playerPos = getPosWorld player;
			_playerPos set [2,((_playerPos # 2) - 1)];
			player setPosWorld _playerPos;
		};
		uiSleep 0.05;
		_animationState = animationState player;
		for '_x' from 0 to 1 step 0 do {
			if ((animationState player) isNotEqualTo _animationState) exitWith {player setVariable ['QS_seated_oldAnimState',nil,FALSE];};
			if ((player distance2D _object) > 1) exitWith {
				if ((animationState player) isEqualTo _animationState) then {
					[nil,nil,nil,0] call (missionNamespace getVariable 'QS_fnc_clientInteractSit');
				};
			};
			if (((vectorUp _object) # 2) < 0.5) exitWith {
				if ((animationState player) isEqualTo _animationState) then {
					[nil,nil,nil,0] call (missionNamespace getVariable 'QS_fnc_clientInteractSit');
				};
			};
			if (!alive _object) exitWith {
				if ((animationState player) isEqualTo _animationState) then {
					[nil,nil,nil,0] call (missionNamespace getVariable 'QS_fnc_clientInteractSit');
				};
			};
			if (!alive player) exitWith {player setVariable ['QS_seated_oldAnimState',nil,FALSE];};
			uiSleep 0.05;
		};
		if (!isNil {player getVariable 'QS_interact_actionStand'}) then {
			player removeAction (player getVariable 'QS_interact_actionStand');
			player setVariable ['QS_interact_actionStand',nil,FALSE];
		};
		if (!isNil {player getVariable 'QS_seated_oldAnimState'}) then {
			player setVariable ['QS_seated_oldAnimState',nil,FALSE];
		};
	};
};