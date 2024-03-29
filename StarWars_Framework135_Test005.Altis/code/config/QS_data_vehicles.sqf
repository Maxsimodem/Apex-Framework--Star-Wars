/*---------------------------------------------------------------------------------------------------------------------------
*
* file							:	QS_data_vehicles.sqf
* 
* Synopsis						:	This file contains the spawning parameters for every respawning vehicle and crates. This
*									includes the off-base boats.
* 
* Framework Version				:	1.3.5
* 
* Modification Date				:	2023-07-22
* 
* Modification Description		:	In addition to documentation improvements, vanilla vehicles were replaced with Star
*									Wars and Operation TREBUCHET equivalents. Modifications were only made for Altis.
* 
* Completion Date				:	2023-07-22
* 
* Developer						:	Maxsimodem
* 
* Notes							:	Observe the second block comment for instruction on how this file works.
*
*--------------------------------------------------------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------------------------------------------------------
*
*	Vehicle Parameter formatting:	
*		[
*			objnull,				// --- [DO NOT EDIT] the vehicle object stored here once it spawns
*			30,						// --- [CAN EDIT] vehicle respawn delay
*			false,					// --- [CAN EDIT] randomized vehicle
*			{},						// --- [CAN EDIT] custom init code
*			'B_Quadbike_01_F',		// --- [CAN EDIT] vehicle type
*			[0,0,0],				// --- [CAN EDIT] vehicle spawn position
*			0,						// --- [CAN EDIT] vehicle spawn direction
*			false,					// --- [DO NOT EDIT] is vehicle respawning now
*			0,						// --- [DO NOT EDIT] when can vehicle respawn
*			-1,						// --- [CAN EDIT] FOB vehicle ID (-1 if not a FOB vehicle, -2 if a terrain vehicle (like boat))
*			50,						// --- [CAN EDIT] vehicle abandonment distance (at base)
*			500,					// --- [CAN EDIT] vehicle abandonment distance (away from base)
*			-1,						// --- [CAN EDIT] respawn tickets
*			5,						// --- [CAN EDIT] required safe respawn radius
*			true,					// --- [CAN EDIT] is a dynamic "Activate" vehicle (performance saving)
*			0						// --- [CAN EDIT] is spawned on an aircraft carrier deck
*		]
*	
*	How to derive in 3DEN Editor:
*		private _array = [];
*		{
*			if (
*				(_x isKindOf 'AllVehicles') || 
*				(_x isKindOf 'Reammobox_F')
*			) then {
*				_array pushBack [objNull,30,FALSE,{},typeOf _x,position _x,getDir _x,false,0,-1,50,500,-1,4,true,0];
*			};
*		} forEach (all3DENEntities # 0);
*		copyToClipboard str _array;
*		
*		OR
*		
*		private _array = [];
*		{
*			if (
*				(_x isKindOf 'AllVehicles') || 
*				(_x isKindOf 'Reammobox_F')
*			) then {
*				_array pushBack [objNull,30,FALSE,{},typeOf _x,position _x,getDir _x,false,0,-1,50,500,-1,4,true,0];
*			};
*		} forEach (get3DENSelected 'object');
*		copyToClipboard str _array;
*
*-------------------------------------------------------------------------------------------------------------------------*/

