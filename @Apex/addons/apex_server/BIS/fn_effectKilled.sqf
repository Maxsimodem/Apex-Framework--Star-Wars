/*
File: fn_effectKilled.sqf
Author:

	Quiksilver
	
Last Modified:

	21/07/2016 A3 1.62 by Quiksilver

Description:

	BIS_fnc_effectKilled overwrite
___________________________________________________*/

if (isServer) exitWith {};
_v = _this select 0;
if ((_v isKindOf 'Helicopter') || {(_v isKindOf 'Plane')}) then {
	[_v] remoteExec ['BIS_fnc_effectKilledAirDestruction',2,FALSE];
} else {
	if (_v isKindOf 'Tank') then {
		[_v,((fuel _v) * (2 + (random 2)))] remoteExec ['BIS_fnc_effectKilledSecondaries',2,FALSE];
	} else {
		if ((_v isKindOf 'Car') || {(_v isKindOf 'Ship')}) then {
			[_v,1] remoteExec ['BIS_fnc_effectKilledSecondaries',2,FALSE];
		};
	};
};