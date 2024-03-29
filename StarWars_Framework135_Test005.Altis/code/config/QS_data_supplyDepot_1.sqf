/*---------------------------------------------------------------------------------------------------------------------------
*
* file							:	QS_data_supplyDepot_1.sqf
* 
* Synopsis						:	This file contains the composition used in generating OpFor supply depots within the AO.
* 
* Framework Version				:	1.3.5
* 
* Modification Date				:	2023-07-23
* 
* Modification Description		:	In addition to modifiying the file to use props and crates from JLTS, 3AS, and LS, 
*									documentation of this file was increased to include block comments and instruction on how
*									to use the file itself. Modifications were only made for Altis.
* 
* Completion Date				:	2023-07-23
* 
* Developer						:	Maxsimodem
* 
* Notes							:	Observe the second block comment for instruction on how this file works.
*
*--------------------------------------------------------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------------------------------------------------------
*
*	To visualise this composition in the editor, load an empty editor file in the Virtual Reality map and use the following
*	code in the debug console along with every object contained within the file for the first array relating to Altis
*	
*		collect3DENHistory{
*			{
*				private[ "_obj" ];
*				_x params[ "_type", "_pos", "_rot" ];
*	
*				_obj = create3DENEntity [ "Object", _type, _pos, true ];
*				_obj set3DENAttribute [ "rotation",[ 0,0,_rot ] ];
*	
*			}
*			
*			forEach [
*				//default supply depot
*				["CamoNet_OPFOR_open_Curator_F",[1.34827,0.554199,1.1301],268.912,[],false,true,true,{}], 
*				["Land_Cargo10_military_green_F",[1.99829,-1.44336,0.0240006],89.7956,[],false,true,true,{}], 
*				["Land_Pod_Heli_Transport_04_ammo_F",[1.965,2.49878,0],270.37,[],false,true,true,{
*					_box = _this # 0;
*					missionNamespace setVariable ['QS_virtualSectors_sub_3_obj',_box,TRUE];
*					for '_x' from 0 to 2 step 1 do {
*						_box setVariable ['QS_sc_subObj_3',TRUE,TRUE];
*						_box setVariable ['QS_secureable',TRUE,TRUE];
*					};
*					_box;
*	
*					this setObjectTextureGlobal [0, "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_Black_CO.paa"]; 
*					this setObjectTextureGlobal [1, "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_Black_CO.paa"];
*				}],
*				["Land_HBarrierWall6_F",[2.01411,-1.93539,0],180.854,[],false,true,true,{}], 
*				["Land_TTowerSmall_1_F",[2.0332,-2.46655,-2.64879],0,[],false,true,true,{}], 
*				["Land_HBarrierWall_corner_F",[-4.65735,-5.36523,0],179.116,[],false,true,true,{}], 
*				["Land_HBarrierWall6_F",[0.315918,8.33936,0],0,[],false,true,true,{}], 
*				["Land_HBarrierWall6_F",[9.06592,2.35669,0],89.2217,[],false,true,true,{}], 
*				["Land_HBarrierWall_corner_F",[-5.27466,6.6189,0],268.993,[],false,true,true,{}], 
*				["Land_HBarrierWall_corner_F",[7.86096,-4.90747,0],94.9585,[],false,true,true,{}], 
*				["Land_Cargo10_military_green_F",[-3.6925,-9.03394,0.0240002],0.0907073,[],false,true,true,{}], 
*				["Land_Cargo10_military_green_F",[-8.8811,6.67358,-0.000998974],267.936,[],false,true,true,{}], 
*				["Land_Cargo10_military_green_F",[11.5593,2.3606,0.0240002],91.3617,[],false,true,true,{}],
*				["Box_T_East_Wps_F",[-0.0299072,-0.923096,0.0239992],0.00329516,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_GEN_Equip_F",[0.325684,-1.98413,0.0239992],359.964,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_Syndicate_Ammo_F",[-1.85022,1.19556,0.0239992],254.757,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_T_NATO_Wps_F",[-1.95532,2.31909,0.0239992],267.494,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_T_East_Ammo_F",[0.290771,-3.12866,0.0239992],338.145,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_Syndicate_WpsLaunch_F",[0.756592,3.74487,0.0240002],0.00161651,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_NATO_Grenades_F",[3.88513,-0.512451,0.0239992],27.8111,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_Syndicate_Ammo_F",[3.78589,-1.49121,0.0239992],87.0554,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_Syndicate_Ammo_F",[2.26672,3.76587,0.0239992],356.888,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}], 
*				["Box_T_East_Ammo_F",[3.73376,-2.41992,0.0239992],97.3107,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_East_Support_F",[-1.7207,-4.30786,0.0239992],359.997,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_Syndicate_Wps_F",[3.74597,3.31616,0.0240002],221.224,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_T_East_Ammo_F",[-5.54846,3.34375,0.024003],212.741,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
*				["Box_IED_Exp_F",[7.82349,6.41211,0.0239992],0.00293722,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}]
*			];
*		};
*
*	To paste your edited composition back into the file, select all objects in the editor and use this code to copy your
*	custom compositions from the editor to a clipboard, and paste into a blank file.
*
*	private _array = [];
*	{
*		_array pushBack [(typeOf _x),(getPos _x),(getDir _x),[],false,true,true,{}];
*	} forEach (get3DENSelected 'object');
*	copyToClipboard str _array;
*	
*	Replace relavent init code, and set prop special states to "false,true,true," for props, and "false,true,false" for
*	crates. The parameter format is as follows:
*
*		[
*			"objectClass",			//Empty prop
*			[posX,posY,posZ],		//Map position
*			rot,					//Rotation
*			[],
*			false,					//<damage DISABLE>
*			true,					//<simulation ENABLED>
*			true,					//<simpleObject TRUE>
*			{}						//object init
*		]
*
*
*	Be advised that not all items labeled as crates have a storage space and are actually just props. You may
*	find it helpful to organize your list with props at the top, fortifications in the middle, and crates at the bottom.
*
*	Be sure that it can be placed with no problems in the editor; coordinates can be finnickey as the decimal points are
*	only copied to the closest significant digit. I have not been able to find a fix for this, but even so, using the code
*	will make the majority of the work a lot easier rather than having to enter every parameter manually
*
*	Maxim's note: _getPosASL and _setPosASL may be necessary for verifying location, but should not be used when configuring
*				  this file.
*
*--------------------------------------------------------------------------------------------------------------------------*/

