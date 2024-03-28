/*---------------------------------------------------------------------------------------------------------------------------
*
* file							:	QS_data_missionobjects.sqf
* 
* Synopsis						:	This file contains the default configured base.
* 
* Framework Version				:	1.3.5
* 
* Modification Date				:	2023-07-21
* 
* Modification Description		:	Changed default base from using the Altis International Air terminal to use a custom-
*									built base with props from Star Wars and Halo mods. Modifications were only made for
*									Altis.
* 
* Completion Date				:	2023-07-21
* 
* Developer						:	Maxsimodem
* 
* Notes							:	Observe the second block comment for instruction on how this file works.
*
*--------------------------------------------------------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------------------------------------------------------
*
*	Object Parameter format:
*		[	
*			<object type> ,
*			<object model> , 
*			<object world position > , 
*			[ <vector direction> , <vector up> ] , 
*			<damage allowed> , 			// 0 = disabled, 1 = enabled
*			<simulation state> , 		// 0 = disabled, 1 = enabled
*			<simple object state> , 	// 0 = not simple, 1 = simple, 2 = super simple
*			<arguments> , 
*			<init code> 
*		]
*	
*	How to copy from 3DEN Editor
*		private _array = [];
*		{
*			_array pushBack [(typeOf _x),((getModelInfo _x) # 1),(getPosWorld _x),[(vectorDir _x),(vectorUp _x)],0,0,2,0,[],{}];
*		} forEach (all3DENEntities # 0);
*		copyToClipboard str _array;
*		
*		// And this for "cursor selected" objects 
*		
*		private _array = [];
*		{
*			_array pushBack [(typeOf _x),((getModelInfo _x) # 1),(getPosWorld _x),[(vectorDir _x),(vectorUp _x)],0,0,2,0,[],{}];
*		} forEach (get3DENSelected 'object');
*		copyToClipboard str _array;
*
*	For making your base come alive:
*		Set sim-required entities (flags, houses with animated doors, helipads (for AI)) simple object state to 0, and simulated state to 1.
*		For objects with screens, set simple object state to 1 or 0 (not 2)
*		Objects with addaction need to be simpleobject state 0
*
*-------------------------------------------------------------------------------------------------------------------------*/

