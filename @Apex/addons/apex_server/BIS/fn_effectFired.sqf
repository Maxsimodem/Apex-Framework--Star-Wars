/*
File: fn_effectFired.sqf
Author:

	Quiksilver
	
Last Modified:

	21/07/2016 A3 1.62 by Quiksilver

Description:

	BIS_fnc_effectFired overwrite
	
	 _this call (uinamespace getvariable (gettext (configFile >> "CfgAmmo" >> (_this select 4) >> "muzzleEffect")));
	 
	fired = "
		[_this select 0,_this select 6,'missile_move','MissileBase'] call BIS_fnc_missileLaunchPositionFix; 
		_this call (uinamespace getvariable 'BIS_fnc_effectFired');
	";
	 
___________________________________________________*/

if (isDedicated || !hasInterface) exitWith {};
_vehicleMuzzleEffect = uiNamespace getVariable [(format ['QS_v_muzzleEffect_%1',(typeOf (_this select 0))]),-1];
if (_vehicleMuzzleEffect isEqualTo -1) then {
	private _vehicleMuzzleEffect = getText (configFile >> 'CfgAmmo' >> (_this select 4) >> 'muzzleEffect');
	uiNamespace setVariable [(format ['QS_v_muzzleEffect_%1',(typeOf (_this select 0))]),_vehicleMuzzleEffect];
};
_this call (uiNamespace getVariable [_vehicleMuzzleEffect,{}]);