([	
	[	//ALTIS
	//PROPS
	["Land_Pod_Heli_Transport_04_ammo_F",[1.965,2.499,0],270.37,[],false,true,true,{												//Place Taru ammo pod
			_box = _this # 0;
			missionNamespace setVariable ['QS_virtualSectors_sub_3_obj',_box,TRUE];													//Configure this object to be used
			for '_x' from 0 to 2 step 1 do {																						//by the framework as the Supply
				_box setVariable ['QS_sc_subObj_3',TRUE,TRUE];																		//Depot objective
				_box setVariable ['QS_secureable',TRUE,TRUE];
			};												
			_box;

			this setObjectTextureGlobal [0, "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_Black_CO.paa"]; 		//Overwrite Taru texture to black
			this setObjectTextureGlobal [1, "A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_Black_CO.paa"];		//All my homies hate CSAT camo
	}],
	["Land_TTowerSmall_1_F",[2.01411,-1.93539,-2.673],0,[],false,true,true,{}],														//Place Transmitter Pole
	["CamoNet_INDP_open_F",[1.249,1.70978,1.30000],268.912,[],false,true,true,{}],													//Place Camo Net
	["Land_Cargo10_grey_F",[-9.02292,5.49597,0],270.073,[],false,true,true,{}],														//Place Grey Shipping Container
	["Land_Cargo10_grey_F",[-4.43225,-8.95845,0],186.399,[],false,true,true,{}],													//Place Grey Shipping Container
	["Land_Cargo10_grey_F",[11.4321,2.14769,0],91.0274,[],false,true,true,{}],														//Place Grey Shipping Container
	["Land_Cargo10_grey_F",[0.877032,10.9567,0],0.0725441,[],false,true,true,{}],													//Place Grey Shipping Container
	["3AS_LargeCrate_1_cis",[2.011,-0.896,0],0,[],false,true,true,{}],																//Place 3AS Large Grey CIS Crate
	
	//FORTIFICATIONS
	["Land_lsb_fob_hBarrierWall_ramp",[-3.4695,-5.14058,1.2],0,[],false,true,true,{}],												//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_ramp",[-2.08559,-6.4841,1.2],0,[],false,true,true,{}],												//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_ramp",[4.90814,-6.53304,1.2],0,[],false,true,true,{}],												//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_ramp",[7.675,-2.521,1.2],270,[],false,true,true,{}],												//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_ramp",[-5.38918,4.56116,1.2],90,[],false,true,true,{}],												//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_ramp",[9.02266,4.47631,1.2],270,[],false,true,true,{}],												//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_ramp",[-2.673,8.639,1.2],180,[],false,true,true,{}],												//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_ramp",[4.370,8.468,1.2],180,[],false,true,true,{}],													//Place H Barrier wall with ramp
	["Land_lsb_fob_hBarrierWall_4",[0.857,9.424,1.2],180,[],false,true,true,{}],													//Place H Barrier wall, 4-long
	["Land_lsb_fob_hBarrierWall_4",[9.975,0.972,1.2],270,[],false,true,true,{}],													//Place H Barrier wall, 4-long
	["Land_lsb_fob_hBarrierWall_4",[1.413,-7.388,1.2],0,[],false,true,true,{}],														//Place H Barrier wall, 4-long
	["Land_lsb_fob_hBarrierWall_exvertedCorner",[-6.301,-5.322,1.2],0,[],false,true,true,{}],										//Place H Barrier wall corner
	["Land_lsb_fob_hBarrierWall_exvertedCorner",[7.798,-5.322,1.2],270,[],false,true,true,{}],										//Place H Barrier wall corner
	["Land_lsb_fob_hBarrierWall_exvertedCorner",[-5.571,7.392,1.2],90,[],false,true,true,{}],										//Place H Barrier wall corner
	["Land_lsb_fob_hBarrier_3",[-7.99877,3.17581,1.2],0,[],false,true,true,{}],														//Place H Barriers for entrance
	["Land_lsb_fob_hBarrier_3",[-8.02967,3.08513,2.559],180,[],false,true,true,{}],													//Place H Barriers for entrance
	["Land_lsb_fob_hBarrier_3",[-8.13311,-2.48226,1.2],180,[],false,true,true,{}],													//Place H Barriers for entrance
	["Land_lsb_fob_hBarrier_3",[-8.1022,-2.39158,2.559],360,[],false,true,true,{}],													//Place H Barriers for entrance
	["3AS_Barricade_2_C_prop",[5.12502,9.86021,0],180,[],false,true,true,{}],														//Place Barricades at the end of H Barrier walls
	["3AS_Barricade_2_C_prop",[10.3243,5.19257,0],270,[],false,true,true,{}],														//Place Barricades at the end of H Barrier walls
	
	//CRATES
	["3AS_Small_Box_9_Black_Prop",[-1.596,-0.574215,0],270,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["3AS_Small_Box_9_Grey_Prop",[1.29111,4.91102,0],0.446,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_weapons_GAR",[-1.04052,4.54727,0],69.8992,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_weapons_CIS",[-2.15888,3.47,0],348.793,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_ammo_CIS",[-2.21351,2.14818,0],15.3494,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_explosives_GAR",[068,2.58767,0],156.349,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_grenades_GAR",[-1.18095,-2.51912,0],328.69,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_support_CIS",[3.96533,4.21257,0],126.906,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_ammo_CIS",[5.31533,-2.00722,0],202.308,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_ammo_GAR",[5.42098,-1.05974,0],170.756,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}],																																//into crate using Apex Framework
	["JLTS_Ammobox_support_GAR",[5.45,0.308784,0],174.019,[],false,true,false,{
		_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;							//Place pre-determined inventory
	}]																																//into crate using Apex Framework
	],
	[	//TANOA
		["Land_Cargo10_military_green_F",[2.00989,-1.4231,0.0240006],89.8031,[],false,true,true,{}], 
		["CamoNet_BLUFOR_open_Curator_F",[2.76733,-0.0705566,0.728848],262.765,[],false,true,true,{}], 
		["Land_Pod_Heli_Transport_04_ammo_F",[1.97693,1.97583,0.0235405],270.37,[],false,true,true,{
			_box = _this # 0;
			missionNamespace setVariable ['QS_virtualSectors_sub_3_obj',_box,TRUE];
			for '_x' from 0 to 2 step 1 do {
				_box setVariable ['QS_sc_subObj_3',TRUE,TRUE];
				_box setVariable ['QS_secureable',TRUE,TRUE];
			};
			_box;
		}], 
		["Land_TTowerSmall_1_F",[2.06213,-2.1499,-2.64879],0,[],false,true,true,{}], 
		["Land_HBarrier_01_wall_6_green_F",[2.56836,-6.74219,0],181.46,[],false,true,true,{}], 
		["Land_HBarrier_01_wall_corner_green_F",[-4.61487,-5.32568,0],180.927,[],false,true,true,{}], 
		["Land_HBarrier_01_wall_6_green_F",[0.266724,8.19043,0],0.559541,[],false,true,true,{}], 
		["Land_HBarrier_01_wall_6_green_F",[9.1449,2.073,0],90.3177,[],false,true,true,{}], 
		["Land_HBarrier_01_wall_corner_green_F",[-5.17725,6.51685,0],269.469,[],false,true,true,{}], 
		["Land_HBarrier_01_wall_corner_green_F",[8.15112,-5.14966,0],89.5987,[],false,true,true,{}], 
		["Land_Cargo10_military_green_F",[-3.68091,-9.01367,-0.000998974],0.0808997,[],false,true,true,{}], 
		["Land_Cargo10_military_green_F",[-8.76819,6.71802,-0.000998497],268.942,[],false,true,true,{}], 
		["Land_Cargo10_military_green_F",[11.5709,2.38086,-0.000999928],91.3617,[],false,true,true,{}],
		["Box_T_East_Wps_F",[-0.0299072,-0.923096,0.0239992],0.00329516,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_GEN_Equip_F",[0.325684,-1.98413,0.0239992],359.964,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_Syndicate_Ammo_F",[-1.85022,1.19556,0.0239992],254.757,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_T_NATO_Wps_F",[-1.95532,2.31909,0.0239992],267.494,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_T_East_Ammo_F",[0.290771,-3.12866,0.0239992],338.145,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_Syndicate_WpsLaunch_F",[0.756592,3.74487,0.0240002],0.00161651,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_NATO_Grenades_F",[3.88513,-0.512451,0.0239992],27.8111,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_Syndicate_Ammo_F",[3.78589,-1.49121,0.0239992],87.0554,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_Syndicate_Ammo_F",[2.26672,3.76587,0.0239992],356.888,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_T_East_Ammo_F",[3.73376,-2.41992,0.0239992],97.3107,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_East_Support_F",[-1.7207,-4.30786,0.0239992],359.997,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_Syndicate_Wps_F",[3.74597,3.31616,0.0240002],221.224,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_T_East_Ammo_F",[-5.54846,3.34375,0.024003],212.741,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}],
		["Box_IED_Exp_F",[7.82349,6.41211,0.0239992],0.00293722,[],false,true,false,{_box = _this # 0;[_box,0,nil] call (missionNamespace getVariable 'QS_fnc_customInventory');_box;}]
	]
] select (worldName isEqualTo 'Tanoa')) //Using the Tanoa map will cause the second array to be selected.