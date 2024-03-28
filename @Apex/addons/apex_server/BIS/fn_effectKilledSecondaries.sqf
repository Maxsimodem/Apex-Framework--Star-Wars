/*
File: fn_effectKilledSecondaries.sqf
Author:

	Quiksilver
	
Last Modified:

	21/07/2016 A3 1.62 by Quiksilver

Description:

	BIS_fnc_effectKilledSecondaries overwrite
//Small secondary fuel explosions
//By Maddmatt for ArmA 2
___________________________________________________*/

TRUE;

/*/
if (isServer) then {
	_this spawn {
		scriptName 'fn_effectKilledSecondaries_mainLoop';
		params ['_v','_int'];
		_list=[];
		_lifecheck = true;
		if (count _this > 2) then {_lifecheck=_this select 2};
		while {(_int > 1)} do {
			_int = _int - 1;
			_t = (random 45) + 1;
			_list pushBack _t;
		};
		_effect2pos = _v selectionposition 'destructionEffect2';
		{
			sleep _x;
			if ((_lifecheck && (alive _v)) ||( isnull _v )|| (((getposASL _v) select 2) < 0)) exitwith {};
			_b="SmallSecondary" createvehicle (_v modelToWorld _effect2pos);
		} foreach (_list);
	};
};
/*/