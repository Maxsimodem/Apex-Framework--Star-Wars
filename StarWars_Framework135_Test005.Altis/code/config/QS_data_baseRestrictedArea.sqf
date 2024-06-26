/*---------------------------------------------------------------------------------------------------------------------------
*
* file							:	QS_data_vehicles.sqf
* 
* Synopsis						:	Area at base in which vehicles are not allowed (infantry spawn area)
* 
* Framework Version				:	1.3.5
* 
* Modification Date				:	2023-07-23
* 
* Modification Description		:	Changes were made to accomodate the integrated Star Wars base. Modifications were only
*									made for Altis.
* 
* Completion Date				:	2023-07-23
* 
* Developer						:	Maxsimodem
* 
* Notes							:	- The shape creates must be a polygon ( https://community.bistudio.com/wiki/inPolygon ).
*									- Only one Vehicle Restricted area is allowed, unlike Speed Limited areas where you can
*									have several.
*									- Unlike the Speed Limited areas, these coordinates are listed in a counter-clockwise
*									order.
*
*--------------------------------------------------------------------------------------------------------------------------*/

private _return = [[0,0,1],[1,0,1],[1,1,1],[0,1,1]];	// Do not edit this line

// EDIT BELOW
if ((missionNamespace getVariable ['QS_missionConfig_baseLayout',0]) isEqualTo 0) exitWith {
	if (worldName isEqualTo 'Altis') then {
		// default Vehicle Restricted area for ALTIS
		_return = [
			[14745.676,16735.697,0],
			[14748.038,16740.648,0],
			[14747.465,16744.236,0],
			[14721.203,16769.234,0],
			[14683.965,16726.398,0],
			[14707.808,16703.314,0],
			[14711.232,16702.967,0],
			[14716.506,16705.348,0]
		];
	};
	if (worldName isEqualTo 'Tanoa') then {
		// CUSTOM Vehicle Restricted area for TANOA
		_return = [
			[6918.41,7376.67,0],
			[6937.73,7381.24,0],
			[6927.28,7437.82,0],
			[6907.94,7434.23,0]
		];
	};
	if (worldName isEqualTo 'Malden') then {
		// CUSTOM Vehicle Restricted area for MALDEN
		_return = [
			[8123.71,10132.7,0],
			[8103.02,10133.3,0],
			[8102.68,10099,0],
			[8121.91,10100.2,0]
		];
	};
	if (worldName isEqualTo 'Enoch') then {
		// CUSTOM Vehicle Restricted area for LIVONIA
		_return = [
			[4051.23,10193.4,0],
			[4071.29,10173.2,0],
			[4126.5,10229.4,0],
			[4106.57,10249.8,0]
		];
	};
	if (worldName isEqualTo 'Stratis') then {
		// CUSTOM Vehicle Restricted area for STRATIS
		_return = [
			[1901.28,5731.89,0.00143099],
			[1899.66,5725.67,0.00145817],
			[1925.47,5718.36,0.00145531],
			[1934.88,5753.19,0.00144339],
			[1908.82,5760.27,0.00143909]
		];	
	};
	_return;
};
// EDIT ABOVE, the below is for default base layout


















if (worldName isEqualTo 'Altis') exitWith {
	[
		[14590,16753.9,0],
		[14628.8,16723.1,0],
		[14686.4,16783.1,0],
		[14661.9,16810.1,0],
		[14655.3,16808,0],
		[14649.2,16813.4,0]
	]
};
if (worldName isEqualTo 'Tanoa') exitWith {
	[
		[6918.41,7376.67,0],
		[6937.73,7381.24,0],
		[6927.28,7437.82,0],
		[6907.94,7434.23,0]
	]
};
if (worldName isEqualTo 'Malden') exitWith {
	[
		[8123.71,10132.7,0],
		[8103.02,10133.3,0],
		[8102.68,10099,0],
		[8121.91,10100.2,0]
	]
};
if (worldName isEqualTo 'Enoch') exitWith {
	[
		[4051.23,10193.4,0],
		[4071.29,10173.2,0],
		[4126.5,10229.4,0],
		[4106.57,10249.8,0]
	]
};
if (worldName isEqualTo 'Stratis') then {
	[
		[1901.28,5731.89,0.00143099],
		[1899.66,5725.67,0.00145817],
		[1925.47,5718.36,0.00145531],
		[1934.88,5753.19,0.00144339],
		[1908.82,5760.27,0.00143909]
	]
};
[[0,0,0],[1,0,0],[1,1,0],[0,1,0]]						// Do not edit this line