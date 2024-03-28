/*/
File: roles.sqf
Author:

	Quiksilver
	
Last Modified:

	26/04/2019 A3 1.90 by Quiksilver
	
Description:

	Roles
_______________________________________________________/*/
_tropical = worldName in ['Tanoa'];

QS_roles_data = [
	[
		[
			'o_autorifleman',
			EAST,
			2,
			2,
			-1,
			0,	
			0,
			0,
			{((missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]) && (((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 2) || {(((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 1) && ((getPlayerUID player) in (['OPFOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))))}))},
			{((player getVariable ['QS_unit_side',WEST]) isEqualTo EAST) || ((missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]) && (((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 2) || {(((missionNamespace getVariable ['QS_missionConfig_playableOPFOR',0]) isEqualTo 1) && ((getPlayerUID player) in (['OPFOR'] call (missionNamespace getVariable 'QS_fnc_whitelist'))))}))},
			{}
		]
	],
	[
		[
			'rifleman',
			WEST,
			(playableSlotsNumber WEST),
			(playableSlotsNumber WEST),
			-1,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'autorifleman',
			WEST,
			4,
			10,
			8,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'machine_gunner',
			WEST,
			2,
			2,
			10,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'rifleman_lat',
			WEST,
			2,
			8,
			8,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'rifleman_hat',
			WEST,
			2,
			4,
			10,
			0,	
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'medic',
			WEST,
			5,
			10,
			8,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'engineer',
			WEST,
			2,
			10,
			8,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'crewman',
			WEST,
			3,
			6,
			12,
			0,
			0,
			0,
			{FALSE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		/*/
		[
			'mortar_gunner',
			WEST,
			1,
			1,
			-1,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'sniper',
			WEST,
			1,
			2,
			10,
			1,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'jtac',
			WEST,
			1,
			1,
			-1,
			0,
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'uav',
			WEST,
			1,		// Do not change this, only 1 UAV Operator slot configured
			1,		// Do not change this, only 1 UAV Operator slot configured
			-1,		// Do not change this, only 1 UAV Operator slot configured
			0,		// Do not change this, only 1 UAV Operator slot configured
			0,
			0,
			{TRUE},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		],
		[
			'pilot_heli',
			WEST,
			2,
			5,
			8,
			2,
			0,
			0,
			{TRUE},
			{((((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE])) && (!((missionNamespace getVariable ['QS_missionConfig_CAS',2]) isEqualTo 0)))},
			{}
		],
		[
			'pilot_plane',
			WEST,
			1,		// Do not change this, only 1 CAS pilot slot configured
			1,		// Do not change this, only 1 CAS pilot slot configured
			-1,		// Do not change this, only 1 CAS pilot slot configured
			0,		// Do not change this, only 1 CAS pilot slot configured
			0,
			0,
			{TRUE},
			{((((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE])) && (!((missionNamespace getVariable ['QS_missionConfig_CAS',2]) isEqualTo 0)))},
			{}
		],
		[
			'commander',
			WEST,
			1,		// Do not change this, only 1 Commander slot configured
			1,		// Do not change this, only 1 Commander slot configured
			-1,		// Do not change this, only 1 Commander slot configured
			0,		// Do not change this, only 1 Commander slot configured
			0,
			0,
			{(!((missionNamespace getVariable ['QS_missionConfig_Commander',0]) isEqualTo 0))},
			{(((player getVariable ['QS_unit_side',WEST]) isEqualTo WEST) || (missionNamespace getVariable ['QS_RSS_client_canSideSwitch',FALSE]))},
			{}
		]
	],
	[],
	[]
];
QS_roles_UI_info = [
	['rifleman','Rifleman','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['autorifleman','Autorifleman','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['machine_gunner','Machine Gunner','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa'],
	['rifleman_lat','Rifleman (LAT)','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconManAT_ca.paa'],
	['rifleman_hat','Rifleman (HAT)','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconManAT_ca.paa'],
	['engineer','Engineer','a3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa','a3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa'],
	['medic','Medic','a3\ui_f\data\igui\cfg\actions\heal_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa'],
	['sniper','Sniper','a3\Ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa','a3\ui_f\data\map\vehicleicons\iconManRecon_ca.paa'],
	['crewman','Crewman','a3\Ui_f\data\GUI\Cfg\RespawnRoles\support_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['jtac','JTAC','a3\Ui_f\data\GUI\Cfg\RespawnRoles\recon_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['mortar_gunner','Mortar Gunner','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconManExplosive_ca.paa'],
	['uav','UAV Operator','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['pilot_heli','Transport Pilot','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['pilot_plane','Fighter Pilot','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['commander','Commander','a3\ui_f\data\gui\cfg\ranks\general_gs.paa','a3\ui_f\data\map\vehicleicons\iconManCommander_ca.paa'],
	['o_rifleman','Rifleman','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconMan_ca.paa'],
	['o_autorifleman','Autorifleman','a3\Ui_f\data\GUI\Cfg\RespawnRoles\assault_ca.paa','a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa']
];
QS_roles_defaultLoadouts = [
	['',([[['arifle_MX_F','','','optic_Hamr',['30Rnd_65x39_caseless_mag_Tracer',30],[],''],[],['hgun_P07_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_B_CombatUniform_mcam',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_rgr',[['30Rnd_65x39_caseless_mag_Tracer',10,30],['SmokeShell',2,1],['HandGrenade',2,1]]],['B_AssaultPack_mcamo',[]],'H_HelmetB_light','G_Combat',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles']],		[['arifle_MX_khk_F','','','optic_Hamr_khk_F',['30rnd_65x39_caseless_khaki_mag_tracer',30],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_B_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',3,16]]],['V_PlateCarrier1_tna_F',[['SmokeShell',2,1],['HandGrenade',2,1],['30rnd_65x39_caseless_khaki_mag_tracer',10,30]]],['B_AssaultPack_tna_F',[]],'H_HelmetB_Light_tna_F','G_Combat_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_tna_F']]] select _tropical)],
	['rifleman',([[['JLTS_DC15A_plastic','','','',['JLTS_DC15A_mag',60],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_501',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15A_mag',5,60],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['SDT_Invis_backpack',[['FirstAidKit',10],['JLTS_DC15A_mag',5,60]]],'JLTS_CloneHelmetP2_501','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15A_plastic','','','',['JLTS_DC15A_mag',60],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_501',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15A_mag',5,60],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['SDT_Invis_backpack',[['FirstAidKit',10],['JLTS_DC15A_mag',5,60]]],'JLTS_CloneHelmetP2_501','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['autorifleman',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_501',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['SDT_Invis_backpack',[['FirstAidKit',10],['JLTS_DC15S_mag',5,80]]],'JLTS_CloneHelmetP2_501','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_501',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['SDT_Invis_backpack',[['FirstAidKit',10],['JLTS_DC15S_mag',5,80]]],'JLTS_CloneHelmetP2_501','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['machine_gunner',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],['SWLW_Z7','','','',['SWLW_Z7_mag',500],[],''],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['lsd_gar_phase2Insulated_uniform',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['lsd_gar_marine_vest',[]],['lsd_gar_marine_backpack',[['FirstAidKit',10],['SWLW_Z7_mag',3,500]]],'ls_gar_galacticMarine_helmet','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],['SWLW_Z7','','','',['SWLW_Z7_mag',500],[],''],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['lsd_gar_phase2Insulated_uniform',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['lsd_gar_marine_vest',[]],['lsd_gar_marine_backpack',[['FirstAidKit',10],['SWLW_Z7_mag',3,500]]],'ls_gar_galacticMarine_helmet','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['rifleman_lat',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],['JLTS_RPS6','','','',['JLTS_RPS6_mag',1],[],''],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO',[]],['JLTS_Clone_backpack_eod',[['MineDetector',1],['FirstAidKit',10],['JLTS_RPS6_mag',2,1]]],'SWLB_clone_P2_helmet','SDT_bacara_plating',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],['JLTS_RPS6','','','',['JLTS_RPS6_mag',1],[],''],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO',[]],['JLTS_Clone_backpack_eod',[['MineDetector',1],['FirstAidKit',10],['JLTS_RPS6_mag',2,1]]],'SWLB_clone_P2_helmet','SDT_bacara_plating',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['rifleman_hat',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],['JLTS_PLX1_AT','','','',['JLTS_PLX1_AT_mag',1],[],''],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO',[]],['JLTS_Clone_backpack_eod',[['MineDetector',1],['FirstAidKit',10],['JLTS_PLX1_AT_mag',1,1],['JLTS_PLX1_AP_mag',1,1]]],'SWLB_clone_P2_helmet','SDT_bacara_plating',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],['JLTS_PLX1_AT','','','',['JLTS_PLX1_AT_mag',1],[],''],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO',[]],['JLTS_Clone_backpack_eod',[['MineDetector',1],['FirstAidKit',10],['JLTS_PLX1_AT_mag',1,1],['JLTS_PLX1_AP_mag',1,1]]],'SWLB_clone_P2_helmet','SDT_bacara_plating',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['engineer',([[['JLTS_DP23','','','',['JLTS_DP23_mag',20],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DP23_mag',5,20],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestSuspender',[]],['JLTS_Clone_ARC_backpack',[['ToolKit',1],['MineDetector',1],['ACE_Clacker',1],['FirstAidKit',10],['DemoCharge_Remote_Mag',3]]],'GD_Helmet_Engineer_Base','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DP23','','','',['JLTS_DP23_mag',20],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DP23_mag',5,20],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestSuspender',[]],['JLTS_Clone_ARC_backpack',[['ToolKit',1],['MineDetector',1],['ACE_Clacker',1],['FirstAidKit',10],['DemoCharge_Remote_Mag',3]]],'GD_Helmet_Engineer_Base','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['medic',([[['3AS_DC15C_F','','','3AS_optic_acog_DC15C',['3AS_40Rnd_EC40_Mag',40],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_501_medic',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['FirstAidKit',5],['3AS_40Rnd_EC40_Mag',5,40],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborne_501',[]],['JLTS_Clone_backpack_medic',[['MineDetector',1],['Medikit',1],['FirstAidKit',20],[]]],'JLTS_CloneHelmetP2_501','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],		['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],[['3AS_DC15C_F','','','3AS_optic_acog_DC15C',['3AS_40Rnd_EC40_Mag',40],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_501_medic',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['FirstAidKit',5],['3AS_40Rnd_EC40_Mag',5,40],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborne_501',[]],['JLTS_Clone_backpack_medic',[['MineDetector',1],['Medikit',1],['FirstAidKit',20],[]]],'JLTS_CloneHelmetP2_501','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['sniper',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO_501',[]],['SDT_Invis_backpack',[['MineDetector',1],['FirstAidKit',10]]],'JLTS_CloneHelmetAB_501','JLTS_Clone_helmetInterior_AB',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO_501',[]],['SDT_Invis_backpack',[['MineDetector',1],['FirstAidKit',10]]],'JLTS_CloneHelmetAB_501','JLTS_Clone_helmetInterior_AB',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['crewman',([[['SMG_03C_khaki','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_P07_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_B_CombatUniform_mcam',[['16Rnd_9x21_Mag',2,16],['50Rnd_570x28_SMG_03',2,50]]],[],[],'H_HelmetCrew_B','G_Combat',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles']],		[['SMG_03C_black','','','',['50Rnd_570x28_SMG_03',50],[],''],[],['hgun_P07_khk_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_B_T_Soldier_F',[['50Rnd_570x28_SMG_03',2,50],['16Rnd_9x21_Mag',1,16]]],[],[],'H_HelmetCrew_B','G_Combat_Goggles_tna_F',['Binocular','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_tna_F']]] select _tropical)],
	['jtac',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestReconOfficer',[]],['JLTS_Clone_backpack_RTO',[['MineDetector',1],['JLTS_DC15S_mag',5,80],['FirstAidKit',10]]],'SEA_Helmet_SpecOps_LR_Base','SWLB_clone_P1_HUD',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestReconOfficer',[]],['JLTS_Clone_backpack_RTO',[['MineDetector',1],['JLTS_DC15S_mag',5,80],['FirstAidKit',10]]],'Clone_RTO_Helmet','SWLB_clone_P1_HUD',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['mortar_gunner',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['FirstAidKit',5],['ACE_Flashlight_XL50',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO',[['FirstAidKit',5],['ACE_EntrenchingTool',1],['MineDetector',1]]],['ls_gar_mortar_backpack',[]],'SWLB_clone_P2_helmet','SDT_bacara_plating',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor',[['FirstAidKit',5],['ACE_Flashlight_XL50',1],['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestAirborneNCO',[['FirstAidKit',5],['ACE_EntrenchingTool',1],['MineDetector',1]]],['ls_gar_mortar_backpack',[]],'SWLB_clone_P2_helmet','SDT_bacara_plating',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['uav',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_Lieutenant',[['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestARC',[['FirstAidKit',10],['MineDetector',1],['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1]]],['JLTS_UAV_prowler_gar_backpack',[]],'JLTS_CloneHelmetP2_Lieutenant','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','JLTS_CloneNVGRange']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_Lieutenant',[['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestARC',[['FirstAidKit',10],['MineDetector',1],['ACE_Flashlight_XL50',1],['ACE_EntrenchingTool',1]]],['JLTS_UAV_prowler_gar_backpack',[]],'JLTS_CloneHelmetP2_Lieutenant','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','JLTS_CloneNVGRange']]]select _tropical)],
	['pilot_heli',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_Commander',[['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['JLTS_Clone_RTO_pack',[]],'SWLB_P1_Pilot_Helmet_Republic','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_Commander',[['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['JLTS_Clone_RTO_pack',[]],'SWLB_P1_Pilot_Helmet_Republic','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['pilot_plane',([[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_Commander',[['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['JLTS_Clone_RTO_pack',[]],'3AS_P2_Pilot_helmet_Republic','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']],		[['JLTS_DC15S','','','',['JLTS_DC15S_mag',80],[],''],[],['JLTS_DC17SA','','','',['JLTS_DC17SA_mag',20],[],''],['JLTS_CloneArmor_Commander',[['JLTS_DC15S_mag',5,80],['JLTS_DC17SA_mag',5,20],['ls_mag_classB_thermalDet',3,1],['ACE_M84',3,1],['SmokeShell',3,1]]],['JLTS_CloneVestHolster',[]],['JLTS_Clone_RTO_pack',[]],'3AS_P2_Pilot_helmet_Republic','JLTS_Clone_helmetInterior_P2',['JLTS_CloneBinocular','','','',['Laserbatteries',1],[],''],['ItemMap','ItemGPS','JLTS_clone_comlink','ItemCompass','ItemWatch','']]]select _tropical)],
	['commander',([[[],[],['hgun_Pistol_heavy_02_F','','','optic_Yorris',['6Rnd_45ACP_Cylinder',6],[],''],['U_B_CombatUniform_mcam',[['FirstAidKit',1],['6Rnd_45ACP_Cylinder',4,6]]],[],[],'H_MilCap_mcamo','G_Aviator',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles']],		[[],[],['hgun_Pistol_heavy_02_F','','','optic_Yorris',['6Rnd_45ACP_Cylinder',6],[],''],['U_B_T_Soldier_F',[['FirstAidKit',1],['6Rnd_45ACP_Cylinder',4,6]]],[],[],'H_MilCap_tna_F','G_Aviator',['Rangefinder','','','',[],[],''],['ItemMap','ItemGPS','ItemRadio','ItemCompass','ItemWatch','NVGoggles_tna_F']]] select _tropical)],
	['o_rifleman',([[['arifle_Katiba_F','','','',['30Rnd_65x39_caseless_green_mag_Tracer',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_HarnessO_brn',[['30Rnd_65x39_caseless_green_mag_Tracer',11,30],['MiniGrenade',5,1],['SmokeShell',2,1]]],[],'H_HelmetSpecO_blk','G_Bandanna_blk',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['arifle_AKM_F','','','',['30Rnd_762x39_Mag_Tracer_Green_F',30],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_HarnessO_ghex_F',[['MiniGrenade',5,1],['SmokeShell',2,1],['30Rnd_762x39_Mag_Tracer_Green_F',12,30]]],[],'H_HelmetSpecO_blk','G_Bandanna_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']]] select _tropical)],
	['o_autorifleman',([[['LMG_Mk200_F','','','',['200Rnd_65x39_cased_Box_Tracer',200],[],'bipod_02_F_blk'],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_CombatUniform_ocamo',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_HarnessO_brn',[['MiniGrenade',5,1],['SmokeShell',2,1],['200Rnd_65x39_cased_Box_Tracer',2,200]]],['B_FieldPack_ocamo',[['200Rnd_65x39_cased_Box_Tracer',4,200]]],'H_HelmetSpecO_blk','G_Bandanna_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']],		[['LMG_03_F','','','',['200Rnd_556x45_Box_Tracer_F',200],[],''],[],['hgun_Rook40_F','','','',['16Rnd_9x21_Mag',16],[],''],['U_O_T_Soldier_F',[['FirstAidKit',2],['16Rnd_9x21_Mag',2,16]]],['V_HarnessO_ghex_F',[['MiniGrenade',5,1],['SmokeShell',2,1],['200Rnd_556x45_Box_Tracer_F',3,200]]],['B_FieldPack_ghex_F',[['200Rnd_556x45_Box_Tracer_F',5,200]]],'H_HelmetSpecO_blk','G_Bandanna_oli',[],['ItemMap','','ItemRadio','ItemCompass','ItemWatch','NVGoggles_OPFOR']]] select _tropical)]
];
QS_fnc_roleDescription = {
	params ['_role'];
	_tropical = worldName in ['Tanoa'];
	private _description = 'Undefined';
	if (_role isEqualTo 'rifleman') then {
		_description = format ['As a Rifleman, you are a front line soldier, and the backbone of the military.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'autorifleman') then {
		_description = format ['An Automatic Riflemans job is to provide cover fire for their squad during engagements and while their squad is moving.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'machine_gunner') then {
		_description = format ['A Machine Gunners job is to provide suppressive fire at long ranges. Unlike their lighter Autorifleman cousins, Machine Gunners may operate as part of a smaller detachment of the squad, and move at a slower pace.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'rifleman_lat') then {
		_description = format ['As a Rifleman (Light Anti-Tank), your role is to provide unguided fire support against infantry, fortifications, unarmored and light-armored vehicles.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'rifleman_hat') then {
		_description = format ['As a Rifleman (Heavy Anti-Tank), your role is to provide guided fire support against armored vehicles and aircraft.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'engineer') then {
		_description = format ['An Engineer is a combat soldier with a range of tactical and technical skills.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'medic') then {
		_description = format ['A Medic is responsible for providing First Aid and Medical services to friendly soldiers and non-combatants.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'sniper') then {
		_description = format ['Marksman DLC Required.<br/><br/>A Snipers main task is reconaissance. When the mission calls for it, snipers can also dismantle and dishearten the enemy with a few well-placed rifle shots. When there is no specific objective, a sniper will look for targets of opportunity.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'crewman') then {
		_description = format ['Tanks DLC Required.<br/><br/>A Crewman is able to operate the Driver and Gunner positions of armored vehicles (Tanks, IFVs and APCs).<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'jtac') then {
		_description = format ['Working from a forward position, a Joint Terminal Attack Controller (JTAC) directs the action of combat aircraft engaged in close air support and other offensive air operations. This soldier will work closely with Pilots, UAV Operators and Squad Leaders.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'mortar_gunner') then {
		_description = format ['Mortar Gunners provide indirect fire support to squads. These soldiers can also deactivate mines, explosives and IEDs.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'uav') then {
		_description = format ['A UAV Operator controls autonomous vehicles for logistics, intel-gathering, support and combat tasks.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'pilot_heli') then {
		_description = format ['Transport Pilots provide infantry and cargo transport to and from missions and FOBs respectively.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'pilot_plane') then {
		_description = format ['Jets DLC Required.<br/><br/>A Fighter Pilot is responsible for providing Close Air Support to ground elements when requested, and flying Combat Air Patrols to protect transport pilots from enemy aircraft.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'commander') then {
		_description = format ['Organize and deploy available resources (including players) to defeat the enemy. <br/><br/>Soldiers are required under military law to obey your orders.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select _tropical),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'o_rifleman') then {
		_description = format ['As a Rifleman, you are a front line soldier, and the backbone of the military.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	if (_role isEqualTo 'o_autorifleman') then {
		_description = format ['An Automatic Riflemans job is to provide cover fire for their squad during engagements and while their squad is moving.<br/><br/><img shadow="0" align="center" size="18" image="media\images\roles\%1\%2.jpg"/>',(['arid','tropic'] select (worldName in ['Tanoa'])),(uiNamespace getVariable ['QS_RSS_currentSelectedRole','rifleman'])];
	};
	(parseText _description);
};