_worldName = worldName;
if (_worldName isEqualTo 'Altis') exitWith {
	[
		["3as_GNK","3as\3as_gnk\3as_gnk.p3d",[14688.948,16721.297,19.343], [[-0.970296,0.241922,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_FOB_Banner_prop","3as\3as_structures\fob\banner.p3d",[14720.914,16709.637,19.4565], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_FOB_Banner_prop","3as\3as_structures\fob\banner.p3d",[14741.539,16731.012,19.4565], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_FOB_Banner_prop","3as\3as_structures\fob\banner.p3d",[14724.698,16713.531,19.4257], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_FOB_Banner_prop","3as\3as_structures\fob\banner.p3d",[14737.604,16726.912,19.4319], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14709.442,16745.439,18.7244], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14705.362,16741.211,18.7244], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14705.981,16705.184,19.0856], [[0.707105,-0.707108,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14718.538,16707.508,19.0856], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14713.825,16704.064,19.0856], [[0.898794,0.438371,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14726.874,16716.123,19.0856], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14731.043,16720.439,19.0856], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14735.211,16724.756,19.0856], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14743.75,16733.578,19.0856], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14746.981,16738.424,19.0856], [[0.406736,0.913546,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14745.49,16745.967,19.0856], [[-0.719338,0.694661,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14600.022,16573.97,19.0857], [[0.719336,-0.694662,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14806.934,16672.348,19.1464], [[-0.719326,0.694672,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14757.562,16670.135,21.1291], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14753.437,16665.885,21.1291], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14747.937,16666.385,21.1291], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14743.626,16670.555,21.1292], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14742.355,16676.451,21.1291], [[-0.694663,-0.719336,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_prop","3as\3as_structures\barricades\barricade.p3d",[14746.480,16680.701,21.1291], [[-0.694663,-0.719336,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_2_C_prop","3as\3as_structures\barricades\barricade2_c.p3d",[14705.404,16771.266,18.823], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Barricade_2_C_prop","3as\3as_structures\barricades\barricade2_c.p3d",[14710.698,16776.75,18.823], [[-0.694665,-0.719334,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Billboard_F","a3\structures_f\civ\infoboards\billboard_f.p3d",[14705.152,16741.234,19.5872], [[-0.71934,0.694658,0],[0,0,1]],0,0,0,0,[],{
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_billboard4',[]]))];
		}],
		["Land_Billboard_F","a3\structures_f\civ\infoboards\billboard_f.p3d",[14709.323,16745.553,19.5872], [[-0.71934,0.694658,0],[0,0,1]],0,0,0,0,[],{
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_billboard3',[]]))];
		}],
		["Land_Billboard_F","a3\structures_f\civ\infoboards\billboard_f.p3d",[14715.393,16731.354,20.1869], [[-0.71934,0.694658,0],[0,0,1]],0,0,0,0,[],{
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_billboard1',[]]))];
		}],
		["Land_Billboard_F","a3\structures_f\civ\infoboards\billboard_f.p3d",[14719.563,16735.672,20.1869], [[-0.71934,0.694658,0],[0,0,1]],0,0,0,0,[],{
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_billboard2',[]]))];
		}],
		["Land_Camping_Light_F","a3\structures_f_epb\civ\camping\camping_light_f.p3d",[14699.815,16702.43,19.4696], [[0,1,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Camping_Light_F","a3\structures_f_epb\civ\camping\camping_light_f.p3d",[14702.164,16700.115,19.4696], [[0,1,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Camping_Light_F","a3\structures_f_epb\civ\camping\camping_light_f.p3d",[14698.18,16705.71,19.378], [[0,1,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[14698.479,16705.545,18.8553], [[-0.694663,-0.719335,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[14808.319,16670.770,18.9097], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CampingTable_white_F","a3\structures_f\civ\camping\campingtable_f.p3d",[14709.523,16758.75,18.9923], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CampingTable_white_F","a3\structures_f\civ\camping\campingtable_f.p3d",[14708.44,16759.8,18.9927], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CampingTable_white_F","a3\structures_f\civ\camping\campingtable_f.p3d",[14708.973,16759.275,18.9927], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14716.164,16729.262,19.269], [[-0.719335,0.694663,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14721.914,16735.012,19.269], [[-0.719335,0.694663,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14735.539,16725.887,19.2691], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14725.664,16715.637,19.269], [[-0.719335,0.694663,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14745.832,16744.887,19.269], [[-0.719335,0.694663,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14707.055,16704.875,19.269], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14725.914,16771.262,19.4064], [[-0.719335,0.694663,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14802.539,16670.762,19.3294], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["B_CargoNet_01_ammo_F","a3\supplies_f_heli\cargonets\cargonet_01_ammo_f.p3d",[14599.24,16576.078,19.269], [[-0.731354,0.681998,0],[0,0,1]],0,0,2,0,[],{
			(_this select 0) setVariable['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this select 0)]),TRUE];
		}],
		["CBRNContainer_01_olive_F","a3\props_f_enoch\military\decontamination\cbrncontainer_01_f.p3d",[14752.323,16762.164,18.7841], [[-0.587785,0.809017,0],[0,0,1]],0,0,2,0,[],{}],
		["CBRNContainer_01_olive_F","a3\props_f_enoch\military\decontamination\cbrncontainer_01_f.p3d",[14752.493,16761.684,18.7528], [[-0.87462,0.48481,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_CIS_CONSOLE_5_PROP","3as\3as_props\terminals\cisconsole5.p3d",[14709.47,16783.793,20.2084], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Wall_IndCnc_2deco_F","a3\structures_f\walls\wall_indcnc_2deco_f.p3d",[14771.645,16774.908,19.4448], [[0,1,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Wall_IndCnc_2deco_F","a3\structures_f\walls\wall_indcnc_2deco_f.p3d",[14759.121,16762.377,19.4448], [[-1,4.88762e-007,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Wall_IndCnc_2deco_F","a3\structures_f\walls\wall_indcnc_2deco_f.p3d",[14748.788,16772.645,19.4448], [[-0.965926,0.258819,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Wall_IndCnc_2deco_F","a3\structures_f\walls\wall_indcnc_2deco_f.p3d",[14760.865,16785.04,19.4448], [[-0.258817,0.965926,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_Crate3_1_prop","3as\3as_props\crates\crate3-1.p3d",[14699.56,16770.379,18.9648], [[0.244145,0.969739,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_Crate3_1_prop","3as\3as_props\crates\crate3-1.p3d",[14698.99,16772.9,18.9648], [[0.905064,0.425276,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_Crate3_1_prop","3as\3as_props\crates\crate3-1.p3d",[14699.04,16771.332,19.8648], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Defibrillator_F","a3\structures_f_epa\items\medical\defibrillator_f.p3d",[14742.656,16753.32,18.5514], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["OPTRE_Holo_eridanus","optre_misc\holo\holo_eridanus.p3d",[14708.072,16773.797,19.5256], [[-0.706097,-0.708115,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_FirstAidKit_01_open_F", "a3\props_f_orange\humanitarian\camps\firstaidkit_01_open_f.p3d", [14752.781, 16761.086, 19.2794], [[0.62932, 0.777146, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Flag_IDAP_F", "a3\structures_f\mil\flags\mast_asym_f.p3d", [14753.484, 16755.36, 22.4205], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["Flag_RedCrystal_F", "a3\structures_f\mil\flags\mast_f.p3d", [14748.453, 16750.008, 22.4205], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Corridor_Prop", "3as\3as_structures\fob\fob_corridor.p3d", [14702.964, 16733.654, 19.7744], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Corridor_Prop", "3as\3as_structures\fob\fob_corridor.p3d", [14685.201, 16733.43, 19.7448], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Corridor_Prop", "3as\3as_structures\fob\fob_corridor.p3d", [14709.825, 16740.756, 19.7744], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Corridor_Prop", "3as\3as_structures\fob\fob_corridor.p3d", [14684.71, 16751.457, 19.7448], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Corridor_Prop", "3as\3as_structures\fob\fob_corridor.p3d", [14716.686, 16747.86, 19.7744], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Corridor_Prop", "3as\3as_structures\fob\fob_corridor.p3d", [14663.245, 16715.012, 19.7744], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Door_Prop", "3as\3as_structures\fob\fob_door.p3d", [14699.048, 16755.508, 20.4398], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Door_Prop", "3as\3as_structures\fob\fob_door.p3d", [14689.063, 16729.871, 20.4759], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Door_Prop", "3as\3as_structures\fob\fob_door.p3d", [14688.890, 16719.039, 20.4755], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Enterance_Prop", "3as\3as_structures\fob\fob_enterance.p3d", [14707.321, 16712.07, 22.5945], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Enterance_Prop", "3as\3as_structures\fob\fob_enterance.p3d", [14738.581, 16744.439, 22.6128], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Enterance_Prop", "3as\3as_structures\fob\fob_enterance.p3d", [14652.573, 16703.422, 22.8196], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Enterance_Prop", "3as\3as_structures\fob\fob_enterance.p3d", [14737.867, 16769.977, 22.6128], [[-0.694658, -0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Light_Tall_Prop","3as\3as_structures\fob\light_tall.p3d",[14797.789, 16673.262, 24.5553],[[-0.72845,0.685098,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["3as_FOB_Hangar_Prop", "3as\3as_structures\fob\fob_hangar.p3d", [14801.676, 16811.576, 22.1242], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Hangar_Prop", "3as\3as_structures\fob\fob_hangar.p3d", [14830.448, 16783.789, 22.1552], [[0.71934, -0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Hangar_Prop", "3as\3as_structures\fob\fob_hangar.p3d", [14715.293, 16766.932, 22.0305], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Hangar_Prop", "3as\3as_structures\fob\fob_hangar.p3d", [14809.608, 16762.211, 22.2172], [[0.71934, -0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Hangar_Prop", "3as\3as_structures\fob\fob_hangar.p3d", [14780.837, 16789.996, 22.1552], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_FOB_Intersection_Prop", "3as\3as_structures\fob\fob_intersection.p3d", [14694.553, 16724.398, 22.7313], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Intersection_Prop", "3as\3as_structures\fob\fob_intersection.p3d", [14725.813, 16756.770, 22.7313], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Light_Prop", "3as\3as_structures\fob\light.p3d", [14712.175, 16743.139, 22.9527], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 1, 1, 0, [], {
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["3as_FOB_Light_Prop", "3as\3as_structures\fob\light.p3d", [14708.526, 16739.363, 22.9527], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 1, 1, 0, [], {
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["3as_FOB_Light_Prop", "3as\3as_structures\fob\light.p3d", [14728.15, 16754.514, 23.2495], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 1, 1, 0, [], {
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["3as_FOB_Light_Prop", "3as\3as_structures\fob\light.p3d", [14723.114, 16759.375, 23.2495], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 1, 1, 0, [], {
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["3as_FOB_Light_Prop", "3as\3as_structures\fob\light.p3d", [14696.8, 16722.229, 23.2326], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 1, 1, 0, [], {
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["3as_FOB_Light_Prop", "3as\3as_structures\fob\light.p3d", [14691.765, 16727.09, 23.2326], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 1, 1, 0, [], {
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["3as_FOB_Trun_Prop", "3as\3as_structures\fob\fob_turn.p3d", [14683.49, 16714.924, 22.2126], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Trun_Prop", "3as\3as_structures\fob\fob_turn.p3d", [14677.531, 16742.402, 22.1828], [[0.71934, -0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Trun_Prop", "3as\3as_structures\fob\fob_turn.p3d", [14693.68, 16759.127, 22.188], [[-0.69466, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_FOB_Trun_Prop", "3as\3as_structures\fob\fob_turn.p3d", [14672.251, 16722.719, 22.2126], [[-0.69466, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14839.689, 16719.457, 20.1886], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14727.723, 16603.523, 20.1886], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14666.244, 16574.32, 20.1886], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14793.233, 16671.361, 20.1886], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14774.934, 16652.412, 20.1885], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14598.004, 16640.102, 20.1885], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14624.877, 16702.648, 20.1885], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14736.845, 16818.58, 20.1885], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14671.334, 16750.744, 20.1885], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_bunker", "3as\3as_structures\fob\bunker_wall.p3d", [14689.631, 16769.695, 20.1884], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner_inversed", "3as\3as_structures\fob\corner_inversed.p3d", [14837.518, 16748.672, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner_inversed", "3as\3as_structures\fob\corner_inversed.p3d", [14698.479, 16604.611, 20.9953], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner_inversed", "3as\3as_structures\fob\corner_inversed.p3d", [14627.063, 16673.42, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner_inversed", "3as\3as_structures\fob\corner_inversed.p3d", [14766.082, 16817.482, 20.9952], [[-0.694659, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14801.134, 16842.688, 20.9974], [[0.719336, -0.694662, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14861.571, 16784.363, 20.9974], [[-0.69466, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14629.577, 16544.082, 20.9974], [[-0.719334, 0.694664, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14569.116, 16602.4, 21.0247], [[0.694659, 0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14844.137, 16731.8, 20.9975], [[-0.694659, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14715.501, 16598.602, 20.9974], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14620.427, 16690.305, 20.9974], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_corner", "3as\3as_structures\fob\corner.p3d", [14749.061, 16823.506, 20.9973], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_door", "3as\3as_structures\fob\door.p3d", [14783.480, 16662.299, 20.9926], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_prop_fob_modular_wall_door", "3as\3as_structures\fob\door.p3d", [14680.861, 16759.504, 20.9926], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_gate", "3as\3as_structures\fob\gate.p3d", [14834.752, 16817.104, 20.9911], [[-0.694658, -0.71934, 0], [0, 0, 1]], 0, 1, 0, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14812.89, 16837.586, 20.9953], [[-0.69466, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14821.522, 16829.252, 20.9952], [[-0.69466, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14847.419, 16804.242, 20.9952], [[-0.69466, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14856.052, 16795.906, 20.9952], [[-0.69466, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14856.46, 16772.605, 20.9953], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14842.567, 16758.219, 20.9952], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14789.6, 16837.184, 20.9953], [[0.719336, -0.694662, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14775.595, 16822.926, 20.9953], [[0.719336, -0.694662, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14617.813, 16549.205, 20.9952], [[0.694659, 0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14609.179, 16557.539, 20.9952], [[0.694659, 0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14583.283, 16582.547, 20.9952], [[0.694659, 0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14574.65, 16590.885, 20.9952], [[0.694659, 0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14591.916, 16574.213, 20.9952], [[0.694659, 0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14600.547, 16565.877, 20.9952], [[0.694659, 0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14574.216, 16614.184, 20.9952], [[0.719333, -0.694666, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14586.186, 16626.578, 20.995], [[0.719333, -0.694666, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14641.110, 16549.582, 20.9952], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14653.073, 16561.967, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14830.687, 16711.426, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14735.373, 16612.727, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14688.986, 16599.148, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14678.078, 16587.857, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14746.467, 16624.219, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14754.795, 16632.842, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14765.918, 16644.36, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14800.883, 16680.564, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14811.936, 16692.1, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14820.264, 16700.725, 20.9953], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14621.97, 16663.814, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14611.173, 16652.465, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14633.88, 16710.68, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14729.192, 16809.379, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14718.097, 16797.889, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14709.770, 16789.266, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14698.646, 16777.746, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14663.683, 16741.54, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d", [14652.628, 16730.008, 20.9952], [[0.71934, -0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3as_prop_fob_modular_wall_straight_long", "3as\3as_structures\fob\straight_long.p3d",[14644.302, 16721.381, 20.9952], [[0.71934, -0.694659, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3as_prop_fob_modular_wall_straight", "3as\3as_structures\fob\straight.p3d",[14848.82, 16764.695, 20.9952], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3as_prop_fob_modular_wall_straight", "3as\3as_structures\fob\straight.p3d",[14781.847, 16829.398, 20.9953], [[0.719336, -0.694662, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3as_prop_fob_modular_wall_straight", "3as\3as_structures\fob\straight.p3d",[14579.933, 16620.105, 20.9951], [[0.719333, -0.694666, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3as_prop_fob_modular_wall_straight", "3as\3as_structures\fob\straight.p3d",[14840.789, 16741.262, 20.9953], [[-0.694659, -0.719339, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14705.927,16601.607,20.9953], [[0.694661,0.719337,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14646.825,16555.492,20.9953], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14659.323,16568.439,20.9953], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14671.825,16581.385,20.9953], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14592.428,16633.039,20.9952], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14604.922,16645.992,20.9952], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14623.775,16680.844,20.9952], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_straight","3as\3as_structures\fob\straight.p3d",[14758.639,16820.498,20.9952], [[-0.694662,-0.719336,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14817.553,16833.78,24.1327], [[-0.69466,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14852.084,16800.436,24.1597], [[-0.69466,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14851.958,16767.227,24.1597], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14784.374,16832.494,24.1597], [[0.719336,-0.694662,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14613.151,16553.016,24.1596], [[0.694659,0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14578.592,16586.322,24.1869], [[0.694659,0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14578.718,16619.568,24.1597], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14646.334,16554.270,24.1597], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14683.895,16593.164,24.1597],[[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14741.226,16618.16,24.1595], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14760.664,16638.287,24.1597], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14806.756,16686.021,24.1597], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14825.452,16705.381,24.1597], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14616.248,16658.434,24.1597], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14723.336,16803.947,24.1594], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14703.901,16783.818,24.1596], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14657.807,16736.09,24.1596], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_prop_fob_modular_wall_watchtower","3as\3as_structures\fob\watchtower.p3d",[14639.110,16716.729,24.1596], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymBench_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymbench_01_f.p3d",[14692.539,16705.387,19.033], [[-0.719336,0.694662,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymBench_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymbench_01_f.p3d",[14694.254,16707.164,19.033], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymRack_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_01_f.p3d",[14691.792,16703.201,19.5378], [[-0.694669,-0.71933,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymRack_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_01_f.p3d",[14693.414,16701.637,19.5379], [[-0.694669,-0.71933,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymRack_02_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_02_f.p3d",[14698.302,16696.938,19.0765], [[-0.694672,-0.719327,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymRack_02_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_02_f.p3d",[14696.414,16698.762,19.0769], [[-0.694672,-0.719327,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymRack_03_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_03_f.p3d",[14697.414,16706.887,19.0264], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_GymRack_03_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_03_f.p3d",[14696.789,16707.512,19.0265], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_Holotable","optre_buildings\military\optre_holotable.p3d",[14708.012,16773.781,18.7976], [[-0.695514,-0.718513,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_InfoStand_V1_F","a3\structures_f\civ\infoboards\infostand_v1_f.p3d",[14737.164,16726.512,19.0204], [[0.754709,-0.656059,0],[0,0,1]],0,0,0,0,[],{
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_infostand1',[]]))];
		}],
		["Land_InfoStand_V2_F","a3\structures_f\civ\infoboards\infostand_v2_f.p3d",[14725.039,16714.012,19.0334], [[0.694658,-0.71934,0],[0,0,1]],0,0,0,0,[],{
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_infostand2',[]]))];
		}],
		["Land_IntravenStand_01_1bag_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[14745.437,16759.039,19.4103], [[0.719336,-0.694662,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_IntravenStand_01_1bag_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[14744.461,16751.230,19.4099], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[14746.618,16757.203,19.4104], [[0.719336,-0.694662,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[14743.278,16753.064,19.41], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_IntravenStand_01_empty_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[14748.682,16755.385,19.4102], [[0.719336,-0.694662,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_IntravenStand_01_empty_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[14741.215,16754.885,19.4098], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[14705.25,16724.719,24.787], [[-0.241939,-0.970291,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[14725.781,16746.082,24.787], [[-0.961271,-0.275604,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[14737.789,16667.262,23.427], [[0.71934,-0.694658,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[14776.789,16707.762,23.427], [[-0.719339,0.694659,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[14598.414,16573.387,24.4259], [[0.999848,0.0174521,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[14599.494,16572.348,24.4259], [[0.0174515,-0.999848,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14718.72,16630.293,18.545], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14719.736,16612.631,18.545], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14797.913,16733.893,18.5972], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14780.25,16732.875,18.5972], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14698.256,16633.313,18.5462], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14697.239,16650.975,18.5463], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14800.976,16712.736,18.6405], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_l","optre_buildings\military\optre_unsc_airpad_l.p3d",[14818.639,16713.754,18.6405], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14728.069,16621.262,18.545], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14710.387,16621.658,18.545], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14789.28,16742.227,18.5972], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14788.882,16724.539,18.5972], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14809.607,16704.4,18.6405], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14706.59,16641.943,18.5462], [[-0.719339,0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14810.006,16722.088,18.6405], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_unsc_airpad_r","optre_buildings\military\optre_unsc_airpad_r.p3d",[14688.906,16642.34,18.5463], [[0.71934,-0.694659,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_OPTRE_mod_building_white","optre_buildings\buildings\optre_mod_building_white.p3d",[14747.263,16757.537,21.276], [[0.694658,0.71934,0],[0,0,1]],0,0,1,0,[],{}],
		["sdt_gonk","sdt_droids\sdt_gonk.p3d",[14695.539,16708.887,18.9378], [[-0.0348991,0.999391,0],[0,0,1]],0,0,2,0,[],{}],
		["Reflector_Cone_01_Long_blue_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[14708.645,16774.479,27.2968], [[-8.74228e-008,-1.19249e-008,-1],[0,-1,1.19249e-008]],0,1,0,0,[],{}],
		["Reflector_Cone_01_Long_red_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[14706.889,16772.518,27.2968], [[-8.74228e-008,-1.19249e-008,-1],[0,-1,1.19249e-008]],0,1,0,0,[],{}],
		["Land_LiquidDispenser_01_F","a3\props_f_orange\humanitarian\supplies\liquiddispenser_01_f.p3d",[14698.853,16705.014,19.6341], [[-0.69466,-0.719338,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_LiquidDispenser_01_F","a3\props_f_orange\humanitarian\supplies\liquiddispenser_01_f.p3d",[14698.389,16705.43,19.6341], [[-0.69466,-0.719338,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14609.053,16583.322,18.4167], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14618.778,16593.393,18.4168], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14628.503,16603.461,18.4168], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14638.229,16613.533,18.4168], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14647.957,16623.605,18.4171], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14657.679,16633.674,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14667.406,16643.744,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14677.13,16653.816,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14686.856,16663.885,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14696.58,16673.957,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14706.307,16684.03,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14716.03,16694.102,18.4167], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14725.756,16704.17,18.4174], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14735.480,16714.242,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14754.932,16734.381,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14745.206,16724.313,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14764.656,16744.453,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14774.385,16754.525,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform","optre_buildings\cityobjects\main_road_platform.p3d",[14784.107,16764.594,18.4166], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Main_road_platform", "optre_buildings\cityobjects\main_road_platform.p3d", [14793.834, 16774.664, 18.4179], [[-0.694659, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Main_road_platform", "optre_buildings\cityobjects\main_road_platform.p3d", [14803.557, 16784.736, 18.4177], [[-0.694659, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Main_road_platform", "optre_buildings\cityobjects\main_road_platform.p3d", [14813.284, 16794.805, 18.3897], [[-0.694659, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Main_road_platform", "optre_buildings\cityobjects\main_road_platform.p3d", [14823.008, 16804.879, 18.4168], [[-0.694658, -0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Main_road_platform", "optre_buildings\cityobjects\main_road_platform.p3d", [14832.734, 16814.95, 18.4165], [[-0.694659, -0.719339, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Main_road_platform", "optre_buildings\cityobjects\main_road_platform.p3d", [14842.33, 16824.94, 17.5763], [[-0.686245, -0.717233, 0.121019], [0.0843041, 0.0868281, 0.99265]], 0, 0, 2, 0, [], {}],
		["OPTRE_cart", "optre_vehicles\cart\cart.p3d", [14773.655, 16727.42, 20.1758], [[0, 1, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["JLTS_tcw_memorial", "mrc\jlts\objects\tcw_memorial\memorial.p3d", [14713.061, 16717.473, 19.9632], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["MemorialWreath_01_Standing_F", "a3\props_f_aow\items\decorative\memorialwreath_01_standing_f.p3d", [14714.789, 16715.387, 19.3462], [[-0.898795, -0.43837, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Medevac_house_V1_F", "a3\structures_f\mil\cargo\medevac_house_v1_f.p3d", [14599.246, 16578.021, 19.1437], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Medevac_house_V1_F", "a3\structures_f\mil\cargo\medevac_house_v1_f.p3d", [14604.01, 16573.42, 19.1438], [[0.71934, -0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Medevac_house_V1_F", "a3\structures_f\mil\cargo\medevac_house_v1_f.p3d", [14802.948, 16672.896, 18.9548], [[-0.719328, 0.694671, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_ModularOutPostBuildingQuaters", "optre_bw_buildings\modularbuilding\modularoutpostbuildingquaters.p3d", [14741.22, 16640.043, 20.3025], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_ModularOutPostBuildingQuaters", "optre_bw_buildings\modularbuilding\modularoutpostbuildingquaters.p3d", [14715.317, 16665.045, 20.3026], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_ModularOutPostBuildingQuaters", "optre_bw_buildings\modularbuilding\modularoutpostbuildingquaters.p3d", [14728.374, 16652.44, 20.3026], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OPTRE_modular_building_door", "optre_arctic\optre_modular_building_door.p3d", [14752.638, 16763.107, 19.7813], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OPTRE_modular_building_door", "optre_arctic\optre_modular_building_door.p3d", [14741.724, 16751.805, 19.7813], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OPTRE_modular_building_door", "optre_arctic\optre_modular_building_door.p3d", [14741.730, 16761.434, 19.7822], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["OPTRE_rail_tunnel_pillar", "optre_rail\tunnel_pillar.p3d", [14655.655, 16665.104, 16.9877], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["OPTRE_rail_tunnel_pillar", "optre_rail\tunnel_pillar.p3d", [14650.136, 16670.39, 17.1], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["OPTRE_rail_tunnel_pillar", "optre_rail\tunnel_pillar.p3d", [14653.06, 16662.332, 17.1276], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["OPTRE_rail_tunnel_pillar", "optre_rail\tunnel_pillar.p3d", [14647.54, 16667.619, 17.0613], [[-0.71934, 0.694658, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14706.969, 16759.793, 19.2555], [[-0.906308, 0.422619, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14707.72, 16760.793, 19.2555], [[-0.642787, 0.766045, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14708.72, 16761.543, 19.2555], [[1.13994e-006, 1, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14709.72, 16761.043, 19.2555], [[0.500001, 0.866025, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14710.72, 16760.293, 19.2555], [[0.819153, 0.573575, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14711.22, 16759.043, 19.2555], [[0.996195, -0.087157, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14709.47, 16757.293, 19.2555], [[0.342019, -0.939693, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_OfficeChair_01_F", "a3\structures_f_heli\furniture\officechair_01_f.p3d", [14710.47, 16758.043, 19.2555], [[0.642784, -0.766047, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_PainKillers_F", "a3\structures_f_epa\items\medical\painkillers_f.p3d", [14748.114, 16764.969, 19.4083], [[0.994522, 0.104527, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_PicnicTable_01_F", "a3\structures_f_exp\civilian\accessories\picnictable_01_f.p3d", [14700.914, 16701.387, 18.704], [[0.694658, 0.71934, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_PlasticCase_01_large_black_F", "a3\structures_f_heli\items\luggage\plasticcase_01_large_f.p3d", [14753.02, 16760.961, 18.8604], [[-0.719339, 0.694659, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.4233], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.4968], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.4593], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.4758], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.5133], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.5354], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.5519], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.5893], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.5728], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.3858], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.4023], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.4233], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.4398], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.3472], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.3637], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.3098], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.54, 16705.064, 19.3262], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.4428], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.4593], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.3693], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.3858], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.4068], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.3307], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.2933], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.3472], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["Land_Tableware_01_cup_F", "a3\structures_f_heli\items\food\tableware_01_cup_f.p3d", [14698.482, 16705.121, 19.3098], [[0.719338, -0.69466, 0], [0, 0, 1]], 0, 0, 2, 0, [], {}],
		["3AS_Prop_platform_10x10_bolted","3as\3as_structures\platforms\platform10x10.p3d",[14650.24,16665.004,22.0266], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Prop_platform_40x40_rep","3as\3as_structures\platforms\platform40x40.p3d",[14767.047,16566.984,18.4207], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Prop_platform_40x40_rep","3as\3as_structures\platforms\platform40x40.p3d",[14794.836,16595.758,18.4207], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Prop_platform_40x40_rep","3as\3as_structures\platforms\platform40x40.p3d",[14822.619,16624.533,18.4207], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Prop_platform_40x40_rep","3as\3as_structures\platforms\platform40x40.p3d",[14850.408,16653.305,18.4207], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_Prop_platform_40x40_rep","3as\3as_structures\platforms\platform40x40.p3d",[14878.192,16682.08,18.4206], [[-0.694659,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Warehouse_02_F","a3\structures_f_exp\industrial\port\warehouse_02_f.p3d",[14674.302,16681.975,23.6918], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Warehouse_01_F","a3\structures_f_exp\industrial\port\warehouse_01_f.p3d",[14740.640,16799.986,21.4408], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Rectangular_Plant_Box_Trees","optre_buildings\cityobjects\rectangular_plant_box_trees.p3d",[14721.581,16740.873,19.9902], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Rectangular_Plant_Box_Trees","optre_buildings\cityobjects\rectangular_plant_box_trees.p3d",[14710.293,16729.184,19.9903], [[-0.69466,-0.719339,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_RepairDepot_01_civ_F","a3\structures_f_tank\military\repairdepot\repairdepot_01_civ_f.p3d",[14777.555,16723.811,20.8617], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_RepairDepot_01_civ_F","a3\structures_f_tank\military\repairdepot\repairdepot_01_civ_f.p3d",[14650.142,16664.906,24.5797], [[-0.707107,0.707107,0],[0,0,1]],0,0,2,0,[],{}],
		["ls_commandPost_republic_blue","ls_statics_props\commandpost\ls_commandpost_static.p3d",[14721.789,16729.387,19.5534], [[-0.71934,0.694658,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[14710.293,16772.643,19.4985], [[-0.587785,0.809017,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable['QS_airdefense_laptop',(_this select 0),TRUE];
		}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[14808.318,16670.719,19.4849], [[0.809027,0.587771,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_cas_laptop',(_this select 0),TRUE];
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this select 0) enableDynamicSimulation FALSE;
				(_this select 0) setVariable ['QS_dynSim_ignore',TRUE,TRUE];
				(_this select 0) hideObjectGlobal TRUE;
			};
		}],
		["Land_TripodScreen_01_large_black_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[14750.842,16763.252,19.5222], [[-0.596015,-0.802973,0],[0,0,1]],0,0,0,0,[],{
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_billboard5',[]]))];
		}],
		["Land_TripodScreen_01_large_black_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[14707.702,16757.934,19.6242], [[0.689443,0.72434,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable['QS_Billboard_02',(_this select 0),TRUE];
			(_this select 0) setObjectTextureGlobal[0,(selectRandom(missionNamespace getVariable['QS_missionConfig_textures_billboard6',[]]))];
		}],
		["Land_PortableCabinet_01_closed_black_F","a3\props_f_enoch\military\camps\portablecabinet_01_closed_f.p3d",[14750.522,16763.967,18.6424], [[0.0697563,0.997564,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableCabinet_01_medical_F","a3\props_f_enoch\military\camps\portablecabinet_01_medical_f.p3d",[14748.042,16764.861,19.7837], [[-0.829032,0.559202,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableCabinet_01_bookcase_olive_F","a3\props_f_enoch\military\camps\portablecabinet_01_bookcase_f.p3d",[14749.461,16764.06,19.7837], [[0.857172,0.51503,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableCabinet_01_bookcase_olive_F","a3\props_f_enoch\military\camps\portablecabinet_01_bookcase_f.p3d",[14754.868,16758.773,19.7833], [[0.997564,-0.069758,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableDesk_01_black_F","a3\props_f_enoch\military\camps\portabledesk_01_f.p3d",[14709.722,16772.135,18.8876], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableDesk_01_black_F","a3\props_f_enoch\military\camps\portabledesk_01_f.p3d",[14754.352,16759.480,18.9227], [[0.809017,0.587785,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableDesk_01_black_F","a3\props_f_enoch\military\camps\portabledesk_01_f.p3d",[14748.668,16764.443,18.9227], [[0.559193,0.829038,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableGenerator_01_black_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[14751.233,16762.826,18.8198], [[0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PortableGenerator_01_black_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[14707.34,16758.348,18.9564], [[-0.694658,-0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_small_crate_prop","3as\3as_props\crates\small_crate.p3d",[14699.626,16771.71,18.9551], [[0.208756,0.977968,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_small_crate_prop","3as\3as_props\crates\small_crate.p3d",[14697.833,16769.365,19.8313], [[0.974202,0.225676,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_small_crate_prop","3as\3as_props\crates\small_crate.p3d",[14698.244,16772.162,18.9551], [[0.887812,0.460206,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_small_crate_prop","3as\3as_props\crates\small_crate.p3d",[14697.976,16771.313,19.8551], [[0.208756,0.977968,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_small_crate_prop","3as\3as_props\crates\small_crate.p3d",[14697.894,16770.539,20.7483], [[0.208756,0.977968,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_small_crate_stack_1_prop","3as\3as_props\crates\small_crate_stack1.p3d",[14698.06,16770.268,19.9516], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["3as_small_crate_stack_2_prop","3as\3as_props\crates\small_crate_stack2.p3d",[14771.59,16695.143,21.9434], [[-0.559193,0.829037,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_H_barrier_small_3","3as\3as_structures\barricades\hbarrier_small_3.p3d",[14716.533,16732.172,19.1711], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_H_barrier_small_3","3as\3as_structures\barricades\hbarrier_small_3.p3d",[14714.276,16729.838,19.1711], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_H_barrier_small_3","3as\3as_structures\barricades\hbarrier_small_3.p3d",[14718.789,16734.512,19.1711], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["3AS_H_barrier_small_3","3as\3as_structures\barricades\hbarrier_small_3.p3d",[14721.046,16736.852,19.1711], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14751.376,16775.24,19.6526], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14754.85,16778.838,19.6526], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14758.323,16782.434,19.6526], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14761.858,16782.496,19.6526], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14765.452,16779.023,19.6526], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14769.05,16775.553,19.6526], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14751.438,16771.707,19.6526], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14755.035,16768.232,19.6526], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14758.632,16764.76,19.6526], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14762.166,16764.82,19.6526], [[0.719335,-0.694664,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14769.113,16772.014,19.6526], [[0.719335,-0.694664,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14761.743,16768.701,19.6526], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SportGround_fence_F","a3\structures_f\walls\sportground_fence_f.p3d",[14765.22,16772.297,19.6526], [[-0.71934,0.694658,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stethoscope_01_F","a3\props_f_orange\humanitarian\camps\stethoscope_01_f.p3d",[14748.076,16764.686,19.3815], [[0.970296,-0.241922,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stethoscope_01_F","a3\props_f_orange\humanitarian\camps\stethoscope_01_f.p3d",[14753.818,16760.031,19.3811], [[-0.587785,0.809017,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14715.311,16715.127,21.003],[[-0.71934,0.694658,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14710.637,16719.643,21.003],[[-0.71934,0.694658,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14731.127,16740.863,21.0029],[[0.719336,-0.694662,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14735.8,16736.346,21.0029],[[0.719336,-0.694662,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14728.872,16718.193,21.0029],[[-0.69466,-0.719339,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14733.039,16722.51,21.0029],[[-0.69466,-0.719339,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14711.108,16702.678,20.976],[[-0.999848,-0.0174509,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14748.276,16740.982,21.0029],[[0.0174434,-0.999848,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14760.243,16763.549,21.0029],[[-0.71934,0.694658,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14749.993,16773.447,21.0029],[[-0.71934,0.694658,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14760.064,16783.877,21.0029],[[0.719336,-0.694662,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14770.496,16773.805,21.0029],[[0.719336,-0.694662,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Colony_Light_Street","optre_buildings\citylights\colony_light_street.p3d",[14717.914,16733.096,21.0029],[[0.69466,0.719339,0],[0,0,1]],0,1,0,0,[],{
			(missionNamespace getVariable 'QS_lamps') pushBack (_this select 0);
		}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14748.783,16754.59,18.7202],[[-0.694665,-0.719334,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14747.262,16756.068,18.7204],[[-0.694665,-0.719334,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14744.376,16758.846,18.7204],[[-0.694665,-0.719334,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14745.818,16757.455,18.7204],[[-0.694665,-0.719334,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14745.516,16751.424,18.72],[[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14741.112,16755.678,18.7198],[[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14742.637,16754.203,18.72],[[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Stretcher_01_olive_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[14744.077,16752.816,18.72],[[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_SCF_01_chimney_F","a3\structures_f_exp\industrial\sugarcanefactory_01\scf_01_chimney_f.p3d",[14701.625,16749.875,49.6077], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{
			_chimney = _this select 0;
			missionNamespace setVariable[
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_chimney,2]] ),
				TRUE
			];
			_fire = createVehicle['test_EmptyObjectForFireBig',[0,0,0],[],0,'NONE'];
			_fire allowDamage FALSE;
			missionNamespace setVariable[
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_fire,2]] ),
				TRUE
			];
			missionNamespace setVariable['QS_torch',_fire,TRUE];
			_fire enableDynamicSimulation FALSE;
			_fire setVariable['QS_dynSim_ignore',TRUE,TRUE];
			_fire attachTo[_chimney,[-2,0,31]];
			_fire spawn {
				uiSleep 0.1;
				detach _this;
			};
		}],
		["Land_SCF_01_chimney_F","a3\structures_f_exp\industrial\sugarcanefactory_01\scf_01_chimney_f.p3d",[14691.625,16739.625,49.6077], [[0.71934,-0.694658,0],[0,0,1]],0,0,2,0,[],{
			_chimney = _this select 0;
			missionNamespace setVariable[
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_chimney,2]] ),
				TRUE
			];
			_fire = createVehicle['test_EmptyObjectForFireBig',[0,0,0],[],0,'NONE'];
			_fire allowDamage FALSE;
			missionNamespace setVariable[
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_fire,2]] ),
				TRUE
			];
			missionNamespace setVariable['QS_torch',_fire,TRUE];
			_fire enableDynamicSimulation FALSE;
			_fire setVariable['QS_dynSim_ignore',TRUE,TRUE];
			_fire attachTo[_chimney,[-2,0,31]];
			_fire spawn {
				uiSleep 0.1;
				detach _this;
			};
		}],
		["ls_sweeper", "ls_statics_props\sweeper\sweeper.p3d",[14691.366, 16729.561, 18.5814], [[-0.0887458, 0.996054, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["ls_sweeper_2", "ls_statics_props\sweeper\sweeper.p3d",[14689.021, 16727.307, 18.5814], [[-0.999987, -0.00511786, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["Land_TentHangar_V1_F", "a3\structures_f\mil\tenthangar\tenthangar_v1_f.p3d",[14760.965, 16772.93, 22.5338], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3AS_TERMINAL_2_PROP", "3as\3as_props\terminals\terminal_2.p3d",[14702.389, 16776.783, 19.5428], [[0.694658, 0.71934, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3AS_TERMINAL_Screen_PROP", "3as\3as_props\terminals\terminal_screen.p3d",[14703.584, 16777.967, 19.7878], [[0.694658, 0.71934, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["3AS_Terminal_Console_Prop", "3as\3as_props\terminals\terminal_console.p3d",[14704.886, 16779.318, 19.8925], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["Land_OPTRE_Trash_Can_1a", "optre_buildings\cityobjects\optre_trash_can_1a.p3d",[14722.367, 16736.287, 18.9959], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["Land_OPTRE_Trash_Can_1a", "optre_buildings\cityobjects\optre_trash_can_1a.p3d",[14715.039, 16728.512, 19.1139], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["Land_OPTRE_Trash_Can_1a", "optre_buildings\cityobjects\optre_trash_can_1a.p3d",[14699.039, 16703.262, 19.0228], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["Land_OPTRE_Trash_Can_1a", "optre_buildings\cityobjects\optre_trash_can_1a.p3d",[14702.914, 16699.512, 19.0228], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["OPTRE_tree_Blue_1", "optre_plants\t_quercus2f_blue.p3d",[14711.914, 16731.211, 30.453], [[-0.325577, -0.945516, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["OPTRE_tree_Red_1", "optre_plants\t_quercus2f_red.p3d",[14719.121, 16739.67, 30.4799], [[-0.71934, 0.694658, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["Box_NATO_AmmoVeh_F", "a3\weapons_f\ammoboxes\ammoveh_f.p3d",[14781.464, 16720.56, 19.2335], [[0, 1, 0],[0, 0, 1]], 0, 0, 2, 0,[], {}],
		["Land_Warehouse_03_F","a3\structures_f_exp\commercial\warehouses\warehouse_03_f.p3d",[14826.788,16727.994,20.8607], [[0.694658,0.71934,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.933,16705.615,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.754,16705.795,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.931,16705.79,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.84,16705.881,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.017,16705.877,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.19,16705.889,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.28,6705.973,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.182,16706.24,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.1,16706.328,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.099,16706.156,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.022,16705.703,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.105,16705.975,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.922,16706.143,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.835,16706.061,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.749,16705.967,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14697.662,16705.879,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[14698.272,16706.152,19.3902], [[0.719338,-0.69466,0],[0,0,1]],0,0,2,0,[],{}],
		["MapBoard_altis_F","a3\structures_f\civ\infoboards\mapboard_f.p3d",[14701.527,16775.527,19.55], [[-0.964842,0.26283,0],[0,0,1]],0,0,2,0,[],{}],
		["MapBoard_seismic_F","a3\structures_f\civ\infoboards\mapboard_f.p3d",[14706.302,16780.47,19.55], [[-0.315615,0.948887,0],[0,0,1]],0,0,2,0,[],{}],
		["Rabbit_F","a3\animals_f\rabbit\rabbit_f.p3d",[14692.539,16705.887,18.5331], [[0.587785,-0.809017,0],[0,0,1]],0,0,2,0,[],{}],
		["B_UAV_AI","a3\characters_f\common\invisibleman.p3d",[14770.8,16702.8,25.0253], [[-0.0348996,0.999391,0],[0,0,1]],0,0,2,0,[],{}],
		["B_UAV_AI","a3\characters_f\common\invisibleman.p3d",[14779.1,16694.8,25.0253], [[0.999391,0.0348995,0],[0,0,1]],0,0,2,0,[],{}],
		["B_UAV_AI","a3\characters_f\common\invisibleman.p3d",[14771.8,16687,25.0253], [[0.0348995,-0.999391,0],[0,0,1]],0,0,2,0,[],{}],
		["B_UAV_AI","a3\characters_f\common\invisibleman.p3d",[14763.3,16695.3,25.0253], [[-0.999391,-0.0348998,0],[0,0,1]],0,0,2,0,[],{}]
	]
};
if (_worldName isEqualTo 'Tanoa') exitWith {
	[
		["Land_MedicalTent_01_white_generic_open_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_f.p3d",[6907.74,7426.37,4.03456],[[0.978856,0.20455,0],[0,0,1]],0,0,1,0,[],{
			(_this # 0) setObjectTextureGlobal [0,"a3\structures_f_orange\humanitarian\Camps\Data\MedicalTent_01_Tropic_F_CO.paa"];
		}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6919.89,7375.43,3.40051],[[0.193828,-0.981035,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6925.42,7376.46,3.40051],[[0.193828,-0.981035,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6939.32,7381.49,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6938.28,7387.11,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6937.25,7392.73,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6936.25,7398.3,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6933.2,7414.57,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6932.17,7420.23,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6931.11,7425.85,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6928.95,7437.04,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6908.62,7435.66,3.40051],[[-0.168635,0.985679,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6929.55,7438.72,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6930.02,7436.19,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6932.99,7420.97,3.04567],[[0.97954,0.201249,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6932.49,7423.51,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6932,7426.05,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6934.45,7413.37,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6933.96,7415.91,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6933.49,7418.44,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6938.72,7390.16,3.04567],[[0.97954,0.201249,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6938.24,7392.73,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6937.76,7395.31,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6937.27,7397.88,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6940.64,7379.89,3.04567],[[0.97954,0.201249,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6940.15,7382.46,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6939.68,7385.03,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6939.21,7387.6,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6906.94,7436.33,3.04567],[[-0.171511,0.985182,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6920.13,7374.55,3.04567],[[0.20816,-0.978095,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6922.65,7374.99,3.04567],[[0.167572,-0.98586,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6925.21,7375.43,3.04567],[[0.167572,-0.98586,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6909.5,7436.79,3.04567],[[-0.171511,0.985182,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6912.04,7437.29,3.04567],[[-0.171511,0.985182,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6936.1,7378.75,3.40051],[[0.193828,-0.981035,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6936.6,7377.9,3.04567],[[0.167572,-0.98586,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6939.18,7378.35,3.04567],[[0.167572,-0.98586,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6925.04,7438.4,3.40051],[[-0.178529,0.983935,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6928.12,7439.93,3.04567],[[-0.162053,0.986782,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6925.55,7439.53,3.04567],[[-0.158566,0.987348,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6936.77,7400.47,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6936.24,7403.96,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6935.42,7408.29,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6934.75,7411.82,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6927.74,7375.9,3.04567],[[0.203656,-0.979043,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6934.06,7377.4,3.04567],[[0.218245,-0.975894,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6922.98,7439.12,3.04567],[[-0.153284,0.988182,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GarbageBin_02_F","a3\structures_f_exp\civilian\accessories\garbagebin_02_f.p3d",[6934.36,7411.48,3.1603],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[6934.59,7394.59,3.77381],[[0.984823,0.17356,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6917.95,7393.67,3.40051],[[-0.232236,0.972659,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6932.8,7396.99,3.40051],[[-0.203881,0.978996,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MetalShelter_01_F","a3\structures_f_exp\commercial\market\metalshelter_01_f.p3d",[6912.78,7413.33,4.21936],[[0.185851,-0.982578,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MedicalTent_01_white_generic_open_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_f.p3d",[6924.12,7430.1,4.03456],[[0.973652,0.228041,0],[0,0,1]],0,0,1,0,[],{
			(_this # 0) setObjectTextureGlobal [0,"a3\structures_f_orange\humanitarian\Camps\Data\MedicalTent_01_Tropic_F_CO.paa"];
		}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6920.69,7392.23,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6921.16,7389.68,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6921.63,7387.12,3.04567],[[0.982633,0.185562,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GymBench_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymbench_01_f.p3d",[6916.89,7390.84,3.24931],[[-0.982181,-0.187939,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GymRack_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_01_f.p3d",[6917.56,7387.64,3.75418],[[-0.980372,-0.197157,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GymRack_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_01_f.p3d",[6918.09,7384.78,3.75418],[[-0.980372,-0.197157,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GymRack_03_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_03_f.p3d",[6919.47,7392.64,3.2427],[[-0.185298,0.982682,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6927.63,7424.95,3.40051],[[-0.203881,0.978996,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[6912.5,7421.71,3.40051],[[-0.203881,0.978996,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[6929.6,7422.64,3.77381],[[0.984823,0.17356,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6929.97,7420.62,3.04567],[[0.16924,-0.985575,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_TripodScreen_01_large_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[6930.62,7419.71,3.70317],[[-0.542938,-0.839773,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_Billboard_02',(_this # 0),TRUE];
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_billboard1',[]]))];
		}],
		["Land_TripodScreen_01_large_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[6934.51,7398.82,3.70317],[[-0.726247,0.687434,0],[0,0,1]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_billboard2',[]]))];
		}],
		["Land_PortableGenerator_01_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[6933.84,7398.51,3.03567],[[0.223653,-0.974669,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PortableGenerator_01_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[6929.64,7419.89,3.03567],[[0.224184,-0.974547,0],[0,0,1]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[6929.61,7422.65,3.55242],[[-0.986106,-0.166116,0],[0,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[6934.57,7394.57,3.55242],[[-0.986106,-0.166116,0],[0,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[6913.85,7408.68,3.55242],[[-0.986106,-0.166116,0],[0,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[6912.19,7417.88,3.55242],[[-0.986106,-0.166116,0],[0,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["Land_SatelliteAntenna_01_F","a3\props_f_exp\military\camps\satelliteantenna_01_f.p3d",[6929.88,7421.61,5.91977],[[0.891908,-0.448109,-0.0608109],[0.0633986,-0.00923933,0.997945]],0,0,2,1,[],{}],
		["Land_TTowerSmall_2_F","a3\structures_f\ind\transmitter_tower\ttowersmall_2_f.p3d",[6912,7430.25,11.1387],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["FlagPole_F","a3\structures_f\mil\flags\mast_f.p3d",[6938.05,7380.21,6.6368],[[-0.321516,-0.946904,0],[0,0,1]],0,1,0,0,[],{
			(_this # 0) setFlagTexture (missionNamespace getVariable ['QS_missionConfig_textures_communityFlag','a3\data_f\flags\flag_nato_co.paa']);
		}],
		["FlagPole_F","a3\structures_f\mil\flags\mast_f.p3d",[6914.02,7422.88,6.6368],[[-0.321516,-0.946904,0],[0,0,1]],0,1,0,0,[],{
			(_this # 0) setFlagTexture (missionNamespace getVariable ['QS_missionConfig_textures_communityFlag','a3\data_f\flags\flag_nato_co.paa']);
		}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[6982.85,7346.93,2.66],[[-0.985542,-0.169429,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[6974.68,7393.39,2.66],[[-0.985542,-0.169429,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[6966.91,7438.04,2.66],[[-0.985542,-0.169429,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_HelipadRescue_F","a3\structures_f\mil\helipads\helipadrescue_f.p3d",[6929.38,7474.43,2.66],[[-0.170124,0.985423,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_PaperBox_closed_F","a3\structures_f_epa\mil\scrapyard\paperbox_closed_f.p3d",[6913.06,7411.86,3.3032],[[0.984418,0.175845,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PaperBox_closed_F","a3\structures_f_epa\mil\scrapyard\paperbox_closed_f.p3d",[6912.65,7413.64,3.3032],[[0.857539,-0.514418,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PaperBox_closed_F","a3\structures_f_epa\mil\scrapyard\paperbox_closed_f.p3d",[6915.78,7395.64,3.3032],[[-0.194283,0.980945,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PaperBox_open_full_F","a3\structures_f_epa\mil\scrapyard\paperbox_open_full_f.p3d",[6918.06,7395.46,3.268],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6927.79,7417.55,3.16649],[[-0.689456,0.724328,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6927.11,7415,3.16649],[[-0.976918,-0.213616,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6930.19,7416.59,3.16649],[[0.991021,0.133709,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6930.36,7415.26,3.16649],[[0.990036,-0.140816,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6929.36,7414.06,3.16649],[[0.181825,-0.983331,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6927.85,7413.87,3.16649],[[-0.284276,-0.958743,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[6928.95,7415.95,3.07155],[[0.981791,0.189963,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[6928.17,7415.79,3.07155],[[-0.981375,-0.192101,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6926.8,7416.39,3.16649],[[-0.98288,0.184247,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_InfoStand_V2_F","a3\structures_f\civ\infoboards\infostand_v2_f.p3d",[6935.1,7408.24,3.24026],[[0.98315,0.1828,0],[0,0,1]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand2',[]]))];
		}],
		["Land_InfoStand_V1_F","a3\structures_f\civ\infoboards\infostand_v1_f.p3d",[6935.9,7403.89,3.23536],[[0.977008,0.213202,0],[0,0,1]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand1',[]]))];
		}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6929.44,7431.39,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6897.15,7397.75,3.2895],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6897.35,7396.65,3.2895],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6897.56,7395.68,3.2895],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6929.94,7376.34,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6930.94,7376.5,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6931.96,7376.76,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6914.44,7437.74,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6915.59,7437.94,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6916.72,7438.1,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6917.88,7438.22,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6918.97,7438.35,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6920.09,7438.51,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6921.19,7438.73,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6937.45,7399.94,3.16649],[[-0.981127,0.193365,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6937.8,7397.96,3.16649],[[-0.847929,-0.530109,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MedicalTent_01_floor_light_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_floor_light_f.p3d",[6924.14,7430.1,2.66],[[0.974558,0.224135,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MedicalTent_01_floor_dark_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_floor_dark_f.p3d",[6907.79,7426.39,2.66],[[0.974833,0.222935,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6898.82,7428.87,3.15567],[[0.982043,0.188658,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6897.36,7430.95,3.04567],[[0.983693,0.179854,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[6927.21,7428.42,2.90162],[[-0.278337,0.960484,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[6924.82,7427.68,2.90162],[[-0.278337,0.960484,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[6922.39,7427.08,2.90162],[[-0.278337,0.960484,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[6923.59,7432.47,2.90162],[[0.252447,-0.967611,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[6926.13,7433.02,2.90162],[[-0.278337,0.960484,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_empty_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[6924.68,7433.35,3.59139],[[0.977255,0.212069,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[6926.19,7427.62,3.59139],[[0.968304,0.249775,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[6923.72,7426.9,3.59139],[[0.968304,0.249775,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_white_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[6921.16,7431.45,3.16649],[[0.830012,-0.557746,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_white_F","a3\structures_f\civ\camping\campingtable_f.p3d",[6920.16,7432.35,3.07155],[[0.227297,-0.973826,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_white_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[6919.8,7431.32,3.0652],[[0.979987,0.19906,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_open_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_open_f.p3d",[6919.89,7431.08,3.53579],[[0.210456,-0.977603,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[6923.85,7431.27,2.83884],[[-0.244519,0.969645,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Shed_06_F","a3\structures_f_exp\civilian\sheds\shed_06_f.p3d",[7089.39,7300.47,4.0757],[[0.17884,-0.983878,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[7085.37,7296.63,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[7084.26,7302.25,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[7094.3,7298.6,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[7093.34,7304.23,3.40051],[[0.981951,0.189138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[7085.54,7306.25,3.40051],[[-0.180965,0.983489,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[7092.94,7294.7,3.40051],[[0.173402,-0.984851,0],[0,0,1]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[7091.73,7302.61,3.55242],[[-0.986106,-0.166116,0],[0,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[7117.43,7288.91,2.66],[[-0.164959,0.9863,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[7124.26,7249.16,2.75415],[[-0.164938,0.985516,-0.0394071],[0.0159977,0.0426222,0.998963]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[7130.9,7208.01,2.66],[[-0.164959,0.9863,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[7082.07,7200.62,2.66],[[-0.164959,0.9863,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[7075.11,7241.29,2.66],[[-0.164959,0.9863,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[7066.66,7280.22,2.66],[[-0.164959,0.9863,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6935.93,7406.12,3.18026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[7046.31,7555.68,2.66],[[-0.164959,0.9863,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7009.45,7565.18,3.04567],[[0.908821,-0.417186,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7010.56,7567.55,3.04567],[[0.908821,-0.417186,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7011.62,7569.91,3.04567],[[0.908821,-0.417186,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7012.71,7572.28,3.04567],[[0.908821,-0.417186,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7013.8,7574.66,3.04567],[[0.908821,-0.417186,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7008.41,7562.79,3.04567],[[0.919818,-0.392344,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7007.36,7560.4,3.04567],[[0.908821,-0.417186,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[6995.49,7571.92,3.04567],[[0.911885,-0.410445,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[6996.58,7574.29,3.04567],[[0.911885,-0.410445,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[6997.63,7576.66,3.04701],[[0.911885,-0.410445,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[6998.7,7579.04,3.05101],[[0.911885,-0.410445,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[6999.77,7581.42,3.04567],[[0.911885,-0.410445,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[6994.47,7569.51,3.04567],[[0.922698,-0.385523,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[6993.44,7567.11,3.0415],[[0.911804,-0.410445,0.0121529],[-0.0133272,0,0.999911]],0,0,2,1,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[7006.63,7559.43,2.77068],[[-0.922993,0.384817,0],[0,0,1]],0,1,0,0,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[7014.05,7575.88,2.77068],[[-0.922993,0.384817,0],[0,0,1]],0,1,0,0,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[7000.5,7582.41,2.77068],[[-0.922993,0.384817,0],[0,0,1]],0,1,0,0,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[6993.2,7565.92,2.76331],[[-0.922911,0.384817,-0.0123009],[-0.0133272,0,0.999911]],0,1,0,0,[],{}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[7014.74,7565.61,3.77381],[[-0.921964,0.387275,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[7014.66,7565.6,3.65184],[[-0.92347,0.38367,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[7014.72,7565.59,3.0652],[[0.925868,-0.377847,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7053.94,7463.42,2.87],[[-0.986342,-0.164711,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7049.8,7468.21,2.87],[[-0.170696,0.985324,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7041.26,7466.72,2.87],[[-0.170696,0.985324,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7051.59,7457.71,2.87],[[0.13414,-0.990962,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7042.88,7456.4,2.87],[[-0.170696,0.985324,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[7037.96,7460.8,2.87385],[[-0.990692,-0.136126,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7076.09,7341.4,3.87],[[-0.986342,-0.164711,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7071.95,7346.19,3.87],[[-0.170696,0.985324,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7063.42,7344.69,3.87],[[-0.170696,0.985324,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7073.74,7335.69,3.87],[[0.13414,-0.990962,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[7065.03,7334.37,3.87],[[-0.170696,0.985324,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[7060.19,7335.49,3.40051],[[-0.988083,-0.153922,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[6900.87,7424.17,16.8384],[[-0.97679,-0.214197,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_airdefense_laptop',(_this # 0),TRUE];
			(_this # 0) setDir ((getDir (_this # 0)) + 180);
		}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[6908.14,7426.6,3.07155],[[-0.214971,0.97662,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[6911.18,7424.03,3.07155],[[-0.214971,0.97662,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[6912.38,7424.88,3.07155],[[-0.970426,-0.2414,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_FlatTV_01_F","a3\structures_f_heli\items\electronics\flattv_01_f.p3d",[6911.2,7423.93,3.78612],[[0.159714,-0.987163,0],[0,0,1]],0,0,0,0,[],{}],
		["Land_PCSet_01_keyboard_F","a3\structures_f_heli\items\electronics\pcset_01_keyboard_f.p3d",[6911.85,7424.39,3.48353],[[0.522986,-0.852341,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_mousepad_F","a3\props_f_orange\items\electronics\pcset_01_mousepad_f.p3d",[6911.43,7424.28,3.47923],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_mouse_F","a3\structures_f_heli\items\electronics\pcset_01_mouse_f.p3d",[6911.42,7424.33,3.50807],[[0.5547,-0.83205,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_screen_F","a3\structures_f_heli\items\electronics\pcset_01_screen_f.p3d",[6912.02,7424.06,3.73028],[[0.534409,-0.845226,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_screen_F","a3\structures_f_heli\items\electronics\pcset_01_screen_f.p3d",[6912.42,7424.46,3.73028],[[0.845631,-0.533767,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[6912.34,7425.09,3.63167],[[-0.995202,0.097839,0],[0,0,1]],0,0,0,0,[],{
			(_this # 0) setDir ((getDir (_this # 0)) + 180);
		}],
		["Land_Portable_generator_F","a3\structures_f\items\electronics\portable_generator_f.p3d",[6909.72,7423.48,3.01918],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_case_F","a3\structures_f_heli\items\electronics\pcset_01_case_f.p3d",[6910.96,7424.08,2.91704],[[0.131496,-0.991317,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_case_F","a3\structures_f_heli\items\electronics\pcset_01_case_f.p3d",[6910.7,7424.04,2.91704],[[0.131496,-0.991317,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HDMICable_01_F","a3\structures_f_heli\items\electronics\hdmicable_01_f.p3d",[6911.96,7424.25,3.4807],[[0.971576,-0.236729,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Map_Tanoa_F","a3\structures_f_epb\items\documents\map_blank_f.p3d",[6908.74,7426.62,3.4806],[[0,1,0],[0,0,1]],0,0,1,1,[],{}],
		["Land_TripodScreen_01_large_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[6903.91,7425.51,3.81316],[[0.976121,0.217226,0],[0,0,1]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_billboard2',[]]))];
		}],
		["Land_PortableGenerator_01_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[6904.29,7426.49,3.14566],[[-0.999999,0.00160361,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Orange_01_F","a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d",[6928.33,7415.33,3.5168],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Can_V3_F","a3\structures_f\items\food\can_v3_f.p3d",[6928.03,7415.44,3.51661],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Can_V3_F","a3\structures_f\items\food\can_v3_f.p3d",[6929.15,7416.38,3.51661],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[6928.98,7371.04,3.87385],[[0.985049,0.172276,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[6922.63,7366.57,3.75245],[[0.149797,-0.988717,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[6927.21,7365.3,3.75245],[[0.149797,-0.988717,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[6920.67,7373.98,3.75245],[[0.180347,-0.983603,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[6925.49,7374.92,3.75245],[[0.149797,-0.988717,0],[0,0,1]],0,0,2,0,[],{}],
		["MapBoard_Tanoa_F","a3\structures_f\civ\infoboards\mapboard_f.p3d",[6905.82,7423.94,3.73887],[[-0.777897,-0.628392,0],[0,0,1]],0,0,1,1,[],{}],
		["Land_OfficeChair_01_F","a3\structures_f_heli\furniture\officechair_01_f.p3d",[6911.01,7424.84,3.33442],[[-0.981668,0.190601,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[6920.14,7363.42,12.9173],[[0.787361,-0.616492,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[6920.6,7376.96,8.64218],[[0.801565,-0.597907,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[6901.39,7432.42,8.64218],[[-0.57234,-0.820016,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[6916.58,7394.74,8.64218],[[0.632402,-0.77464,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[6911.68,7420.22,8.64218],[[-0.243465,-0.96991,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[7083.05,7303.88,6.43203],[[0.998709,0.0507962,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[7082.82,7304.37,6.43203],[[-0.848668,0.528925,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[7061.16,7335.15,6.43203],[[-0.113608,0.993526,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[6841.74,7276.2,3.0861],[[-0.488614,0.8725,0.000238581],[0.000488281,0,1]],0,0,2,1,[],{
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) hideObjectGlobal TRUE;
			};
		}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[6841.68,7276.29,3.64628],[[-0.56136,0.827572,0.000274102],[0.000488281,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_cas_laptop',(_this # 0),TRUE];
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) enableDynamicSimulation FALSE;
				(_this # 0) setVariable ['QS_dynSim_ignore',TRUE,TRUE];
				(_this # 0) hideObjectGlobal TRUE;
			};
			(_this # 0) setDir ((getDir (_this # 0)) + 180);
		}],
		["Land_SCF_01_chimney_F","a3\structures_f_exp\industrial\sugarcanefactory_01\scf_01_chimney_f.p3d",[6876.81,7240.19,33.2707],[[-0.532993,-0.84612,0],[0,0,1]],0,0,2,0,[],{
			_chimney = _this # 0;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_chimney,2]]),
				TRUE
			];
			_fire = createVehicle ['test_EmptyObjectForFireBig',[0,0,0],[],0,'NONE'];
			_fire allowDamage FALSE;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_fire,2]]),
				TRUE
			];			
			missionNamespace setVariable ['QS_torch',_fire,TRUE];
			_fire enableDynamicSimulation FALSE;
			_fire setVariable ['QS_dynSim_ignore',TRUE,TRUE];
			_fire attachTo [_chimney,[-2,0,31]];
			_fire spawn {
				uiSleep 0.1;
				detach _this;
			};
		}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[6792.67,7423.99,8.64218],[[-0.881599,-0.472,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6805.47,7394.92,3.04567],[[-0.213697,0.9769,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6802.93,7394.34,3.04567],[[-0.213697,0.9769,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6800.41,7393.78,3.04567],[[-0.213697,0.9769,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6799.14,7394.96,3.04567],[[0.984245,0.17681,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6798.68,7397.56,3.04567],[[0.982623,0.185614,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6799.51,7399.31,3.04567],[[0.219915,-0.975519,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[6802.04,7399.88,3.04567],[[0.219915,-0.975519,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_RepairDepot_01_green_F","a3\structures_f_tank\military\repairdepot\repairdepot_01_green_f.p3d",[6799.11,7413.83,5.07851],[[0.196649,-0.980474,0.000162179],[-3.56867e-005,0.000158252,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6674.34,6980.42,-18.9063],[[0.651476,0.758669,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6664.07,6968.48,-18.9334],[[0.651476,0.758669,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6653.66,6956.49,-18.9334],[[0.651476,0.758669,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_barrel_F","a3\structures_f_exp\naval\piers\pierwooden_02_barrel_f.p3d",[6571.87,6915.16,-19.1662],[[-0.960648,0.277767,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_hut_F","a3\structures_f_exp\naval\piers\pierwooden_02_hut_f.p3d",[6578.31,6911.04,-16.9415],[[-0.95739,0.288798,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_ladder_F","a3\structures_f_exp\naval\piers\pierwooden_02_ladder_f.p3d",[6572.29,6910.81,-19.0792],[[-0.958148,0.286274,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6643.33,6944.51,-18.9299],[[0.651476,0.758669,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6632.96,6932.45,-18.9605],[[0.651476,0.758669,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6622.59,6920.4,-18.9521],[[0.651476,0.758669,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_30deg_F","a3\structures_f_exp\naval\piers\pierwooden_02_30deg_f.p3d",[6616.37,6913.4,-19.078],[[-0.665152,-0.746708,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6607.63,6910.4,-18.9939],[[0.957173,0.289516,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_30deg_F","a3\structures_f_exp\naval\piers\pierwooden_02_30deg_f.p3d",[6598.65,6907.88,-19.1155],[[-0.961727,-0.27401,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_PierWooden_02_16m_F","a3\structures_f_exp\naval\piers\pierwooden_02_16m_f.p3d",[6589.66,6910.02,-19.0445],[[0.963285,-0.268483,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[6678.45,6983.47,4.63239],[[-0.958327,-0.285675,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[6615.72,6914.46,4.56615],[[0.376498,-0.926418,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[6598.46,6909.15,4.52859],[[-0.405813,-0.913956,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[6582.15,6913.38,4.43318],[[-0.656601,-0.754238,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[6677.69,6984.36,1.38062],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		//["Land_TripodScreen_01_dual_v1_F","a3\props_f_exp\military\camps\tripodscreen_01_dual_v1_f.p3d",[6932.27,7397.99,3.46966],[[-0.272542,0.962144,0],[0,0,1]],0,0,0,0,[],{missionNamespace setVariable ['QS_panel_support',(_this # 0),TRUE];}],
		["Flag_RedCrystal_F","a3\structures_f\mil\flags\mast_f.p3d",[6929.94,7426.93,6.6368],[[0,1,0],[0,0,1]],0,1,0,0,[],{}]
	]
};
if (_worldName isEqualTo 'Malden') exitWith {
	[
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[8133.84,10135.8,30.5744],[[0,1,0],[0.000845728,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[8143.63,10129.2,29.8759],[[-0.999831,-0.0103755,0.0152024],[0.0151952,0.000771951,0.999884]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[8131.83,10106.5,30.5761],[[0.0103443,0.999946,-8.74844e-006],[0.000845728,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[8123.24,10114,30.2935],[[-0.999886,0.00915611,0.0119995],[0.012,0,0.999928]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[8127.85,10117.1,30.579],[[0.0299079,0.999553,-2.52939e-005],[0.000845728,0,1]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8106,10134.2,30.2865],[[-0.0434716,-0.999055,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8117.23,10133.7,30.2348],[[-0.0434718,-0.999055,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8120.83,10133.6,30.1974],[[-0.0434718,-0.999055,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8102.12,10130.6,30.2906],[[-0.999296,0.0375107,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8101.45,10119.3,30.2917],[[-0.999894,0.0145511,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8101.38,10111.3,30.2899],[[-0.99996,0.00895632,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8101.31,10103.4,30.2898],[[-0.99996,0.00895632,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8105.05,10099.7,30.2769],[[0.0023852,0.999997,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8113.01,10099.7,30.2449],[[0.0023852,0.999997,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8120.99,10099.7,30.13],[[0.0023852,0.999997,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8133.46,10101.4,29.8767],[[-0.999918,0.012777,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8128.24,10097.8,29.9854],[[0.502683,0.864471,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8132.68,10096.5,29.6492],[[0,0.999988,0.00479659],[0.0239937,-0.00479521,0.999701]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8101.61,10124.4,30.0677],[[0,1,0],[0.00154408,0,0.999999]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8101.72,10125.6,30.0675],[[0,1,0],[0.00154408,0,0.999999]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8111.16,10133.9,30.0584],[[0,1,0.00077204],[0.00077204,-0.00077204,0.999999]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8112.23,10133.9,30.0576],[[0,1,0.00077204],[0.00077204,-0.00077204,0.999999]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8146.54,10124.8,29.6866],[[0.0289394,0.999581,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8146.65,10138.4,29.6794],[[-0.0229533,-0.999737,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8150.68,10134.5,29.634],[[0.999739,-0.0228512,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8150.71,10129.3,29.4103],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8150.74,10128.3,29.4103],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8150.74,10127.3,29.4103],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8150.76,10126.4,29.4103],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8150.67,10125.3,29.4103],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8102.72,10138.6,30.2918],[[0.999528,-0.0307209,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PipeWall_concretel_8m_F","a3\structures_f\walls\pipewall_concretel_8m_f.p3d",[8102.68,10146.3,30.2918],[[0.997268,0.0738717,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Shed_06_F","a3\structures_f_exp\civilian\sheds\shed_06_f.p3d",[8057.4,10290.7,31.8147],[[0,1,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[8053.36,10288.1,30.6671],[[-0.999585,0.000270834,0.028789],[0.028787,-0.00559695,0.99957]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[8053.44,10293.6,30.6959],[[-0.999585,0.000270834,0.028789],[0.028787,-0.00559695,0.99957]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[8061.82,10293.8,30.4734],[[-0.999672,0.00020693,0.0255924],[0.0255896,-0.00879288,0.999634]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[8061.69,10288.2,30.4278],[[-0.999585,0.000270834,0.028789],[0.028787,-0.00559695,0.99957]],0,0,2,1,[],{}],
		["Land_HBarrier_3_F","a3\structures_f\mil\fortification\hbarrier_3_f.p3d",[8054.41,10284.6,30.6797],[[0,0.999992,0.00399675],[0.028787,-0.00399509,0.999578]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[8059.89,10297.1,30.5521],[[0.00588032,0.999945,0.00864509],[0.0255896,-0.00879288,0.999634]],0,0,2,1,[],{}],
		["Land_HBarrier_3_F","a3\structures_f\mil\fortification\hbarrier_3_f.p3d",[8060.78,10284.9,30.4974],[[0,0.999992,0.00399675],[0.028787,-0.00399509,0.999578]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8057.48,10284.4,30.3125],[[0,0.999992,0.00399675],[0.028787,-0.00399509,0.999578]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[8055.68,10296.8,30.4367],[[0,0.999961,0.00879576],[0.0255896,-0.00879288,0.999634]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[8055.12,10288.7,30.7711],[[-0.999544,0.00899479,0.0288366],[0.028787,-0.00559695,0.99957]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[8037.3,10365.7,30.2222],[[0.999952,0.00968839,0.00158962],[-0.00158221,-0.000772039,0.999998]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[8038.49,10312.3,30.1562],[[0.999948,0.00969724,-0.00317853],[0.00320187,-0.00239207,0.999992]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[8039.34,10265.6,29.7444],[[0.999945,0.00965409,0.00408163],[-0.00399675,-0.00879569,0.999953]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[8098.12,10350.4,30.0221],[[-0.999958,-0.00917065,0.000757499],[0.00077204,-0.00158221,0.999998]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[8099.4,10316.4,29.8068],[[-0.999957,-0.00915383,-0.00167009],[-0.00158221,-0.00959929,0.999953]],0,0,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[8100.01,10287.2,29.5571],[[-0.999957,-0.00915517,-0.00166274],[-0.00158221,-0.00879574,0.99996]],0,0,0,0,[],{}],
		["Land_PedestrianCrossing_01_6m_4str_F","a3\structures_f_argo\decals\horizontal\pedestriancrossing_01_6m_4str_f.p3d",[8096.35,10124.8,29.5558],[[-0.0086324,-0.999963,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Airport_02_controlTower_F","a3\structures_f_exp\infrastructure\airports\airport_02_controltower_f.p3d",[8110.43,10103.6,40.4159],[[-0.999982,0.00599668,0],[0,0,1]],0,1,0,0,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[8103.9,10103.7,43.6637],[[0.999181,0.0404527,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_airdefense_laptop',(_this # 0),TRUE];
			(_this # 0) setDir ((getDir (_this # 0)) + 180);
		}],
		["Land_TripodScreen_01_large_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[8140.9,10106.5,30.7192],[[-0.354884,0.93491,0.000300135],[0.000845728,0,1]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_billboard2',[]]))];
		}],
		["Land_PortableGenerator_01_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[8140,10106.7,30.0524],[[-0.00060114,-1,5.08401e-007],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_MapBoard_01_Wall_Malden_F","a3\props_f_orange\civilian\infoboards\mapboard_01_wall_f.p3d",[8138.15,10105.8,31.6876],[[-0.0243173,-0.999704,0],[0,0,1]],0,0,1,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8136.6,10106.2,30.0912],[[0.00809035,0.999967,-6.84224e-006],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8135.22,10106.8,30.0923],[[0.999993,-0.00370363,-0.000845722],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_OfficeChair_01_F","a3\structures_f_heli\furniture\officechair_01_f.p3d",[8136.88,10107.3,30.3538],[[0.804667,0.593725,-0.00068053],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[8135.21,10107.4,30.6525],[[0.958359,-0.285566,-0.000810511],[0.000845728,0,1]],0,0,0,0,[],{
			(_this # 0) setDir ((getDir (_this # 0)) + 180);
		}],
		["Land_FlatTV_01_F","a3\structures_f_heli\items\electronics\flattv_01_f.p3d",[8136.57,10105.9,30.8058],[[-0.127821,-0.991797,0.000108102],[0.000845728,0,1]],0,0,0,0,[],{}],
		["Land_PCSet_01_screen_F","a3\structures_f_heli\items\electronics\pcset_01_screen_f.p3d",[8135.64,10106.2,30.7507],[[-0.438452,-0.898754,0.000370811],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_screen_F","a3\structures_f_heli\items\electronics\pcset_01_screen_f.p3d",[8135.25,10106.6,30.751],[[-0.907051,-0.42102,0.000767119],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_keyboard_F","a3\structures_f_heli\items\electronics\pcset_01_keyboard_f.p3d",[8136.54,10106.4,30.5032],[[-0.218531,-0.97583,0.000184818],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_mousepad_IDAP_F","a3\props_f_orange\items\electronics\pcset_01_mousepad_f.p3d",[8136.08,10106.4,30.4993],[[-0.0672235,-0.997738,5.68528e-005],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_mouse_F","a3\structures_f_heli\items\electronics\pcset_01_mouse_f.p3d",[8136.06,10106.5,30.5282],[[-0.209172,-0.977879,0.000176903],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_case_F","a3\structures_f_heli\items\electronics\pcset_01_case_f.p3d",[8136.42,10106.2,29.9368],[[-0.0170109,-0.999855,1.43866e-005],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_PCSet_01_case_F","a3\structures_f_heli\items\electronics\pcset_01_case_f.p3d",[8136.17,10106.2,29.937],[[-0.0279222,-0.99961,2.36146e-005],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_Portable_generator_F","a3\structures_f\items\electronics\portable_generator_f.p3d",[8137.99,10106.2,30.0376],[[0,1,0],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8138.51,10111.1,30.0896],[[-0.999507,0.0313769,0.000845311],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8138.56,10113.1,30.0895],[[-0.999507,0.0313769,0.000845311],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8137.46,10110.6,30.1854],[[-0.981456,-0.191686,0.000830045],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8137.59,10112.6,30.1853],[[-0.994102,0.108448,0.00084074],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8139.39,10111.3,30.1835],[[0.862678,-0.505753,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8139.56,10112.8,30.1836],[[0.971258,0.238027,-0.00082142],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8138.66,10114.7,30.1844],[[-0.0102035,0.999948,8.62937e-006],[0.000845728,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8138.43,10109.6,30.1844],[[-0.241674,-0.970358,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8117.81,10128.5,29.8934],[[0,1,0.00077204],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8117.81,10127.7,29.8927],[[-0.00246808,-0.999997,-0.000748345],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8118.33,10126.6,29.9818],[[0.0825703,-0.996584,-0.00156206],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8117.24,10126.6,29.9923],[[-0.438067,-0.898935,0.00351132],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8116.12,10127.6,30.0039],[[-0.929648,-0.368347,0.00864001],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8116.22,10128.8,30.0038],[[-0.872873,0.487869,0.00875602],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8117.21,10129.6,29.995],[[-0.112012,0.993705,0.00184247],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8118.6,10129.6,29.9794],[[0.399333,0.916801,-0.00312569],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8119.31,10128.6,29.9719],[[0.941127,0.337939,-0.00877368],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_Orange_01_F","a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d",[8117.24,10128.4,30.3441],[[0,1,0.00077204],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_Can_V3_F","a3\structures_f\items\food\can_v3_f.p3d",[8118.24,10128.6,30.3344],[[0,1,0.00077204],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_Can_V3_F","a3\structures_f\items\food\can_v3_f.p3d",[8117.15,10127.6,30.3441],[[0,1,0.00077204],[0.00959931,-0.000772005,0.999954]],0,0,2,1,[],{}],
		["Land_Shed_06_F","a3\structures_f_exp\civilian\sheds\shed_06_f.p3d",[8105.9,10131.2,31.5302],[[0,1,0],[0,0,1]],0,0,2,0,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[8103.59,10129.6,30.4367],[[-0.999957,0.00915611,0.00154402],[0.00154408,0,0.999999]],0,0,2,0,[],{
			(_this # 0) setVariable ['QS_arsenal_object',TRUE,TRUE];
			missionNamespace setVariable ['QS_arsenals',((missionNamespace getVariable 'QS_arsenals') + [(_this # 0)]),TRUE];
		}],
		["FlagPole_F","a3\structures_f\mil\flags\mast_f.p3d",[8101.72,10134.8,33.5241],[[0,1,0],[0,0,1]],0,1,0,0,[],{
			(_this # 0) setFlagTexture (missionNamespace getVariable ['QS_missionConfig_textures_communityFlag','a3\data_f\flags\flag_nato_co.paa']);
		}],
		["FlagPole_F","a3\structures_f\mil\flags\mast_f.p3d",[8123.6,10124.4,33.3987],[[0,1,0],[0,0,1]],0,1,0,0,[],{
			(_this # 0) setFlagTexture (missionNamespace getVariable ['QS_missionConfig_textures_communityFlag','a3\data_f\flags\flag_nato_co.paa']);
		}],
		["Land_PedestrianCrossing_01_6m_4str_F","a3\structures_f_argo\decals\horizontal\pedestriancrossing_01_6m_4str_f.p3d",[8090.54,10124.9,29.5651],[[-0.0086324,-0.999963,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_InfoStand_V1_F","a3\structures_f\civ\infoboards\infostand_v1_f.p3d",[8102.17,10122.7,30.1219],[[-0.964404,-0.264428,0.00148912],[0.00154408,0,0.999999]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand1',[]]))];
		}],
		["Land_InfoStand_V2_F","a3\structures_f\civ\infoboards\infostand_v2_f.p3d",[8102.73,10127.6,30.1259],[[-0.960836,0.277115,0.00148361],[0.00154408,0,0.999999]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand2',[]]))];
		}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8101.35,10132.5,30.0543],[[0.938186,0.346127,-0.00144864],[0.00154408,0,0.999999]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8101.37,10129.6,30.0543],[[0.968077,-0.250648,-0.00149479],[0.00154408,0,0.999999]],0,0,2,1,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[8039.3,10187.1,29.5989],[[0.999476,-0.0323447,-0.000746665],[0.00077204,0.00077204,0.999999]],0,0,0,0,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[8038.4,10147.9,29.6109],[[0.999476,-0.0323447,-0.000746665],[0.00077204,0.00077204,0.999999]],0,0,0,0,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[8037.38,10107.6,29.6522],[[0.999474,-0.0323497,-0.00231345],[0.00239208,0.00239207,0.999994]],0,0,0,0,[],{}],
		["Land_HelipadRescue_F","a3\structures_f\mil\helipads\helipadrescue_f.p3d",[8073.9,10061.9,29.6258],[[-0.999472,0.0321453,0.00476929],[0.00479659,0.000772031,0.999988]],0,0,0,0,[],{}],
		["Land_RepairDepot_01_tan_F","a3\structures_f_tank\military\repairdepot\repairdepot_01_tan_f.p3d",[8248.16,10151.4,31.3085],[[0.0057535,-0.999983,0.00016126],[5.06141e-006,0.000161292,1]],0,0,2,0,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[8243.6,10155,29.2757],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[8246.2,10155,29.2757],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[8248.79,10155,29.2757],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[8251.4,10155,29.2757],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_SCF_01_chimney_F","a3\structures_f_exp\industrial\sugarcanefactory_01\scf_01_chimney_f.p3d",[8164.7,10080.4,59.1227],[[0,1,0],[0,0,1]],0,0,2,0,[],{
			_chimney = _this # 0;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_chimney,2]]),
				TRUE
			];
			_fire = createVehicle ['test_EmptyObjectForFireBig',[0,0,0],[],0,'NONE'];
			_fire allowDamage FALSE;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_fire,2]]),
				TRUE
			];			
			missionNamespace setVariable ['QS_torch',_fire,TRUE];
			_fire enableDynamicSimulation FALSE;
			_fire setVariable ['QS_dynSim_ignore',TRUE,TRUE];
			_fire attachTo [_chimney,[-2,0,31]];
			_fire spawn {
				uiSleep 0.1;
				detach _this;
			};
		}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[7964.41,9622.5,32.0698],[[-0.404211,0.914666,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[7964.46,9622.49,31.3613],[[0.400129,-0.91644,0.00586021],[0,0.0063944,0.99998]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[7964.46,9622.46,31.9481],[[-0.421875,0.906636,-0.00578905],[0,0.00638507,0.99998]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7950.15,10180,30.83],[[0.998986,-0.0450114,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7953.59,10185.4,30.83],[[0.0243486,0.999704,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7953.49,10174.6,30.8303],[[0.00965472,0.999953,-0.000690502],[0,0.000690534,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7962.14,10174.6,30.8303],[[0.0332453,0.999447,-0.000690152],[0,0.000690534,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7962.12,10185.4,30.83],[[0.0249526,0.999689,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[7966.84,10183.4,30.3603],[[0.999798,-0.0200858,-0.000756378],[0.00077204,0.00077204,0.999999]],0,0,2,1,[],{}],
		
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7949.76,10025.9,30.18],[[0.999887,-0.0150096,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7953.04,10031.4,30.18],[[-0.00566539,0.999984,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7953.27,10020.6,30.18],[[-0.0203601,0.999793,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7961.92,10020.8,30.18],[[0.00323498,0.999995,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[7961.57,10031.6,30.18],[[-0.00506125,0.999987,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[7965.86,10026.3,30.1839],[[0.999785,-0.0207503,0],[0,0,1]],0,0,2,1,[],{}],
		
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[7965.87,10184.2,33.392],[[-0.816656,-0.577124,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[7964.9,10030.4,33.742],[[-0.816656,-0.577124,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[8061.91,10284.3,33.436],[[-0.737302,0.675564,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[8061.11,10297.9,33.559],[[-0.938446,-0.345427,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7967.36,9620.22,31.3562],[[0.405883,-0.913903,0.00626788],[0.00077204,0.00720106,0.999974]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7969.73,9621.31,31.3464],[[0.405883,-0.913903,0.00626788],[0.00077204,0.00720106,0.999974]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7972.11,9622.39,31.3368],[[0.405883,-0.913903,0.00626788],[0.00077204,0.00720106,0.999974]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7974.48,9623.45,31.3273],[[0.405883,-0.913903,0.00626788],[0.00077204,0.00720106,0.999974]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7976.83,9624.49,31.3168],[[0.405883,-0.913901,0.00667005],[0.00158221,0.00800089,0.999967]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7954.46,9614.33,31.394],[[0.405883,-0.913906,0.005844],[0,0.0063944,0.99998]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7956.83,9615.42,31.387],[[0.405883,-0.913906,0.005844],[0,0.0063944,0.99998]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7959.21,9616.49,31.3801],[[0.405883,-0.913906,0.005844],[0,0.0063944,0.99998]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7961.58,9617.55,31.3734],[[0.405883,-0.913906,0.005844],[0,0.0063944,0.99998]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7963.93,9618.59,31.3667],[[0.405883,-0.913906,0.005844],[0,0.0063944,0.99998]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7963.21,9596.45,31.4261],[[0.405883,-0.913925,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7965.58,9597.54,31.4257],[[0.405883,-0.913925,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7967.96,9598.62,31.4257],[[0.405883,-0.913925,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7970.33,9599.68,31.4257],[[0.405883,-0.913925,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7972.68,9600.72,31.4245],[[0.405883,-0.913924,0.00141117],[0,0.00154408,0.999999]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7975.05,9601.81,31.4228],[[0.405883,-0.913924,0.00141117],[0,0.00154408,0.999999]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7977.41,9602.9,31.421],[[0.405883,-0.913924,0.00141117],[0,0.00154408,0.999999]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7979.8,9603.98,31.4193],[[0.405883,-0.913924,0.00141117],[0,0.00154408,0.999999]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7982.17,9605.03,31.4176],[[0.405883,-0.913924,0.00141117],[0,0.00154408,0.999999]],0,0,2,1,[],{}],
		["Land_CncBarrier_stripes_F","a3\structures_f\walls\cncbarrier_stripes_f.p3d",[7984.52,9606.08,31.4135],[[0.405883,-0.913923,0.00187282],[0.00077204,0.00239208,0.999997]],0,0,2,1,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[7977.92,9624.49,31.0401],[[0,0.999968,-0.0080009],[0.00158221,0.00800089,0.999967]],0,1,0,0,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[7953.77,9613.3,31.1248],[[0,0.99998,-0.0063944],[0,0.0063944,0.99998]],0,1,0,0,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[7961.58,9596.58,31.1507],[[0,1,0],[0,0,1]],0,1,0,0,[],{}],
		["PortableHelipadLight_01_red_F","a3\structures_f_heli\items\airport\portablehelipadlight_01_f.p3d",[7985.23,9607.2,31.1349],[[0,0.999997,-0.00239208],[0.00077204,0.00239208,0.999997]],0,1,0,0,[],{}],
		["Land_PortableLight_double_F","a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d",[7965.7,9625.17,32.0195],[[0,1,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_MedicalTent_01_white_IDAP_open_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_f.p3d",[8111.62,10075.3,30.7928],[[-0.99973,-0.0215362,0.00875965],[0.00879576,-0.00158215,0.99996]],0,0,0,0,[],{
		
		}],
		["Land_MedicalTent_01_floor_light_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_floor_light_f.p3d",[8111.71,10075.3,29.4174],[[-0.999528,-0.02944,0.00874538],[0.00879576,-0.00158215,0.99996]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[8114.4,10073,29.5912],[[-0.0475992,0.998818,0.0098519],[0.0223931,-0.00879355,0.999711]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[8112.19,10072.8,29.6348],[[-0.0476093,0.998824,0.00920454],[0.00879576,-0.00879542,0.999923]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[8110.06,10072.7,29.6532],[[-0.0476093,0.998824,0.00920454],[0.00879576,-0.00879542,0.999923]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[8111.7,10077.6,29.6683],[[-0.0476104,0.998853,0.00505773],[0.00559927,-0.00479651,0.999973]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[8114.29,10077.5,29.6243],[[-0.0476017,0.99885,0.00574311],[0.0199947,-0.00479563,0.999789]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[8111.77,10076.4,29.5994],[[0,0.999988,0.00479659],[0.00559927,-0.00479651,0.999973]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_open_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_open_f.p3d",[8107.45,10077.1,30.3362],[[0,0.999999,0.00158221],[0.00879576,-0.00158215,0.99996]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_white_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[8109.18,10076.8,29.9486],[[0.782703,-0.622345,-0.00786943],[0.00879576,-0.00158215,0.99996]],0,0,2,1,[],{}],
		["Land_CampingTable_white_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8107.38,10077.7,29.871],[[0.999798,0.0181014,-0.00876569],[0.00879576,-0.00158215,0.99996]],0,0,2,1,[],{}],
		["Land_CampingTable_white_F","a3\structures_f\civ\camping\campingtable_f.p3d",[8108.74,10078.3,29.86],[[0.0183359,-0.99983,-0.00174323],[0.00879576,-0.00158215,0.99996]],0,0,2,1,[],{}],
		["Flag_IDAP_F","a3\structures_f\mil\flags\mast_asym_f.p3d",[8106.36,10071.6,33.4109],[[0,1,0],[0,0,1]],0,1,0,0,[],{}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[8116.89,10079.9,33.1179],[[-0.859647,-0.510889,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[8124.3,10132.9,35.3994],[[-0.475633,0.879644,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[8123.94,10106,35.3488],[[0.756497,0.653997,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[8142.85,10116.1,34.9779],[[0.71908,-0.694928,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_Hangar_F","a3\structures_f\ind\airport\hangar_f.p3d",[8068.54,9997.13,35.2021],[[-0.00282081,-0.999996,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[8058.26,10015.4,30.4647],[[-0.973136,0.230231,0],[0,0,1]],0,0,2,0,[],{
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) hideObjectGlobal TRUE;
			};
		}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[8058.24,10015.4,31.0285],[[-0.9131,0.407736,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_cas_laptop',(_this # 0),TRUE];
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) enableDynamicSimulation FALSE;
				(_this # 0) setVariable ['QS_dynSim_ignore',TRUE,TRUE];
				(_this # 0) hideObjectGlobal TRUE;
			};
			(_this # 0) setDir ((getDir (_this # 0)) + 180);
		}],
		["Land_PortableGenerator_01_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[8106.05,10133.1,29.9173],[[0,1,0.00077204],[0.00077204,-0.00077204,0.999999]],0,0,2,1,[],{}],
		["Land_TripodScreen_01_large_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[8105.14,10133.3,30.5857],[[0.485414,-0.874284,-0.00104974],[0.00077204,-0.00077204,0.999999]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_Billboard_02',(_this # 0),TRUE];
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_billboard1',[]]))];
		}],
		["Land_AirConditioner_01_F","a3\props_f_orange\humanitarian\camps\airconditioner_01_folded_f.p3d",[8106.21,10077.8,30.0005],[[0,0.999999,0.00158221],[0.00879576,-0.00158215,0.99996]],0,0,2,1,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[7997.52,10228.3,29.5894],[[1,-6.39758e-007,-0.00077204],[0.00077204,0.00077204,0.999999]],0,0,0,0,[],{}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[7996.69,10240.8,31.0595],[[-0.0392301,0.99923,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[7996.74,10240.7,30.3469],[[0.0347521,-0.996666,-0.0738123],[0.0359782,-0.0725614,0.996715]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[7996.72,10240.7,30.9406],[[-0.0585643,0.995493,0.0745921],[0.0360741,-0.0725611,0.996711]],0,0,2,1,[],{}],
		["Land_PortableLight_double_F","a3\structures_f_epa\civ\constructions\portablelight_double_f.p3d",[7994.31,10243,31.2624],[[-0.365129,0.930957,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[8101.49,10035.3,35.1328],[[0.760673,0.649135,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[8113.31,10072.4,30.3006],[[0.994013,0.107158,-0.0213229],[0.0223931,-0.00879355,0.999711]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[8111.11,10072.3,30.3297],[[0.994224,0.107039,-0.0078041],[0.00879576,-0.00879542,0.999923]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[8112.99,10078.3,30.3475],[[0.994064,0.107061,-0.0193667],[0.0199947,-0.00479563,0.999789]],0,0,2,1,[],{}],
		["Land_Pier_small_F","a3\structures_f\naval\piers\pier_small_f.p3d",[8524.27,10131.9,-4.95848],[[-0.871029,0.491232,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Pier_small_F","a3\structures_f\naval\piers\pier_small_f.p3d",[8546.66,10116,-4.9693],[[-0.871029,0.491232,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[8113.8,10054.8,30.3927],[[-0.999825,-0.01869,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[8113.64,10044.9,30.2778],[[-0.999124,0.0418369,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[8108.79,10040.6,30.2937],[[0.0365101,0.999333,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[8101.35,10040.8,30.3128],[[0,1,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[8099.25,10045.5,30.5349],[[0.999437,0.0335548,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[8099.27,10055.4,30.632],[[0.999636,-0.0269759,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[8104.05,10059.8,30.5957],[[-0.0216466,-0.999766,0],[0,0,1]],0,0,2,0,[],{}],
		//["Land_TripodScreen_01_dual_v1_F","a3\props_f_exp\military\camps\tripodscreen_01_dual_v1_f.p3d",[8102.88,10118.3,30.3551],[[0.810759,0.585378,-0.00125188],[0.00154408,0,0.999999]],0,0,0,0,[],{missionNamespace setVariable ['QS_panel_support',(_this # 0),TRUE];}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[8109.12,10057.8,30.4996],[[0,1,0],[0,0,1]],0,0,2,0,[],{}]
	]
};
if (_worldName isEqualTo 'Enoch') exitWith {
	[
		["FlagPole_F","a3\structures_f\mil\flags\mast_f.p3d",[4068.7,10214.2,72.1358],[[-0.706138,0.708074,0],[0,0,1]],0,1,0,0,[],{
			(_this # 0) setFlagTexture (missionNamespace getVariable ['QS_missionConfig_textures_communityFlag','a3\data_f\flags\flag_nato_co.paa']);
		}],
		["FlagPole_F","a3\structures_f\mil\flags\mast_f.p3d",[4086,10231.8,72.1368],[[-0.706138,0.708074,0],[0,0,1]],0,1,0,0,[],{
			(_this # 0) setFlagTexture (missionNamespace getVariable ['QS_missionConfig_textures_communityFlag','a3\data_f\flags\flag_nato_co.paa']);
		}],
		["Flag_RedCrystal_F","a3\structures_f\mil\flags\mast_f.p3d",[4032.36,10180.9,72.075],[[-0.73256,0.680703,0],[0,0,1]],0,1,0,0,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[4032.29,10232.4,68.16],[[0.702466,-0.711717,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[4068.05,10268.3,68.16],[[0.702466,-0.711717,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HelipadRescue_F","a3\structures_f\mil\helipads\helipadrescue_f.p3d",[4021.16,10193.8,68.16],[[0.699628,-0.714507,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[3885.25,10190.2,67.9006],[[0.218673,0.975395,0.0280322],[0.0287868,-0.0351633,0.998967]],0,0,2,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[3879.85,10154.2,67.4235],[[0.218757,0.975625,-0.0173602],[0.00800059,0.0159972,0.99984]],0,0,2,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[3844.94,10152.3,67.9446],[[0.218741,0.974736,0.0451939],[0.0143974,-0.0495345,0.998669]],0,0,2,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[3838.9,10116.5,67.7822],[[0.218764,0.975633,-0.0168221],[-0.00158221,0.0175944,0.999844]],0,0,2,0,[],{}],
		["Land_ControlTower_02_F","a3\structures_f_enoch\military\airfield\controltower_02_f.p3d",[4112.95,10282.9,78.2724],[[-0.705802,-0.708409,0],[0,0,1]],0,0,2,0,[],{
			(_this # 0) animateSource ['door_1_nosound_source',1];
			(_this # 0) animateSource ['door_1_sound_source',1];
		}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4100.4,10384.5,69.6528],[[0.697604,0.709915,-0.0967917],[0.0797452,0.0573212,0.995166]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4099.09,10390.4,69.5918],[[0.768459,-0.634781,-0.0807737],[0.109732,0.00636504,0.993941]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4104.81,10396.8,69.5187],[[0.740862,-0.671242,-0.023609],[0.0303859,-0.00161842,0.999537]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4109.21,10401.2,69.5427],[[0.731693,-0.680161,-0.0447899],[0.00320178,-0.0622794,0.998054]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4115.15,10399.9,69.4218],[[-0.673772,-0.738875,0.00969902],[0.0143936,0,0.999896]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4121.37,10394.3,69.37],[[-0.673842,-0.738875,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4122.98,10388.4,69.37],[[0.742179,-0.670202,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4117.23,10382.1,69.3829],[[0.710449,-0.703676,-0.0101295],[0,-0.0143936,0.999896]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[4105.07,10379.9,69.1131],[[-0.668117,-0.734403,0.119465],[0.0797452,0.0889574,0.992838]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_3_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_3_green_f.p3d",[4113.38,10378.1,68.9583],[[0.689797,-0.724003,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4216.45,10511.4,69.5395],[[0.773123,-0.634251,-0.00247538],[0.00320178,0,0.999995]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4222.17,10517.8,69.4575],[[0.741196,-0.671261,0.00611021],[0.00479631,0.0143975,0.999885]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4228.79,10517.1,69.43],[[-0.673842,-0.738875,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4235.02,10511.5,69.3938],[[-0.673811,-0.738875,0.00646396],[0.00959269,0,0.999954]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4215.94,10504.6,69.52],[[-0.673842,-0.738875,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4222.16,10499,69.5772],[[-0.673842,-0.738663,-0.0177264],[0,-0.023991,0.999712]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4229.13,10498.8,69.4352],[[0.772985,-0.634172,-0.0178818],[0.0191947,-0.00479543,0.999804]],0,0,2,1,[],{}],
		["Land_HBarrier_01_big_4_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_big_4_green_f.p3d",[4234.84,10505.2,69.3955],[[0.74117,-0.671279,-0.00711014],[0.00959269,0,0.999954]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[4086.75,10232.9,69.0524],[[-0.73445,0.678663,0],[0,0,1]],0,0,2,0,[],{

		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[4092.53,10231.1,69.1536],[[0.689826,-0.723975,0],[0,0,1]],0,0,2,0,[],{

		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[4098.15,10225.3,69.1536],[[-0.706152,0.70806,0],[0,0,1]],0,0,2,0,[],{

		}],
		["Land_Cargo20_EMP_F","a3\structures_f_enoch\industrial\cargo\cargo20_emp_f.p3d",[4090.05,10231.4,69.3279],[[0.688477,-0.725258,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Cargo20_EMP_F","a3\structures_f_enoch\industrial\cargo\cargo20_emp_f.p3d",[4091.04,10205.6,69.4718],[[0.739811,0.672814,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_WoodenCrate_01_stack_x5_F","a3\props_f_exp\commercial\market\woodencrate_01_stack_x5_f.p3d",[4099.18,10224,69.2232],[[-0.774293,-0.632827,0],[0,0,1]],0,0,2,1,[],{}],
		["Fridge_01_closed_F","a3\structures_f_heli\items\electronics\fridge_01_f.p3d",[4089.47,10228.6,68.7797],[[-0.650578,0.75944,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4103.11,10206.5,71.9016],[[0.2341,-0.972213,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4105.07,10208.7,71.9016],[[0.981233,-0.192827,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4067.18,10214,68.6324],[[0.234085,-0.972122,0.0135086],[-0.0111984,0.0111977,0.999875]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4069.14,10216.2,68.6664],[[0.981233,-0.192827,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[4100.98,10234.6,68.6728],[[-0.698269,0.715836,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[4101.53,10234,68.6728],[[0.704876,-0.70933,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4102.18,10236.4,68.7677],[[0.230496,0.973073,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4103.37,10235.3,68.7677],[[0.901645,0.432478,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4100.38,10236,68.7677],[[-0.683343,0.730098,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4099.33,10234.9,68.7677],[[-0.931115,0.364726,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4099.29,10233.1,68.7677],[[-0.688165,-0.725554,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4100.54,10231.9,68.7677],[[-0.395555,-0.918442,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4102.32,10232.7,68.7677],[[0.518334,-0.855178,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[4115.69,10224.5,71.8013],[[0.70096,0.7132,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[4105.71,10286.4,78.201],[[-0.821088,0.570802,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_airdefense_laptop',(_this # 0),TRUE];
		}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[4106.01,10286.7,77.6307],[[0.707498,-0.706715,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4104.1,10285.8,77.6636],[[0.946704,0.322104,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4084.68,10230.5,68.8003],[[-0.718662,0.695359,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4083.39,10229.1,68.8003],[[0.122073,0.992521,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4081.81,10228,68.8003],[[-0.903106,-0.429418,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4080.45,10226.3,68.8003],[[0.99879,-0.0491797,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4079.16,10225,68.8003],[[0.705427,-0.708782,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4077.86,10224,68.8003],[[-0.749812,0.66165,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4076.4,10222.4,68.8003],[[0.151091,-0.98852,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4075.22,10220.8,68.8003],[[0.992552,0.12182,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4073.99,10219.7,68.8018],[[-0.12964,0.99156,0.0015308],[0,-0.00154382,0.999999]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4072.2,10218.2,68.8003],[[-0.0539685,-0.998543,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_DragonsTeeth_01_1x1_old_F","a3\structures_f_tank\military\fortifications\dragonsteeth_01_1x1_old_f.p3d",[4071.11,10216.7,68.8003],[[0.861456,0.507832,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[4085.53,10228.8,68.6469],[[-0.710168,0.704033,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[4082.98,10226.2,68.6469],[[-0.710168,0.704033,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[4080.34,10223.6,68.6469],[[-0.710168,0.704033,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[4077.72,10220.9,68.6458],[[-0.710168,0.704033,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[4075.09,10218.3,68.6458],[[-0.710168,0.704033,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[4072.77,10215.9,68.6458],[[-0.710168,0.704033,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Smokestack_03_F","a3\structures_f_enoch\industrial\smokestacks\smokestack_03_f.p3d",[4018.93,10132.6,85.5996],[[-0.124837,-0.992177,0],[0,0,1]],0,0,2,0,[],{
			_chimney = _this # 0;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_chimney,2]]),
				TRUE
			];
			_fire = createVehicle ['test_EmptyObjectForFireBig',[0,0,0],[],0,'NONE'];
			_fire allowDamage FALSE;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_fire,2]]),
				TRUE
			];			
			missionNamespace setVariable ['QS_torch',_fire,TRUE];
			_fire enableDynamicSimulation FALSE;
			_fire setVariable ['QS_dynSim_ignore',TRUE,TRUE];
			_fire attachTo [_chimney,[1,1,20]];
			_fire spawn {
				uiSleep 0.1;
				detach _this;
			};
		}],
		["Land_HelipadCivil_F","a3\structures_f\mil\helipads\helipadcivil_f.p3d",[4070.25,10353.9,68.16],[[0.697268,-0.716811,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[4052.73,10338.2,69.2738],[[-0.772037,-0.635578,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[4052.68,10338.2,69.1272],[[-0.769548,-0.638589,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[4052.7,10338.2,68.564],[[0.765511,0.643422,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MedicalTent_01_white_generic_open_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_f.p3d",[4037.4,10177.8,69.4647],[[-0.709705,0.704499,0.00109566],[0.00154382,0,0.999999]],0,0,1,0,[],{}],
		["Land_MedicalTent_01_floor_light_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_floor_light_f.p3d",[4037.39,10177.8,68.0902],[[-0.706874,0.707339,0.00109129],[0.00154382,0,0.999999]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[4037.19,10181.3,68.3324],[[-0.66666,-0.745358,-0.00252036],[0.00158197,-0.00479631,0.999987]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[4039.08,10179.7,68.3316],[[-0.666661,-0.745361,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[4040.88,10177.9,68.3316],[[-0.666661,-0.745361,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[4035.68,10176.1,68.3345],[[0.686433,0.727193,-0.00105973],[0.00154382,0,0.999999]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[4033.87,10178,68.3374],[[-0.66666,-0.745361,0.00102921],[0.00154382,0,0.999999]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_empty_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[4034.35,10176.5,69.0264],[[-0.698074,0.716024,0.0010777],[0.00154382,0,0.999999]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[4038.41,10180.9,69.0214],[[-0.725295,0.688439,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[4040.32,10179.2,69.0214],[[-0.725295,0.688439,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_white_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4037.84,10174.6,68.5966],[[0.0326465,0.999466,-0.00163301],[0.00158197,0.00158221,0.999997]],0,0,2,1,[],{}],
		["Land_CampingTable_white_F","a3\structures_f\civ\camping\campingtable_f.p3d",[4037.6,10173.3,68.5042],[[0.70504,0.709164,-0.0022374],[0.00158197,0.00158221,0.999997]],0,0,2,1,[],{}],
		["Land_CampingTable_small_white_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[4038.66,10173.5,68.4958],[[-0.688495,0.725241,-5.83049e-005],[0.00158197,0.00158221,0.999997]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_open_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_open_f.p3d",[4038.81,10173.7,68.9658],[[0.717174,0.696891,-0.00223718],[0.00158197,0.00158221,0.999997]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[4036.56,10177,68.2703],[[-0.692362,-0.72155,0.00106889],[0.00154382,0,0.999999]],0,0,2,1,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[4108.29,10217,69.4751],[[0.715475,0.698638,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[4100.8,10216.8,69.4751],[[-0.716555,0.697531,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[4099.76,10208.2,69.4751],[[0.715475,0.698638,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[4099.96,10211.3,69.3537],[[0.70475,-0.709455,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4046.16,10169.4,74.0722],[[0.710814,0.70338,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4044.63,10177.2,74.0722],[[0.710814,0.70338,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4037.72,10170.6,74.0789],[[0.710814,0.70338,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4095.67,10241.7,74.1422],[[0.710814,0.70338,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4094.94,10241,74.1422],[[0.710814,0.70338,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4059.87,10205.4,74.0722],[[0.710814,0.70338,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4059.14,10204.6,74.0722],[[0.710814,0.70338,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[4104.03,10380.9,72.1378],[[0.934888,0.354942,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampShabby_F","a3\structures_f\civ\lamps\lampshabby_f.p3d",[4225.98,10497.4,72.1292],[[0.143188,0.989695,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Reflector_Cone_01_wide_green_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[4115.78,10240.6,74.3931],[[-0.764634,-0.644465,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		//["Reflector_Cone_01_wide_green_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[4106.82,10208.6,74.1574],[[-0.698904,0.715216,0],[0,0,1]],0,1,0,0,[],{}],
		//["Reflector_Cone_01_wide_green_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[4061.12,10183.3,73.2304],[[0.753835,0.657064,0],[0,0,1]],0,1,0,0,[],{}],
		["Reflector_Cone_01_wide_white_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[4051.73,10337.4,70.4815],[[0.759794,0.650164,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Reflector_Cone_01_wide_white_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[3899.21,10192.9,67.7863],[[-0.982182,-0.187934,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Reflector_Cone_01_wide_white_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[3893.58,10157.8,67.6803],[[-0.923855,-0.382743,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_Shed_06_F","a3\structures_f_exp\civilian\sheds\shed_06_f.p3d",[3863.99,10135.6,69.1922],[[-0.775547,-0.631289,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[3858.68,10137.2,68.2219],[[0.638436,-0.768999,0.0322689],[-0.0543197,-0.00319705,0.998518]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[3863.07,10140.9,68.4378],[[0.639327,-0.768891,0.00818273],[-0.0127979,0,0.999918]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[3864.72,10130.4,68.5617],[[0.638138,-0.768238,0.0508853],[-0.0622778,0.0143698,0.997955]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[3869.19,10133.9,68.6835],[[0.639298,-0.767591,0.0458556],[-0.0159977,0.0463439,0.998797]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[3867.19,10141.7,68.4906],[[0.774118,0.632963,0.00990792],[-0.0127979,0,0.999918]],0,0,2,1,[],{}],
		["Land_HBarrier_01_line_5_green_F","a3\structures_f_exp\military\fortifications\hbarrier_01_line_5_green_f.p3d",[3860.64,10129.7,68.3262],[[-0.777734,-0.627575,-0.0357627],[-0.0575043,0.014378,0.998242]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[3866.94,10134.6,68.7772],[[-0.621167,0.782427,-0.0442593],[-0.0127933,0.0463448,0.998844]],0,0,2,0,[],{}],
		["Reflector_Cone_01_wide_red_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[3862.22,10129.7,70.4948],[[0.273554,0.961857,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[4097.43,10239.6,68.6728],[[0.726801,-0.686848,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_TripodScreen_01_large_black_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[4096.88,10240.1,69.3044],[[0.731999,-0.681306,0],[0,0,1]],0,0,1,0,[],{
			missionNamespace setVariable ['QS_Billboard_02',(_this # 0),TRUE];
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_billboard1',[]]))];
		}],
		["Land_PortableGenerator_01_black_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[4096.05,10239,68.6369],[[0.783756,-0.621069,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Router_01_black_F","a3\props_f_enoch\military\equipment\router_01_f.p3d",[4097.84,10240.3,69.1926],[[0.477772,-0.878484,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PortableServer_01_cover_black_F","a3\props_f_enoch\military\equipment\portableserver_01_cover_f.p3d",[4096.95,10239.1,69.1188],[[0.706271,0.707941,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[4114.98,10225.3,71.8084],[[0.70096,0.7132,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[4114.98,10225.3,72.6214],[[0.70096,0.7132,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PortableServer_01_black_F","a3\props_f_enoch\military\equipment\portableserver_01_f.p3d",[4115.01,10225.2,73.2023],[[-0.709965,-0.704237,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PortableServer_01_black_F","a3\props_f_enoch\military\equipment\portableserver_01_f.p3d",[4114.98,10225.2,72.3892],[[-0.718122,-0.695917,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PortableGenerator_01_black_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[4115.07,10225.4,71.7788],[[-0.679683,0.733506,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MultiScreenComputer_01_black_F","a3\props_f_enoch\military\equipment\multiscreencomputer_01_f.p3d",[4115.58,10224.8,72.4592],[[-0.994515,0.104593,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[4116.4,10223.8,71.8084],[[0.70096,0.7132,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[4116.55,10223.7,72.3836],[[-0.203669,-0.97904,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[4117.01,10224.9,71.9096],[[0.862064,0.506799,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MobilePhone_smart_F","a3\structures_f\items\electronics\mobilephone_smart_f.p3d",[4116.18,10224.1,72.2206],[[0.913812,0.406138,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_TripodScreen_01_dual_v1_black_F","a3\props_f_exp\military\camps\tripodscreen_01_dual_v1_f.p3d",[4072.97,10215.1,69.0698],[[0.979234,-0.202732,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_TripodScreen_01_dual_v1_black_F","a3\props_f_exp\military\camps\tripodscreen_01_dual_v1_f.p3d",[4086.35,10228.8,69.0709],[[0.042913,-0.999079,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_MapBoard_Enoch_F","a3\structures_f\civ\infoboards\mapboard_f.p3d",[4090.67,10229.6,69.2301],[[-0.666514,0.745493,0],[0,0,1]],0,0,1,1,[],{}],
		["Land_MapBoard_01_Wall_Enoch_F","a3\props_f_orange\civilian\infoboards\mapboard_01_wall_f.p3d",[4116.8,10222.8,73.0898],[[-0.709975,-0.704227,0],[0,0,1]],0,0,1,1,[],{}],
		["Land_Can_V3_F","a3\structures_f\items\food\can_v3_f.p3d",[4116.07,10223.9,72.2572],[[0.635425,-0.772162,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Can_V3_F","a3\structures_f\items\food\can_v3_f.p3d",[4089.48,10228.5,69.3347],[[-0.454326,-0.890835,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Orange_01_F","a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d",[4101.17,10233.6,69.118],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_BottlePlastic_V2_F","a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d",[4101.09,10234.7,69.2076],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["OmniDirectionalAntenna_01_black_F","a3\props_f_enoch\military\equipment\omnidirectionalantenna_01_f.p3d",[4116.5,10227.1,73.4446],[[0.314094,0.949392,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_InfoStand_V2_F","a3\structures_f\civ\infoboards\infostand_v2_f.p3d",[4077.96,10220.7,68.8485],[[-0.708753,0.705457,0],[0,0,1]],0,0,1,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand2',[]]))];
		}],
		["Land_InfoStand_V1_F","a3\structures_f\civ\infoboards\infostand_v1_f.p3d",[4080.52,10223.3,68.8366],[[-0.696967,0.717103,0],[0,0,1]],0,0,1,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand1',[]]))];
		}],
		["Land_GymRack_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_01_f.p3d",[4119.2,10223.2,69.3554],[[0.685925,-0.727672,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GymRack_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_01_f.p3d",[4121.38,10225.5,69.3554],[[0.720446,-0.693511,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GymBench_01_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymbench_01_f.p3d",[4116.49,10225.5,68.8505],[[-0.681758,0.731578,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_GymRack_03_F","a3\structures_f_bootcamp\civ\sportsgrounds\gymrack_03_f.p3d",[4117.45,10227.2,68.8439],[[0.704941,-0.709266,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PaperBox_open_full_F","a3\structures_f_epa\mil\scrapyard\paperbox_open_full_f.p3d",[4092.01,10222.6,68.8692],[[-0.875411,0.48338,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PaperBox_closed_F","a3\structures_f_epa\mil\scrapyard\paperbox_closed_f.p3d",[4090.51,10223.5,68.9044],[[0.984418,0.175845,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Airport_01_hangar_F","a3\structures_f_exp\infrastructure\airports\airport_01_hangar_f.p3d",[4322,10505.2,70.825],[[0.698572,-0.71554,0],[0,0,1]],0,1,0,0,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[4309.19,10502.7,68.5745],[[-0.860878,-0.508812,0],[0,0,1]],0,0,2,0,[],{
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) hideObjectGlobal TRUE;
			};
		}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[4309.1,10502.7,69.1497],[[0.945998,0.324174,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_cas_laptop',(_this # 0),TRUE];
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) enableDynamicSimulation FALSE;
				(_this # 0) setVariable ['QS_dynSim_ignore',TRUE,TRUE];
				(_this # 0) hideObjectGlobal TRUE;
			};
		}],
		["Land_RepairDepot_01_green_F","a3\structures_f_tank\military\repairdepot\repairdepot_01_green_f.p3d",[4312.98,10453.7,70.6447],[[-0.702112,0.712067,1.55774e-005],[-0.00158221,-0.00158197,0.999997]],0,0,2,0,[],{}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4271.94,10370.8,76.1413],[[0.998157,-0.0606768,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4229.51,10419.4,74.2522],[[-0.622104,-0.782935,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4295.24,10399.2,75.9248],[[0.239087,0.970998,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4332.35,10475.2,74.3015],[[-0.897281,0.441459,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4332.06,10476.1,74.2944],[[0.0291564,0.999575,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[4332.8,10494,74.1528],[[0.707853,0.70636,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Reflector_Cone_01_wide_white_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[4316.03,10458.5,71.9273],[[-0.633392,-0.773831,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}]
	]
};
if (_worldName isEqualTo 'Stratis') exitWith {

	[
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1908.53,5756.59,6.43051],[[-0.967576,0.25258,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1907.05,5750.99,6.43051],[[-0.967576,0.25258,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1905.55,5745.34,6.42387],[[-0.967576,0.25258,0.000628771],[0,-0.00248939,0.999997]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1900.95,5742.01,6.40792],[[-0.967573,0.252586,-0.00178025],[-0.00248975,-0.00248938,0.999994]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1899.09,5734.5,6.37076],[[-0.967573,0.252589,-0.00114828],[-0.00248975,-0.00499132,0.999984]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1901.27,5728.61,6.33827],[[-0.967573,0.252591,-0.000514382],[-0.00248975,-0.00750086,0.999969]],0,0,2,1,[],{}],
		["Land_HBarrier_3_F","a3\structures_f\mil\fortification\hbarrier_3_f.p3d",[1903.15,5726.02,6.38632],[[-0.238541,-0.971117,-0.00544115],[-0.00248975,-0.00499132,0.999984]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1899.52,5730.14,6.12391],[[0,0.999972,0.00750088],[-0.00499145,-0.00750079,0.999959]],0,0,2,1,[],{}],
		["Land_HBarrier_3_F","a3\structures_f\mil\fortification\hbarrier_3_f.p3d",[1915.11,5757.12,6.48834],[[-0.238542,-0.971132,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1903.34,5745.4,6.20211],[[0,0.999997,0.00248939],[-0.00248975,-0.00248938,0.999994]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1898.67,5738.55,6.16967],[[0,0.999988,0.00499134],[-0.00248975,-0.00499132,0.999984]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1912.36,5757.91,6.21026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1911.18,5758.25,6.21026],[[0,1,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Airport_01_hangar_F","a3\structures_f_exp\infrastructure\airports\airport_01_hangar_f.p3d",[1910.9,5953.99,8.17854],[[0.854166,0.52,0],[0,0,1]],0,1,0,0,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[1916.1,5865.9,5.5],[[-0.621693,0.783261,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[1934.23,5841.17,5.5],[[-0.621693,0.783261,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[1925.84,5807.83,5.5],[[-0.621693,0.783261,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HelipadCircle_F","a3\structures_f\mil\helipads\helipadcircle_f.p3d",[1905.89,5831.57,5.5],[[-0.621693,0.783261,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[1849.66,5773.14,5.51416],[[0.966428,-0.256926,0.00240618],[-0.00248975,0,0.999997]],0,0,2,1,[],{}],
		["Land_HelipadSquare_F","a3\structures_f\mil\helipads\helipadsquare_f.p3d",[1839.4,5734.92,5.5],[[0.966431,-0.256926,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_JumpTarget_F","a3\structures_f\mil\helipads\jumptarget_f.p3d",[1848.63,5568.31,5.5],[[-0.967704,0.25209,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_SCF_01_chimney_F","a3\structures_f_exp\industrial\sugarcanefactory_01\scf_01_chimney_f.p3d",[1950.35,5765.06,35.8588],[[0,1,0],[0,0,1]],0,0,2,0,[],{
			_chimney = _this # 0;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_chimney,2]]),
				TRUE
			];
			_fire = createVehicle ['test_EmptyObjectForFireBig',[0,0,0],[],0,'NONE'];
			_fire allowDamage FALSE;
			missionNamespace setVariable [
				'QS_setFeatureType',
				((missionNamespace getVariable 'QS_setFeatureType') + [[_fire,2]]),
				TRUE
			];
			missionNamespace setVariable ['QS_torch',_fire,TRUE];
			_fire enableDynamicSimulation FALSE;
			_fire setVariable ['QS_dynSim_ignore',TRUE,TRUE];
			_fire attachTo [_chimney,[-2,0,31]];
			_fire spawn {
				uiSleep 0.1;
				detach _this;
			};
		}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[1902.86,5729.36,6.49979],[[0.968415,-0.249341,0.000540859],[-0.00248975,-0.00750086,0.999969]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[1907.96,5749.19,6.58242],[[0.968418,-0.24933,0],[0,0,1]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[1918.76,5725.76,7.16673],[[0.243731,0.969843,-0.000291437],[0.00119573,0,0.999999]],0,0,2,1,[],{}],
		["Banner_01_NATO_F","a3\structures_f_orange\humanitarian\flags\banner_01_f.p3d",[1910.16,5728.64,9.03777],[[0.969005,-0.247043,0],[0,0,1]],0,0,1,1,[],{}],
		["Banner_01_NATO_F","a3\structures_f_orange\humanitarian\flags\banner_01_f.p3d",[1910.67,5732.24,7.78751],[[-0.968821,0.247761,0],[0,0,1]],0,0,1,1,[],{}],
		["Banner_01_AAF_F","a3\structures_f_orange\humanitarian\flags\banner_01_f.p3d",[1915.36,5750.67,7.70877],[[-0.972836,0.231494,0],[0,0,1]],0,0,1,1,[],{}],
		["Banner_01_CSAT_F","a3\structures_f_orange\humanitarian\flags\banner_01_f.p3d",[1914.72,5748.15,7.71572],[[-0.970085,0.242765,0],[0,0,1]],0,0,1,1,[],{}],
		["Banner_01_FIA_F","a3\structures_f_orange\humanitarian\flags\banner_01_f.p3d",[1914.06,5745.57,7.71289],[[-0.971432,0.237318,0],[0,0,1]],0,0,1,1,[],{}],
		["Banner_01_EAF_F","a3\structures_f_orange\humanitarian\flags\banner_01_f.p3d",[1913.47,5743.2,7.688],[[-0.966983,0.254841,0],[0,0,1]],0,0,1,1,[],{}],
		["Land_HBarrier_1_F","a3\structures_f\mil\fortification\hbarrier_1_f.p3d",[1907.98,5724.91,6.2966],[[-0.974885,0.222703,-0.00131566],[-0.00248975,-0.00499132,0.999984]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1905.93,5724.97,6.10994],[[0,0.999988,0.00499134],[-0.00248975,-0.00499132,0.999984]],0,0,2,1,[],{}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1915.82,5755.55,11.6722],[[-0.504739,0.863272,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1908.82,5725.7,11.5827],[[0.730079,0.683362,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1951.81,5828.56,11.4822],[[0.232195,0.972669,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1962.09,5870.35,11.4822],[[-0.21524,0.976561,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1942.99,5794.46,11.4822],[[0.654295,0.75624,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1887.54,5974.12,11.4822],[[-0.969234,-0.246141,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1912.46,5740.14,11.6625],[[0.232195,0.972669,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1926.29,5718.83,11.5892],[[-0.743098,-0.669183,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1997.98,5689.78,11.6822],[[-0.290759,0.956796,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1971.46,5730.5,11.6822],[[-0.641737,0.766925,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1870.87,5547.56,12.1583],[[0.730308,0.683118,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1934.8,5752.82,11.6722],[[-0.743098,-0.669183,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1997.74,5690.45,11.6822],[[0.858662,0.512542,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1972.64,5730.18,11.6822],[[-0.973165,-0.23011,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_RepairDepot_01_tan_F","a3\structures_f_tank\military\repairdepot\repairdepot_01_tan_f.p3d",[2018,5684.37,8.108],[[-0.972952,0.231008,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_Airport_Tower_F","a3\structures_f\ind\airport\airport_tower_f.p3d",[1909.89,5712.74,16.193],[[0.976116,-0.217252,0],[0,0,1]],0,1,0,0,[],{}],
		["Land_cargo_addon02_V1_F","a3\structures_f\households\slum\cargo_addon02_v1_f.p3d",[1913.13,5750,6.36377],[[-0.974798,0.223088,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1900.12,5743.79,6.17625],[[0.999767,0.0214303,0.00254254],[-0.00248975,-0.00248938,0.999994]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1899.5,5741.39,6.16871],[[0.798871,-0.601502,0.000491629],[-0.00248975,-0.00248938,0.999994]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[1913.24,5750.31,6.10155],[[-0.972348,0.233535,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1914.83,5750.46,6.19648],[[0.977275,-0.211977,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1914.57,5749.17,6.19648],[[0.981746,-0.190198,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1914.76,5751.83,6.19648],[[0.983001,0.183598,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1914.15,5747.83,6.19648],[[0.88218,-0.470913,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1913.7,5746.48,6.19648],[[0.582814,-0.812606,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1913.94,5752.96,6.19648],[[0.463379,0.88616,0],[0,0,1]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[1930.01,5724.11,6.53802],[[0.968415,-0.249339,0.0011666],[-0.00248975,-0.00499132,0.999984]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[2018.26,5686.39,6.94936],[[-0.270865,-0.962617,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1943.06,5676.39,6.9764],[[-0.59766,0.799616,-0.0584642],[0.0224937,0.0896152,0.995722]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1957.08,5672.78,7.11337],[[-0.597781,0.799263,-0.0619374],[0.0100004,0.0846902,0.996357]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1970.46,5669.2,7.17001],[[-0.597809,0.798185,-0.0743324],[0.00248939,0.0945735,0.995515]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1986.85,5666.81,7.00734],[[-0.597391,0.801245,-0.0336305],[0.0374733,0.0697803,0.996858]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[2000.3,5663.21,6.88384],[[-0.597764,0.800794,-0.0375054],[-0.0124963,0.0374706,0.99922]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[2015.89,5659.39,6.96265],[[-0.597691,0.801602,-0.0140918],[0.0199975,0.0324774,0.999272]],0,0,2,1,[],{}],
		["FlagPole_F","a3\structures_f\mil\flags\mast_f.p3d",[1899.1,5734.8,9.60857],[[0,1,0],[0,0,1]],0,1,0,0,[],{
			(_this # 0) setFlagTexture (missionNamespace getVariable ['QS_missionConfig_textures_communityFlag','a3\data_f\flags\flag_nato_co.paa']);
		}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[1918.11,5776.28,6.84649],[[-0.955185,0.29601,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[1914.97,5781.6,6.81846],[[-0.247203,-0.968964,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_10m_F","a3\structures_f\walls\new_wiredfence_10m_f.p3d",[1908.83,5778.4,6.85976],[[0.943142,-0.33239,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[1914.73,5773.08,6.75023],[[0.306984,0.951715,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[1912.7,5775.23,6.74456],[[-0.320004,-0.947416,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[1910.31,5775.95,6.74693],[[-0.320004,-0.947416,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_New_WiredFence_5m_F","a3\structures_f\walls\new_wiredfence_5m_f.p3d",[1909.15,5772.47,6.76127],[[-0.310439,-0.950593,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[1860.31,5555.99,6.02594],[[-0.763429,0.645338,-0.0267192],[-0.0349775,0,0.999388]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[1860.35,5555.96,6.61408],[[-0.769378,0.638226,-0.0269274],[-0.0349775,0,0.999388]],0,0,2,1,[],{}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[1870.21,5975.19,5.9052],[[-0.90345,-0.428693,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[1870.26,5975.22,6.49173],[[-0.899435,-0.437054,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1886.42,5973.96,11.4822],[[-0.0981791,0.995169,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1944.66,5818.28,6.24051],[[0.256326,0.96659,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1946.22,5824.13,6.24051],[[0.256326,0.96659,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_5_F","a3\structures_f\mil\fortification\hbarrier_5_f.p3d",[1940.14,5822.59,6.24051],[[-0.970693,0.240324,0],[0,0,1]],0,0,2,1,[],{}],
		["B_supplyCrate_F","a3\weapons_f\ammoboxes\supplydrop.p3d",[1941.32,5822.22,6.39242],[[0.968418,-0.24933,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CampingChair_V2_F","a3\structures_f\civ\camping\campingchair_v2_f.p3d",[1938.52,5822.82,6.00649],[[0.798874,-0.601499,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1773.37,5682.41,6.71],[[-0.967602,0.252479,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1767.56,5680.58,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1774.67,5688.64,6.71],[[-0.967602,0.252479,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1766.48,5694.94,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1760.49,5696.67,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1755.68,5692.19,6.71],[[-0.95567,0.29444,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1758.87,5683.18,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1998.38,5689.28,11.6822],[[-0.959057,-0.283212,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_LampHalogen_F","a3\structures_f\civ\lamps\lamphalogen_f.p3d",[1998.8,5690.12,11.6822],[[-0.356538,-0.934281,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1758.48,5634.7,6.71],[[-0.967602,0.252479,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1752.67,5632.88,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1759.77,5640.94,6.71],[[-0.967602,0.252479,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1751.59,5647.24,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1745.6,5648.96,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1740.79,5644.48,6.71],[[-0.95567,0.29444,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[1743.97,5635.48,6.71],[[0.303792,0.952738,0],[0,0,1]],0,0,2,1,[],{}],
		["Reflector_Cone_01_wide_white_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[1779.57,5696.42,5.524],[[-0.919764,-0.392471,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Reflector_Cone_01_wide_white_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[1765.75,5650.56,5.524],[[-0.847017,-0.531566,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Reflector_Cone_01_wide_red_F","a3\structures_f_enoch\vr\helpers\reflector_01_f.p3d",[1907.52,5940.52,10.7337],[[0.436079,0.899909,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		//["Land_TentLamp_01_suspended_red_F","a3\props_f_enoch\military\camps\tentlamp_01_suspended_f.p3d",[1921.23,5737.14,10.1198],[[0,1,0],[0,0,1]],0,1,0,0,[],{(missionNamespace getVariable 'QS_lamps') pushBack (_this # 0);}],
		["Land_MedicalTent_01_NATO_generic_open_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_f.p3d",[1894.97,5774.49,7.04835],[[-0.269583,-0.962974,0.00239758],[0,0.00248975,0.999997]],0,0,0,0,[],{}],
		["Land_MedicalTent_01_floor_light_F","a3\structures_f_orange\humanitarian\camps\medicaltent_01_floor_light_f.p3d",[1895,5774.56,5.67359],[[0.260666,0.965426,-0.00240368],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[1893.29,5777.96,5.90672],[[0.958262,-0.28589,0.000711798],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[1892.45,5775.11,5.91384],[[0.958262,-0.28589,0.000711798],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[1898.22,5776.63,5.91004],[[0.958262,-0.28589,0.000711798],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[1897.43,5773.79,5.91714],[[0.958262,-0.28589,0.000711798],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_F","a3\props_f_orange\humanitarian\camps\stretcher_01_f.p3d",[1891.73,5772.35,5.92074],[[-0.967368,0.253376,-0.000630845],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_folded_F","a3\props_f_orange\humanitarian\camps\stretcher_01_folded_f.p3d",[1890.72,5771.05,5.75026],[[-0.980162,0.198197,-0.000493462],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_folded_F","a3\props_f_orange\humanitarian\camps\stretcher_01_folded_f.p3d",[1892.05,5770.77,5.75096],[[-0.980162,0.198197,-0.000493462],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[1895.66,5770.02,6.0965],[[0.289685,0.957119,-0.002383],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[1897.14,5770.18,6.09611],[[-0.962252,0.272158,-0.000677608],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[1895.27,5770.18,6.679],[[0.230126,0.973158,-0.00242293],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_FirstAidKit_01_closed_F","a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d",[1893.62,5774.75,5.85196],[[0.964257,-0.264969,0.00065971],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_2bags_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[1898.48,5775.79,6.60193],[[0,0.999997,-0.00248975],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_IntravenStand_01_empty_F","a3\props_f_orange\humanitarian\camps\intravenstand_01_f.p3d",[1892.13,5775.8,6.60191],[[0,0.999997,-0.00248975],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Stretcher_01_folded_F","a3\props_f_orange\humanitarian\camps\stretcher_01_folded_f.p3d",[1895.39,5769.97,5.75297],[[0.918457,-0.39552,0.000984751],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_PaperBox_01_small_closed_brown_IDAP_F","a3\props_f_orange\humanitarian\supplies\paperbox_01_small_closed_f.p3d",[1897.63,5771.45,5.88834],[[-0.978169,0.207809,-0.000517394],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_PaperBox_01_small_closed_brown_IDAP_F","a3\props_f_orange\humanitarian\supplies\paperbox_01_small_closed_f.p3d",[1897.63,5771.46,6.30401],[[-0.953526,0.301309,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PaperBox_01_small_closed_brown_IDAP_F","a3\props_f_orange\humanitarian\supplies\paperbox_01_small_closed_f.p3d",[1897.62,5772.18,5.88652],[[-0.99992,0.0126382,-3.14661e-005],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_PaperBox_01_small_closed_white_IDAP_F","a3\props_f_orange\humanitarian\supplies\paperbox_01_small_closed_f.p3d",[1891.03,5774.08,5.88177],[[0.977863,-0.209245,0.00052097],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Flag_RedCrystal_F","a3\structures_f\mil\flags\mast_f.p3d",[1899.56,5773.16,9.65391],[[0,1,0],[0,0,1]],0,1,0,0,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1893.43,5768.91,6.20798],[[0,0.999997,-0.00248975],[0,0.00248975,0.999997]],0,0,2,1,[],{}],
		["Land_Bollard_01_F","a3\structures_f_exp\signs\traffic\bollard_01_f.p3d",[1896.51,5780.15,6.17825],[[0,0.999988,-0.00499145],[0.00248939,0.00499144,0.999984]],0,0,2,1,[],{}],
		["Land_TentHangar_V1_F","a3\structures_f\mil\tenthangar\tenthangar_v1_f.p3d",[1906.1,5639.68,9.94166],[[-0.260117,-0.965577,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1864.2,5978.74,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1865.55,5976.52,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1866.9,5974.3,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1868.25,5972.07,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1869.58,5969.86,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1848.97,5970.02,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1850.32,5967.79,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1851.67,5965.58,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1853.02,5963.35,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_CncBarrier_F","a3\structures_f\walls\cncbarrier_f.p3d",[1854.35,5961.13,5.88567],[[-0.854502,-0.519448,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[1904.16,5715.63,19.3893],[[-0.910962,0.412491,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_airdefense_laptop',(_this # 0),TRUE];
		}],
		["Land_CampingTable_small_F","a3\structures_f\civ\camping\campingtable_small_f.p3d",[1911.28,5940.75,5.9052],[[0.0133972,-0.99991,0],[0,0,1]],0,0,2,1,[],{
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) hideObjectGlobal TRUE;
			};
		}],
		["Land_Laptop_03_black_F","a3\props_f_enoch\military\equipment\laptop_03_f.p3d",[1911.38,5940.68,6.48042],[[0.200374,0.97972,0],[0,0,1]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_cas_laptop',(_this # 0),TRUE];
			if ((missionNamespace getVariable ['QS_missionConfig_carrierEnabled',0]) isNotEqualTo 0) then {
				(_this # 0) enableDynamicSimulation FALSE;
				(_this # 0) setVariable ['QS_dynSim_ignore',TRUE,TRUE];
				(_this # 0) hideObjectGlobal TRUE;
			};
		}],
		["Land_TripodScreen_01_large_black_F","a3\props_f_exp\military\camps\tripodscreen_01_large_f.p3d",[1912.56,5741.42,6.72672],[[-0.976252,-0.216638,-0.000539299],[0,-0.00248939,0.999997]],0,0,0,0,[],{
			missionNamespace setVariable ['QS_Billboard_02',(_this # 0),TRUE];
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_billboard1',[]]))];
		}],
		["Land_PortableGenerator_01_black_F","a3\props_f_exp\military\camps\portablegenerator_01_f.p3d",[1912.5,5742.42,6.06172],[[-0.96884,-0.247688,-0.000616593],[0,-0.00248939,0.999997]],0,0,2,1,[],{}],
		["SatelliteAntenna_01_Black_F","a3\props_f_enoch\military\camps\satelliteantenna_01_f.p3d",[1917.46,5752.75,11.9963],[[-0.91411,-0.391,-0.107339],[-0.130685,0.0335115,0.990857]],0,0,2,1,[],{}],
		["Land_InfoStand_V1_F","a3\structures_f\civ\infoboards\infostand_v1_f.p3d",[1902.22,5731.61,6.19797],[[-0.945937,-0.324315,-0.00478794],[-0.00248975,-0.00750086,0.999969]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand2',[]]))];
		}],
		["Land_InfoStand_V2_F","a3\structures_f\civ\infoboards\infostand_v2_f.p3d",[1904.82,5742.22,6.26387],[[-0.704521,0.709681,0.00176668],[0,-0.00248939,0.999997]],0,0,0,0,[],{
			(_this # 0) setObjectTextureGlobal [0,(selectRandom (missionNamespace getVariable ['QS_missionConfig_textures_infostand1',[]]))];
		}],
		["Land_CampingTable_F","a3\structures_f\civ\camping\campingtable_f.p3d",[1912.78,5748.41,6.10155],[[-0.972348,0.233535,0],[0,0,1]],0,0,2,1,[],{}],
		["GalleryFrame_02_F","a3\props_f_aow\civilian\gallery\galleryframe_02_f.p3d",[1916.65,5721.72,8.37705],[[-0.246652,-0.969104,0],[0,0,1]],0,0,2,1,[],{}],
		["GalleryFrame_02_square_F","a3\props_f_aow\civilian\gallery\galleryframe_02_square_f.p3d",[1911.63,5722.96,8.27739],[[-0.26204,-0.965057,0],[0,0,1]],0,0,2,1,[],{}],
		["GalleryFrame_01_large_v3_F","a3\props_f_aow\civilian\gallery\galleryframe_01_large_v3_f.p3d",[1910.97,5731.79,8.30252],[[-0.97221,0.234112,0],[0,0,1]],0,0,2,1,[],{}],
		["GalleryFrame_02_large_rectangle_F","a3\props_f_aow\civilian\gallery\galleryframe_02_large_rectangle_f.p3d",[1929.11,5732.78,8.10499],[[0.967253,-0.253815,0],[0,0,1]],0,0,2,1,[],{}],
		["GalleryFrame_01_large_v1_F","a3\props_f_aow\civilian\gallery\galleryframe_01_large_f.p3d",[1911.98,5736.02,8.26366],[[-0.969081,0.246745,0],[0,0,1]],0,0,2,1,[],{}],
		["GalleryFrame_01_large_v2_F","a3\props_f_aow\civilian\gallery\galleryframe_01_large_v2_f.p3d",[1930.21,5737.09,8.18863],[[0.966979,-0.254855,0],[0,0,1]],0,0,2,1,[],{}],
		["GalleryFrame_01_large_portrait_F","a3\props_f_aow\civilian\gallery\galleryframe_01_large_portrait_f.p3d",[1917.1,5744.87,8.38494],[[0.246747,0.96908,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_Shed_06_F","a3\structures_f_exp\civilian\sheds\shed_06_f.p3d",[1906.25,5731.16,7.04502],[[-0.244666,-0.969607,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_PedestrianCrossing_01_8m_10str_F","a3\structures_f_argo\decals\horizontal\pedestriancrossing_01_8m_10str_f.p3d",[1859.3,5970.17,5.5],[[-0.865514,-0.500885,0],[0,0,1]],0,0,2,1,[],{}],
		["Banner_01_FIA_F","a3\structures_f_orange\humanitarian\flags\banner_01_f.p3d",[1930.9,5740.04,9.06002],[[-0.971432,0.237318,0],[0,0,1]],0,0,1,1,[],{}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[1948.7,5820.38,6.61381],[[-0.969095,0.246686,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_WoodenShelter_01_F","a3\structures_f_exp\commercial\market\woodenshelter_01_f.p3d",[1945.3,5821.23,6.61381],[[0.967502,-0.252862,0],[0,0,1]],0,0,2,1,[],{}],
		["Land_HBarrier_Big_F","a3\structures_f\mil\fortification\hbarrier_big_f.p3d",[4093.03,4596.67,222.44],[[-0.976027,0.217649,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HBarrier_1_F","a3\structures_f\mil\fortification\hbarrier_1_f.p3d",[4093.99,4601.56,221.932],[[-0.0907789,-0.995871,0],[0,0,1]],0,0,2,0,[],{}],
		["Land_HBarrier_1_F","a3\structures_f\mil\fortification\hbarrier_1_f.p3d",[4092.23,4591.91,221.865],[[0,0.999847,0.0174959],[-0.0174959,-0.0174932,0.999694]],0,0,2,0,[],{}],
		["Land_PortableCabinet_01_medical_F","a3\props_f_enoch\military\camps\portablecabinet_01_medical_f.p3d",[4098.88,4587.95,221.646],[[0.448847,-0.888591,0.0945619],[-0.022494,0.0945518,0.995266]],0,0,2,1,[],{}]
	]
};