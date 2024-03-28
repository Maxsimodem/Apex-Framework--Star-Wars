/*/
File: fn_parseNumber.sqf
Author:

	Author: Karel Moricky (tweaked by Quiksilver)
	
Last Modified:

	8/06/2018 A3 1.82 by Quiksilver

Description:

	
___________________________________________________/*/

_number = _this param [0,-1,[0,'',{},configfile]];
switch (typeName _number) do {
	case (typeName {}): {
		_number = call _number;
		if (isnil {_number}) then {_number = -1;};
		_number
	};
	/*/
	case (typeName ''): {
		private _code = FALSE;
		_code = (((_number find ';') > -1) || ((_number find '}') > -1) || ((_number find '{') > -1) || ((_number find '=') > -1));
		if (!(_code)) then {
			_number = call compile _number;
		};
		if (isnil {_number}) then {_number = -1;};
		_number
	};
	/*/
	case (typeName configfile): {
		if (isnumber _number) then {
			getnumber _number
		} else {
			if (istext _number) then {
				(gettext _number) call (missionNamespace getVariable 'BIS_fnc_parseNumber');
			} else {
				-1
			};
		};
	};
	default {_number};
};