_worldName = worldName;
if (_worldName isEqualTo 'Altis') exitWith {
	[
		/*/Aircraft/*/
		[objNull,500,false,{},"3as_LAATC",[14588.97,16604.461,27.7285],89,false,0,-1,150,500,-1,0,false,1],
		[objNull,120,false,{},"lsd_heli_laati",[14677.72,16615.813,26.5947],359,false,0,-1,150,500,-1,0,false,1],
		[objNull,120,false,{},"lsd_heli_laati",[14654.22,16591.293,26.5947],359,false,0,-1,150,500,-1,0,false,1],
		[objNull,120,false,{},"lsd_heli_laati_ab",[14630.018,16566.592,26.6229],359,false,0,-1,150,500,-1,0,false,1],
		[objNull,30,false,{},"ls_heli_laatle_transportGunship",[14609.625,16625,23.509],164,false,0,-1,150,500,-1,0,false,1],
		[objNull,30,false,{},"ls_heli_laatle_transportGunship",[14618.625,16634,23.508],104,false,0,-1,150,500,-1,0,false,1],
		
		/*/Groundcraft/*/
		[objNull,60,false,{},"3as_barcsidecar",[14777.164,16804.344,0.67],180,false,0,-1,50,500,-1,0,true,0],
		[objNull,60,false,{},"3as_barcsidecar",[14782.354,16799.295,0.675],180,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"3AS_Barc",[14779.705,16801.998,0.675],180,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"3AS_Barc",[14787.566,16793.39,0.69],180,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"3AS_Barc",[14785.026,16796.045,0.685],180,false,0,-1,50,500,-1,0,true,0],
		[objNull,120,false,{},"OPTRE_M12_FAV_APC_MED",[14776.781,16784.713,0.666],90,false,0,-1,50,500,-1,0,true,0],
		[objNull,120,false,{},"OPTRE_M12R_AA",[14767.145,16793.992,0.65],90,false,0,-1,50,500,-1,0,true,0],
		[objNull,120,false,{},"OPTRE_M12A1_LRV",[14771.904,16789.412,0.650],90,false,0,-1,50,500,-1,0,true,0],
		[objNull,300,false,{},"3as_saber_m1",[14797.319,16824.602,0.65],180,false,0,-1,50,500,-1,0,true,0],
		[objNull,300,false,{},"3as_saber_m1G",[14804.34,16817.65,0.655],180,false,0,-1,50,500,-1,0,true,0],
		[objNull,300,false,{},"OPTRE_M494",[14788.640,16813.213,0.65],134,false,0,-1,50,500,-1,0,true,0],
		[objNull,300,false,{},"3as_saber_m1G",[14834.453,16771.488,0.685],0,false,0,-1,50,500,-1,0,true,0],
		[objNull,300,false,{},"3as_saber_m1",[14827.032,16778.662,0.685],345,false,0,-1,50,500,-1,0,true,0],
		[objNull,300,false,{},"3as_saber_m1Recon",[14839.862,16783.666,0.682],315,false,0,-1,50,500,-1,0,true,0],
		[objNull,180,false,{},"OPTRE_m1087_stallion_unsc_medical",[14821.158,16759.268,0.74],255,false,0,-1,50,500,-1,0,true,0],
		[objNull,180,false,{},"OPTRE_m1087_stallion_unsc_resupply",[14812.66,16767.51,0.76],255,false,0,-1,50,500,-1,0,true,0],
		[objNull,180,false,{},"OPTRE_m1087_stallion_cover_unsc",[14816.934,16763.377,0.745],255,false,0,-1,50,500,-1,0,true,0],
		[objNull,120,false,{},"OPTRE_M813_TT",[14814,16748.9,0.723],30,false,0,-1,50,500,-1,0,true,0],
		[objNull,120,false,{},"OPTRE_M12_LRV",[14809.6,16753.1,0.725],30,false,0,-1,50,500,-1,0,true,0],
		[objNull,120,false,{},"OPTRE_M12_FAV_APC",[14805,16757.4,0.725],30,false,0,-1,50,500,-1,0,true,0],
		
		/*/Boats/*/
		[objNull,30,false,{},"B_SDV_01_F",[15356.3,15763.9,1.87461],167,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"B_SDV_01_F",[15354.5,15771.6,1.87461],167,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_mg_f",[15329.411,15783.417,2.10831],257,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_mg_f",[15334.125,15763.75,2.10831],256,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_mg_f",[17775.057,18204.768,2.05084],220,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_mg_f",[17778.5,18201.875,2.05084],220,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_unarmed_f",[15330.063,15778.95,0.675],257,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_unarmed_f",[15331.077,15774.56,0.675],257,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_unarmed_f",[15334.848,15759.296,0.675],256,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_unarmed_f",[15335.94,15754.927,0.675],256,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_unarmed_f",[17781.715,18198.701,0.675],220,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_unarmed_f",[17785.15,18195.8,0.675],220,false,0,-1,50,500,-1,0,true,0],
		[objNull,30,false,{},"optre_catfish_unarmed_f",[17788.605,18192.912,0.675],220,false,0,-1,50,500,-1,0,true,0],

		
		/*/Crates/*/
		[objNull,60,false,{},"B_CargoNet_01_ammo_F",[14692.879,16649.984,19.5862],180,false,0,-1,150,500,-1,0,false,1],
		[objNull,60,false,{},"B_supplyCrate_F",[14696.74,16654.447,19.6533],270,false,0,-1,150,500,-1,0,false,1],
		[objNull,60,false,{},"Box_NATO_AmmoVeh_F",[14701.025,16650.432,19.5507],180,false,0,-1,150,500,-1,0,false,1],
		[objNull,60,false,{},"Box_NATO_AmmoVeh_F",[14697.088,16646.414,19.5507],180,false,0,-1,150,500,-1,0,false,1],
		[objNull,300,false,{},"B_Slingload_01_Ammo_F",[14728.069,16621.262,20.1219],0,false,0,-1,150,500,-1,-1,false,1],
		[objNull,300,false,{},"B_Slingload_01_Cargo_F",[14718.842,16630.230,20.1216],0,false,0,-1,150,500,-1,-1,false,1],
		[objNull,300,false,{},"B_Slingload_01_Fuel_F",[14719.736,16612.631,20.1223],0,false,0,-1,150,500,-1,-1,false,1],
		[objNull,300,false,{},"B_Slingload_01_Medevac_F",[14710.387,16621.658,20.119],0,false,0,-1,150,500,-1,-1,false,1],
		[objNull,300,false,{},"B_Slingload_01_Repair_F",[14706.606,16641.863,20.1203],90,false,0,-1,150,500,-1,-1,false,1],
		[objNull,180,false,{},"Land_Pod_Heli_Transport_04_medevac_F",[14698.17,16633.496,20.1456],270,false,0,-1,150,500,-1,0,false,1],
		[objNull,180,false,{},"Land_Pod_Heli_Transport_04_covered_F",[14689.022,16642.375,20.2376],270,false,0,-1,150,500,-1,0,false,1]
	]
};
if (_worldName isEqualTo 'Tanoa') exitWith {
	[
		[objNull,1800,false,{},"B_T_VTOL_01_infantry_olive_F",[6986.09,7231.91,0.00295281],316.646,false,0,-1,150,250,-1,8,TRUE,0],
		[objNull,900,false,{},"B_T_VTOL_01_vehicle_blue_F",[6929.84,7230.63,0.0327709],38.9913,false,0,-1,150,250,-1,8,TRUE,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[7066.74,7280.26,-0.000231743],30.3855,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_03_unarmed_F",[7130.8,7207.77,-0.134476],24.6675,false,0,-1,150,500,-1,6,false,0],
		[objNull,30,false,{},"I_Heli_Transport_02_F",[7123.42,7247.66,0.0199199],30.4196,false,0,-1,150,500,-1,6,false,0],
		[objNull,30,TRUE,{},"I_Heli_light_03_unarmed_F",[7117.48,7288.92,5.8651e-005],32.558,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_CTRG_Heli_Transport_01_tropic_F",[7075.4,7241.55,-0.000883102],34.2673,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,false,{},"B_CTRG_Heli_Transport_01_tropic_F",[7082.38,7200.88,-0.000883102],36.5012,false,0,-1,150,500,-1,4,false,0],
		[objNull,30,TRUE,{},"B_GEN_Offroad_01_gen_F",[6878.51,7382.73,0.0628552],349.209,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"I_E_Van_02_medevac_F",[6880.1,7372.95,0.176844],350.992,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_G_Offroad_01_repair_F",[6905.62,7321.74,0.0628548],352.266,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"I_C_Offroad_02_LMG_F",[6898.91,7320,0.0999765],353.765,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_G_Van_02_vehicle_F",[6888.98,7321.72,0.101022],308.255,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_covered_F",[6878.33,7330.15,0.114967],308.938,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_MBT_01_TUSK_F",[6834.67,7446.91,-0.0749998],171.196,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_APC_Wheeled_01_cannon_F",[6817.11,7422.7,0.112231],285.993,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_APC_Wheeled_01_cannon_F",[6820.73,7400.72,0.112127],284.799,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_mover_F",[7046.4,7452.16,0.114967],262.274,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[7081.05,7304.93,0.200708],348.738,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[6830.1,7395.05,0.149013],170.656,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_MRAP_03_F",[6827.25,7411.72,0.226772],169.934,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_MRAP_03_F",[6824.72,7424.78,0.226771],169.385,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6841.14,7399.97,0.0994039],351.045,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_LSV_01_armed_F",[6838.12,7416.07,0.0994039],351.045,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6835.59,7429.26,0.0994039],351.045,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"B_T_LSV_01_armed_F",[6841.72,7422.98,0.0994039],169.336,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6844.42,7407.23,0.0994039],171.375,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[6861.32,7394.52,0.0994039],287.749,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,TRUE,{},"I_C_Offroad_02_LMG_F",[6863.63,7383.39,0.0999765],288.992,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6798.55,7399.95,2.38419e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6799.59,7400.2,4.76837e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6799.34,7401.5,2.38419e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[6798.31,7401.34,0],79.0383,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[6800.51,7400.49,2.38419e-007],79.0383,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[6800.33,7401.74,2.38419e-007],348.089,false,0,-1,50,500,-1,0.1,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7045.13,7416.95,0],257.975,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7045.13,7416.95,0],257.975,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Ammo_F",[7059.27,7394.7,-4.76837e-007],323.624,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Cargo_F",[7071.69,7390.64,0],347.394,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Repair_F",[7041.43,7390.54,0],324.825,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[7050.54,7392.73,0],325.348,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_black_F",[7043.59,7378.01,-0.0750003],208.2,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_black_F",[7062.99,7380.99,-0.0750003],210.899,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_bench_black_F",[7052.97,7379.72,-0.0750003],210.899,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[7036.48,7382.93,0],263.05,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"C_T_supplyCrate_F",[7052.9,7418.59,0],259.075,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"C_T_supplyCrate_F",[7052.9,7418.59,0],259.075,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_T_APC_Tracked_01_CRV_F",[6939.45,7272.17,-0.0749998],37.8546,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[6894.77,7383.64,0.166946],259.344,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[6895.36,7380.79,0.174071],259.344,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[6893.75,7400.2,0.200709],259.344,false,0,-1,50,500,-1,2,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_ammo_F",[6766.39,7504.12,0.112837],293.452,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_box_F",[6769.41,7511.14,0.126696],296.545,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_fuel_F",[6763.11,7496.67,0.106696],292.8,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_medical_F",[6760.39,7490.35,0.15124],295.132,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_Repair_F",[6757.87,7483.75,0.123316],294.161,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Truck_01_cargo_F",[6882.53,7493.8,0.1],176.608,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_flatbed_F",[6890.86,7493.93,0.1],177.016,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE; (_this # 0);},"C_Scooter_Transport_01_F",[6631.79,6925.49,0.3],154.353,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE; (_this # 0);},"C_Scooter_Transport_01_F",[6634.67,6929.22,0.3],154.353,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[6624.27,6917.04,0],217.862,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[6617.16,6909.77,0],226.21,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Boat_Armed_01_minigun_F",[6605.38,6903.29,0],224.704,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_T_Boat_Armed_01_minigun_F",[6591.08,6902.12,0],224.704,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_SDV_01_F",[6581.72,6905.7,0],196.077,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Civil_01_police_F",[6580.56,6916.18,0],287.649,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4958.3,11315.8,0],225.186,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4226.92,11642.8,0],82.6999,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[11062.6,13376.4,0],31.5238,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[13249.2,13666.4,0],193.904,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[2216.72,8643.08,0],359.678,false,0,-2,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4529.2,5215.22,0],291.975,false,0,-2,50,500,-1,4,TRUE,0]
	]
};
if (_worldName isEqualTo 'Malden') exitWith {
	[
		[objNull,1800,false,{},"B_T_VTOL_01_infantry_olive_F",[8097.4,10500.7,0.000347137],232.913,false,0,-1,150,500,-1,8,true,0],
		[objNull,900,false,{},"B_T_VTOL_01_vehicle_blue_F",[8101.2,10448.1,0.000274658],306.993,false,0,-1,150,500,-1,8,true,0],
		[objNull,30,TRUE,{},"B_MBT_01_TUSK_F",[8223.27,10165.8,0.81424],270.102,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_covered_F",[8222.68,10173.7,-0.0965805],268.15,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_G_Van_02_vehicle_F",[8209.44,10186.3,0.08498],180.484,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_fuel_F",[8248.52,10122.5,-0.122568],0.017425,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_medical_F",[8243.58,10122.4,-0.0799007],0.0022742,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_box_F",[8253.85,10122.2,-0.121305],359.999,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_ammo_F",[8258.69,10122.5,-0.122662],0.0111568,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_cargo_F",[8288.63,10142.2,0.1],268.167,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_flatbed_F",[8288.47,10149.1,0.1],269.319,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"I_C_Offroad_02_LMG_F",[8214.12,10187.7,-0.00201035],180.187,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[8098.44,10350.6,0.0519638],267.924,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Heli_Transport_03_unarmed_F",[8037.49,10365.4,-0.175064],86.3504,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"I_Heli_Transport_02_F",[8036.67,10312.9,-0.057415],87.2739,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,TRUE,{},"B_Heli_Light_01_F",[8098.42,10316.3,0.00629807],266.558,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8064.35,10288.3,-0.00919914],91.8921,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"I_E_Van_02_medevac_F",[8204.15,10186.5,-0.0730209],180.765,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[8039.4,10265.6,0.0600834],87.4031,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[8099.26,10287.2,0.00625801],269.299,false,0,-1,150,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8064.28,10285.1,-0.00842857],85.3704,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,TRUE,{},"B_GEN_Offroad_01_gen_F",[8199.06,10187,-0.0543118],179.834,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_APC_Wheeled_01_cannon_F",[8178.6,10190.2,0.0389576],180.545,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_APC_Tracked_01_rcws_F",[8186.48,10190.5,-0.0569782],183.55,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_Repair_F",[8238.29,10122.1,-0.121326],359.999,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_LSV_01_armed_F",[8189.74,10109.7,-0.0225105],245.986,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[8167.06,10106.8,-0.003088],31.5844,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,TRUE,{},"B_LSV_01_armed_F",[8186.24,10117.3,-0.0225277],248.055,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_LSV_01_armed_F",[8183,10125.1,-0.0225582],245.347,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_MRAP_03_F",[8177.89,10095.7,-0.00323486],1.03303,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[8160.07,10107.7,-0.00309563],212.221,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8152.05,10122.3,-0.0100136],89.237,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[8151.78,10119.1,-0.0100117],89.237,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[8154.47,10111.4,-0.0032959],227.404,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_APC_Tracked_01_CRV_F",[8061.54,10243.7,-0.0749588],140.647,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8255.05,10157.7,7.62939e-006],90.2609,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8256.16,10155.5,5.72205e-006],90.3031,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8256.19,10157.7,5.72205e-006],90.3064,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[8256.13,10156.6,7.62939e-006],90.2491,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[8255.08,10155.5,-0.00138283],359.998,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[8255.19,10156.6,-0.00138283],359.999,false,0,-1,50,500,-1,0.1,FALSE,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[7983.13,10135,0.0305672],0.0108218,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[7983.13,10135,0.0305672],0.0108218,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Repair_F",[7978.25,10129.4,5.53131e-005],151.764,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[7970.74,10129.4,0.00122261],154.65,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_black_F",[7978.02,10140.6,-0.0753078],35.14,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Cargo_F",[7952.3,10133.2,4.76837e-005],359.999,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Slingload_01_Ammo_F",[7962.72,10129.1,6.10352e-005],153.106,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_bench_black_F",[7967.59,10140.7,-0.0640469],29.5116,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_black_F",[7958.76,10140.9,-0.120647],34.9285,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Truck_01_mover_F",[7959.24,10036.6,-0.108738],268.953,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7966.66,10050.1,-1.33514e-005],0.00236241,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[7966.66,10050.1,-1.33514e-005],0.00236241,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_supplyCrate_F",[7977.93,10050.1,-9.53674e-006],94.7007,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_supplyCrate_F",[7977.93,10050.1,-9.53674e-006],94.7007,false,0,-1,50,500,-1,4,FALSE,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[8565.54,10109.7,0],91.8578,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[8556.07,10115.9,0],91.8578,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"B_SDV_01_F",[8565.27,10101.6,0],128.789,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Civil_01_police_F",[8557.6,10102.1,0],178.398,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE;(_this # 0);},"C_Scooter_Transport_01_F",[8553.51,10106.7,0.3],186.618,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{(_this # 0) allowDamage FALSE;(_this # 0);},"C_Scooter_Transport_01_F",[8551.06,10108.5,0.3],185.031,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[8547.54,10108.3,0],173.447,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[8542.26,10111.8,0],173.447,false,0,-1,50,500,-1,4,TRUE,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[8496.87,3797.07,0],178.204,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[9285.57,3719.64,0],267.934,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[3667.66,3045.14,0],261.82,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[5495.98,11691.9,0],331.305,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[893.722,11858.7,0],277.775,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[927.442,11827.1,0],201.613,false,0,-2,50,500,-1,4,true,0]
	]
};
if (_worldName isEqualTo 'Enoch') exitWith {
	[
		[objNull,30,false,{},"B_T_Truck_01_ammo_F",[4309.38,10479.3,0.114975],314.231,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_box_F",[4313.35,10483.9,0.114998],314.32,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_fuel_F",[4305.47,10475.2,0.11499],315.527,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_medical_F",[4301.5,10470.8,0.114967],314.13,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_Repair_F",[4296.34,10466.3,0.114975],313.81,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_cargo_F",[4006.72,10311.7,0.1],225.155,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Truck_01_flatbed_F",[4002.09,10316.5,0.1],224.507,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MBT_01_cannon_F",[4243.87,10416.8,0.110123],135.078,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_AFV_Wheeled_01_cannon_F",[4232.78,10397,0.12059],45.7343,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_APC_Wheeled_01_cannon_F",[4237.6,10392.1,0.151443],46.7498,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[4256.27,10409.8,0.111977],133.843,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_LSV_01_armed_F",[4263.41,10403,0.120964],133.198,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[4265.4,10388.8,0.153732],44.5967,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[4268.98,10385.1,0.150978],44.6062,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_MRAP_01_F",[4272.3,10381.6,0.150993],44.6062,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4275.16,10400.8,0.217789],118.597,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4277.87,10404,0.217804],114.535,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4278.47,10409.2,0.248398],44.8188,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[4276.13,10411.7,0.248489],44.8188,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_T_Truck_01_mover_F",[4028.46,10293.2,0.119087],223.578,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[3879.68,10153.7,-6.10352e-005],11.0235,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[3885.16,10190,0.00582123],11.2232,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_01_F",[3844.55,10150.9,0.00763702],10.4954,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Heli_Transport_03_F",[3838.95,10116.4,-0.151215],11.534,false,0,-1,50,500,-1,4,false,0],
		[objNull,600,false,{},"B_T_VTOL_01_infantry_olive_F",[3753.3,10044.6,0.0175247],0,false,0,-1,50,500,-1,10,true,0],
		[objNull,1200,false,{},"B_T_VTOL_01_vehicle_blue_F",[3793.56,10083,0.000328064],0,false,0,-1,50,500,-1,10,true,0],
		[objNull,30,false,{},"B_T_Quadbike_01_F",[3871.39,10132,0.205505],141.162,false,0,-1,50,500,-1,-1,true,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[3970.81,10250.6,5.34058e-005],134.44,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Ammo_F",[3981.56,10274.6,-0.000946045],200.087,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Cargo_F",[3978.05,10287.3,0.000366211],223.844,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Repair_F",[3994.85,10262.1,0.000724792],201.281,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[3988.01,10268.5,0.000411987],201.806,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_F",[4004.1,10270.7,-0.078949],84.6543,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_F",[3990.94,10285.4,-0.0748062],87.3602,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_bench_black_F",[3997.51,10277.6,-0.0749207],87.3253,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Box_NATO_AmmoVeh_F",[4003.91,10262.2,-0.000297546],139.52,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"C_T_supplyCrate_F",[3965.15,10256.2,0.000137329],135.543,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[4317.78,10454,0],223.947,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[4318.91,10455.1,0],223.947,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[4320.01,10456.3,0],135.72,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[4320.98,10457.1,0],135.72,false,0,-1,50,500,-1,-1,false,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[734.012,7631.77,0],322.692,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[4170.48,8830.4,0],233.285,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[4174.83,8824.71,0],233.285,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[9515.68,11716,0],171.333,false,0,-1,50,500,-1,4,true,0]
	]
};
if (_worldName isEqualTo 'Stratis') exitWith {
	[
		[objNull,30,false,{},"B_Heli_Light_01_F",[1926.15,5807.46,0],317.793,false,0,-1,50,500,-1,8,false,0],
		[objNull,180,false,{},"B_Heli_Transport_03_F",[1916.08,5866.06,0],321.669,false,0,-1,50,500,-1,8,false,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[1905.9,5831.57,0],321.453,false,0,-1,50,500,-1,8,false,0],
		[objNull,30,false,{},"B_Heli_Light_01_F",[1934.29,5841.14,0],318.746,false,0,-1,50,500,-1,8,false,0],
		[objNull,30,false,{},"B_MRAP_01_F",[1928.06,5702.15,0.149358],103.861,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[1929.66,5707.71,0.149282],103.859,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_MRAP_01_F",[1931.18,5713.59,0.149284],103.859,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_LSV_01_unarmed_F",[1951.2,5734.19,0.0994258],143.298,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_LSV_01_unarmed_F",[1949.5,5728.16,0.0993924],143.298,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[1934.53,5741.89,0.200704],103.036,false,0,-1,50,500,-1,3,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[1935.29,5745.1,0.200709],103.036,false,0,-1,50,500,-1,3,true,0],
		[objNull,30,false,{},"B_Truck_01_covered_F",[1895.96,5716.81,0.115022],195.127,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_medical_F",[1963.04,5669.62,0.125649],53.0421,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_fuel_F",[1977.32,5666.56,0.132053],58.4678,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_Repair_F",[1991.58,5662.78,0.121795],51.7776,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[1974,5690.11,0.201418],195.079,false,0,-1,50,500,-1,3,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[1977.17,5689.23,0.201498],195.078,false,0,-1,50,500,-1,3,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[1931.96,5730.28,0.200722],103.036,false,0,-1,50,500,-1,3,true,0],
		[objNull,30,false,{},"B_Quadbike_01_F",[1932.72,5733.49,0.200737],103.037,false,0,-1,50,500,-1,3,true,0],
		[objNull,30,false,{},"B_GEN_Offroad_01_gen_F",[1944.27,5737.55,0.0628219],237.399,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_E_Van_02_medevac_F",[1942.83,5754.95,0.176865],193.475,false,0,-1,50,500,-1,4,true,0],
		[objNull,180,false,{},"B_APC_Wheeled_01_cannon_F",[1960.58,5741.9,0.112127],195.433,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[2197.58,5858.68,0],34.2425,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Boat_Armed_01_minigun_F",[2208.63,5856.65,0],36.158,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_SDV_01_F",[2163.71,5920.72,0],100.311,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_mover_F",[1948.77,5674.03,0.126884],51.5014,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_LSV_01_unarmed_F",[1947.95,5722.35,0.0994325],143.298,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_Truck_01_flatbed_F",[2006.51,5659.19,0.1],53.9738,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Offroad_02_LMG_F",[1941.98,5724.53,0.100029],241.022,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Civil_01_police_F",[2161.39,5915.65,0],102.06,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Scooter_Transport_01_F",[2165.28,5862.52,0.25],36.0156,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"C_Scooter_Transport_01_F",[2169.91,5860.92,0.25],36.0156,false,0,-1,50,500,-1,2,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[2152.93,5878.44,0],71.4877,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[2151.06,5870.83,0],73.6976,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_LT_01_cannon_F",[1974.08,5715.77,0.101769],194.966,false,0,-1,50,500,-1,4,true,0],
		//[objNull,300,false,{},selectRandom ["I_LT_01_cannon_F","I_APC_tracked_03_cannon_F"],[1991.21,5729.63,0.104992],196.271,false,0,-1,50,500,-1,4,true,0],
		//[objNull,180,false,{},"I_LT_01_cannon_F",[1990.84,5730.44,0.101769],197.505,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[1961.68,5322.96,0],191.604,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"I_C_Boat_Transport_02_F",[1952.62,5325.07,0],193.814,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"B_G_Van_01_transport_F",[1945.55,5744.89,0.136583],232.547,false,0,-1,50,500,-1,4,true,0],
		[objNull,(600 + (random 600)),false,{},"I_Heli_light_03_dynamicLoadout_F",[1911.51,5899.7,0],243.371,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_G_Offroad_01_repair_F",[1942.31,5730.49,0.0629215],236.484,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_covered_F",[1758.18,5712.55,-0.0749998],12.8788,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_medevac_F",[1781.18,5705.77,-0.0749998],15.4318,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"Land_Pod_Heli_Transport_04_bench_black_F",[1770.52,5708.98,-0.0749998],12.8788,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_APC_Tracked_01_CRV_F",[1761.59,5677.31,0.105],105.732,false,0,-1,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[6528.03,4902.16,0],149.883,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[6535.34,4906.85,0],149.883,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4279.28,2629.37,0],176.406,false,0,-2,50,500,-1,4,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[4290.08,2631.03,0],173.124,false,0,-2,50,500,-1,4,true,0],
		//[objNull,30,false,{},"B_supplyCrate_F",[1902.86,5729.36,5.72205e-005],104.439,false,0,-1,50,500,-1,1,true,0],
		//[objNull,30,false,{},"B_supplyCrate_F",[1907.96,5749.19,0],104.438,false,0,-1,50,500,-1,1,true,0],
		//[objNull,30,false,{},"B_supplyCrate_F",[1918.76,5725.76,9.53674e-007],14.1069,false,0,-1,50,500,-1,1,true,0],
		//[objNull,30,false,{},"B_supplyCrate_F",[1930.01,5724.11,2.28882e-005],104.438,false,0,-1,50,500,-1,1,true,0],
		//[objNull,30,false,{},"B_supplyCrate_F",[2018.26,5686.39,0],195.716,false,0,-1,50,500,-1,1,true,0],
		//[objNull,30,false,{},"B_supplyCrate_F",[1941.32,5822.22,0],104.438,false,0,-1,50,500,-1,1,true,0],
		[objNull,30,false,{},"B_Slingload_01_Fuel_F",[1763.99,5735.35,0],196.439,false,0,-1,50,500,-1,4,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[1776.13,5730.92,0],0,false,0,-1,50,500,-1,3,false,0],
		[objNull,30,false,{},"B_CargoNet_01_ammo_F",[1782.99,5728.93,0],0,false,0,-1,50,500,-1,3,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[2024.79,5685.68,7.15256e-006],105.431,false,0,-1,50,500,-1,0.5,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[2024.33,5683.69,8.10623e-006],105.43,false,0,-1,50,500,-1,0.5,false,0],
		[objNull,30,false,{},"Box_NATO_Ammo_F",[2023.83,5681.76,-1.90735e-006],105.431,false,0,-1,50,500,-1,0.5,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[2027.54,5685.04,1.90735e-006],201.166,false,0,-1,50,500,-1,0.5,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[2029.09,5684.59,4.76837e-006],195.18,false,0,-1,50,500,-1,0.5,false,0],
		[objNull,30,false,{},"Box_B_UAV_06_medical_F",[2030.63,5684.18,5.24521e-006],192.828,false,0,-1,50,500,-1,0.5,false,0],
		[objNull,300,false,{},"B_G_Offroad_01_F",[4082.29,4599.88,0.0937653],146.65,false,0,-1,50,300,-1,2.5,true,0],
		[objNull,300,false,{},"B_G_Offroad_01_F",[4079.84,4594.39,0.112122],142.072,false,0,-1,50,300,-1,2.5,true,0],
		[objNull,120,false,{},"B_Quadbike_01_F",[4095.49,4586.11,0.222168],273.644,false,0,-1,50,250,-1,2,true,0],
		[objNull,120,false,{},"B_Quadbike_01_F",[4095.41,4583.01,0.231598],272.664,false,0,-1,50,250,-1,2,true,0],
		[objNull,300,false,{},"I_C_Offroad_02_LMG_F",[4084.32,4605.25,0.092041],147.511,false,0,-1,50,300,-1,2.5,true,0],
		[objNull,30,false,{},"O_SDV_01_F",[4165.86,7312.12,0],281.644,false,0,-1,50,500,-2,2,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[2755.24,6083,0],223.254,false,0,-2,50,500,-1,3,true,0],
		[objNull,30,false,{},"C_Boat_Transport_02_F",[1932.48,2696.94,0],230.061,false,0,-2,50,500,-1,3,true,0],
		[objNull,30,false,{},"C_Scooter_Transport_01_F",[2685.18,501.192,0.25],256.393,false,0,-2,50,500,-1,1,true,0],
		[objNull,30,false,{},"C_Scooter_Transport_01_F",[2686.05,504.326,0.25],289.205,false,0,-2,50,500,-1,1,true,0]
	]
};
[]