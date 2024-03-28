/*/
File: fn_missileLaunchPositionFix.sqf
Author:

	Quiksilver
	
Last Modified:

	26/11/2017 A3 1.78 by Quiksilver

Description:

	BIS_fnc_missileLaunchPositionFix overwrite
___________________________________________________/*/

params ['_vehicle','_missile','_selection','_type'];
if ((!(local _vehicle)) || {(!(_missile isKindOf _type))}) exitWith {FALSE};
_modelPosition = _vehicle modelToWorldWorld (_vehicle selectionPosition _selection);
if ((vectorMagnitudeSqr _modelPosition) isEqualTo 0) exitWith {FALSE};
_missile setPosWorld _modelPosition;
TRUE;