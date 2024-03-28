/*
File: arsenal.sqf
Author:

	Quiksilver

Last Modified:

	15/10/2020 A3 2.00 by Quiksilver

Description:

	Arsenal Whitelisting & Blacklisting for each player role/class

Format of this script:

	1. Sort player into Roles from classname
	2. Sort game assets (weapons/backpacks/magazines/items) into basic categories (you can add/modify/etc).
	3. Configure a blacklist and a whitelist for each Role, using the categories created in #2, using the provided format.

Documentation File:

	"documentation\Arsenal & Gear Restrictions.txt"

Notes:

	- It could take several hours to configure this script to your liking.
	- Hard-coded gear blacklists are inside "code\functions\fn_clientArsenal.sqf", but that file requires mission update to edit while this file only requires server restart to take effect.
	- You do not need to update the mission file to edit this script, it can be done between restarts.

To Do:
	1. Fix Launcher Ammo
	2. add weapons attachments
_______________________________________________________*/

//=========================================== GET PLAYER ROLE

params [
	['_side',WEST],
	['_role','rifleman']
];

//=========================================== At this point you could build up lists of weapons like "normalguns + marksmanguns + sniperguns + LMGguns + HMGguns" and use those variables instead of the default copy-paste used below.
// These variables are just suggestions, you would add them together like this:   (_weaponsBasic + _weaponsMarksman + _weaponsHandgun)


// All weapons including pistols, launchers, binoculars (yes they are classified as a weapon).
_weaponsAll =
[
	'SWLW_DC15SA','SWLW_DC17','ls_weapon_dualDC17_secondary','SWLW_RG4D','SWLW_Westar35SA','ls_weapon_westar35sa_secondary','JLTS_DC17SA','JLTS_RG4D','Poly_CA13','717th_DC15SA','Poly_DC17','Dual_Poly_DC17','SDT_A180','SDT_DC17MP','SDT_DC17ST','SDT_Defender','SDT_GC36Pistol',
	'3AS_pistol_DC15SA_F','3AS_DC17S_F','3AS_DC17STest_F','3AS_S5_f','SWLW_ACPR','SWLW_DC15s','SWLW_E5','JLTS_DC15S','JLTS_E5','Poly_DC15S','Poly_E1','SDT_DC19E','SDT_DC5K','SDT_Water_E5','SDT_EE3','SDT_EE3ESB', 'SDT_GC36P','3AS_DC15S_F','3AS_E5_F','SWLW_DC15SAW',
	'SWLW_DC15SAW_wooden','SWLW_LS150','ls_weapon_ls150_primary','SWLW_Z6','SWLW_Z7','JLTS_Z6','Poly_DC15LE','Poly_Z6','SDT_GC36Z','SDT_Z6_Base','3AS_DC15L_F','3AS_Chaingun','SWLW_DC15AC','SWLW_DC17M','SWLW_E4C','SWLW_westar35c','ls_weapon_westar_35c_primary',
	'SWLW_westar35S','ls_weapon_westar_35s_primary','SWLW_Westar_M5_ugl','SWLW_Westar_M5','SWLW_7H73','JLTS_E5C','JLTS_E5C_stock','Poly_A280','717th_DC17M','SDT_GC36','SDT_GC36_wooden','SDT_GC36UGL','3AS_Flamer_Base','3AS_DC15C_F','3AS_DC15C_GL','3AS_DC17M_F','E5C_F',
	'3AS_WestarM5_GL','3AS_WestarM5_F','ls_weapon_dc15a_wooden','ls_weapon_dc15a','SWLW_DC15A_ugl_wooden','SWLW_DC15A','SWLW_DC15A_wooden','SWLW_DC15A_ugl','ls_weapon_dc15a_ugl','JLTS_DC15A_plastic','JLTS_DC15A','JLTS_DC15A_ugl_plastic','JLTS_DC15A_ugl','JLTS_DW32S',
	'Poly_DC15A','Poly_DC15A_UGL','Poly_EE3','Valken38X_F','773_Firepuncher','SDT_DC19A','SDT_Martini_Henry','SDT_Valken38x','3AS_DC15A_GL','3AS_DC15A_F','3AS_Valken38X_F','SWLW_DC15BR','SWLW_DC15X','SWLW_DC15X_wooden','SWLW_sniper','JLTS_DC15X','JLTS_E5S','Poly_DC15X',
	'Poly_IQA','SDT_DC19X_Wood','SDT_DC19X_Red_Wood','SDT_DC19X','SDT_GC36M','SDT_GC36M_wooden','3AS_E3S_F','SWLW_ACPA','SWLW_DP20','JLTS_DP23','JLTS_SBB3','SWLW_E60R_AA','SWLW_GL','SWLW_PLX1_AA','ls_weapom_aa_plx1','JLTS_EPL2','JLTS_RPS6','Poly_PLX2','RPS5_HE_Loaded',
	'SDT_IonDisruptor','SDT_Valken35TB','3AS_E60R_F','SWLW_E60R','ls_weapon_rps6_disposable','ls_weapon_rps6','SWLW_PLX1','ls_weapon_at_plx1','JLTS_E60R_AT','RPS5_Loaded','RPS6','Poly_HH16','Poly_PLX1','SDT_RPS6','3AS_PLX1_F','3AS_RPS6_G','3AS_RPS6_F','3AS_RPS6_HP'
];

//All magazines
_magazinesAll =
[
	'SWLW_DC15SA_Mag','SWLW_DC17_Mag','ls_mag_dc17dual_20rnd','SWLW_RG4D_Mag','SWLW_westar35Sa_Mag','JLTS_DC17SA_mag','JLTS_RG4D_mag','Poly_DualMag','SDT_A180_Mag','SDT_DC17MP_Mag','SDT_DC17ST_Mag','SDT_Defender_Mag','SDT_GC36Pistol_mag','3AS_15Rnd_EC30_mag',
	'3AS_16Rnd_EC20_Mag','3AS_10Rnd_Test_mag','SWLW_acpr_Mag','SWLW_DC15AC_Mag','SWLW_DC15s_Mag','SWLW_E5_Mag','JLTS_E5_mag','JLTS_DC15S_mag','JLTS_stun_mag_long','JLTS_stun_mag_short','Poly_DC15A_magLP','SDT_DC19E_mag','SDT_DC19E_water_mag','SDT_DC5K_mag',
	'SDT_Water_E5_Mag','SDT_EE3_mag','SDT_EE3ESB_mag','SDT_GC_36P_mag','3AS_60Rnd_EC30_mag','3AS_60Rnd_EM50_RedPlasma','SWLW_DC15SAW_Mag','SWLW_E5C_mag','SWLW_LS150_mag','SWLW_Z6_mag','SWLW_Z7_mag','JLTS_Z6_mag','JLTS_E5C_mag','Poly_DC15A_mag','Poly_DC15A_magHP',
	'Poly_DC15LE_mag','SDT_GC36_LSW_mag','SDT_Z6_mag','3AS_200Rnd_EC40_Mag','3AS_Chaingun_Drum_Mag','3AS_130Rnd_EM50_RedPlasma','SWLW_DC17M_Blaster_Mag','SWLW_westar35c_Mag','SWLW_Westar35S_Mag','SWLW_Westar35S_scatter_Mag','SWLW_WestarM5_Mag','SWLW_WestarM5_standard_Mag',
	'SWLW_WestarM5_g_Mag','SWLW_ZH73_Mag','Poly_60Rnd_EC40','Poly_EMP_UGL','Poly_A280_mag','SDT_GC_36_mag','3AS_FlamerFuel','3AS_100Rnd_EC40_mag','3AS_40Rnd_EC40_Mag','3AS_60Rnd_EC50_Mag','SWLW_DC15A_Mag','SWLW_DC15A_UGL_flare_red_Mag','SWLW_DC15A_UGL_flare_gree_Mag',
	'SWLW_DC15A_UGL_flare_white_Mag','SWLW_DC15A_UGL_Mag','SWLW_DC15A_UGL_smoke_blue_Mag','SWLW_DC15A_UGL_smoke_green_Mag','SWLW_DC15A_UGL_smoke_red_Mag','SWLW_DC15A_UGL_smoke_purple_Mag','SWLW_DC15A_UGL_smoke_white_Mag','SWLW_DC15BR_Mag','JLTS_DC15A_mag','JLTS_DW32S_mag',
	'JLTS_stun_mag_long','JLTS_stun_mag_short','Poly_DC15A_mag','Poly_DC15A_magHP','Poly_773_Magazine','Poly_EMP_UGL','SDT_DC19A_mag','SDT_DC19A_water_mag','SDT_Martini_mag','SDT_Valken_mag','3AS_10Rnd_EC80_Mag','3AS_45Rnd_EC50_Mag','SWLW_DC15X_Mag','SWLW_DC17M_Sniper_Mag',
	'SWLW_sniper_Mag','JLTS_DC15X_mag','JLTS_E5S_mag','Poly_5Rnd_EC80','Poly_DC15X_Magazine','Poly_IQA_Magazine','Poly_Valken38X_Magazine','SDT_DC19X_Mag','SDT_GC36_HEE_mag','SDT_GC36_HE_mag','3AS_5Rnd_EC80_mag','3AS_10Rnd_EM90_Mag','SWLW_acpa_Mag','SWLW_DP20_Mag',
	'JLTS_DP23_mag','JLTS_SBB3_mag','SWLW_DC17M_AT_Mag','SWLW_mag_40mm_1rnd','SWLW_mag_40mm_6rnd','SWLW_mag_40mm_10rnd','SWLW_e60r_ap_mag','SWLW_e60r_at_mag','SWLW_e60r_aa_mag','ls_mag_rpg_1rnd','JLTS_EPL2_mag','JLTS_RPS6_mag','Poly_AntiArmour_mag','SDT_IonDisruptor_mag',
	'SDT_ValkenTB_Mag','3AS_AntiArmour_mag','3AS_E60R_AT','SWLW_plx1_ap_mag','SWLW_plx1_at_mag','SWLW_plx1_aa_mag','ls_mag_ap_plx','ls_mag_at_plx','ls_mag_aa_plx','JLTS_PLX1_AP_mag','JLTS_PLX1_AT_mag','JLTS_E60R_AP_mag','JLTS_E60R_AT_mag','SDT_rps6_mag','3AS_JLTS_MK39_AA',
	'3AS_JLTS_MK43_AT','3AS_JLTS_MK44_HE','3AS_MK41_AT','3AS_MK42_HE'
];

//=================
//EXAMPLE CATEGORY:
//=================

	// List Template
	_exampleSubCategory =
	[
		'',''
	];

//========
//WEAPONS:
//========

	// Blaster Pistols
	_blasterPistols =
	[
		// Legion Base - Stable
		'SWLW_DC15SA','SWLW_DC17','ls_weapon_dualDC17_secondary','SWLW_RG4D','SWLW_Westar35SA','ls_weapon_westar35sa_secondary',
		
		// Just Like The Simulations - The Great War
		'JLTS_DC17SA','JLTS_RG4D',
		
		// 717th Auxiliary Assets
		'Poly_CA13','717th_DC15SA','Poly_DC17','Dual_Poly_DC17',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_A180','SDT_DC17MP','SDT_DC17ST','SDT_Defender','SDT_GC36Pistol',
		
		// 3AS (Beta Test)
		'3AS_pistol_DC15SA_F','3AS_DC17S_F','3AS_DC17STest_F'
	];

	// Sub-Machine Blasters
	_shortBlasters =
	[
		// Legion Base - Stable
		'SWLW_ACPR','SWLW_DC15s','SWLW_E5',
		
		// Just Like The Simulations - The Great War
		'JLTS_DC15S','JLTS_E5',
		
		// 717th Auxiliary Assets
		'Poly_E11_Scoped','Poly_E11','Poly_DC15S','Poly_E1',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_DC19E','SDT_DC5K','SDT_Water_E5','SDT_EE3','SDT_EE3ESB','SDT_GC36P',
		
		// 3AS (Beta Test)
		'3AS_DC15S_F','3AS_E5_F'
	];

	// Light Machine Blasters
	_rapidBlasters =
	[
		// Legion Base - Stable
		'SWLW_DC15SAW','SWLW_DC15SAW_wooden','SWLW_LS150','ls_weapon_ls150_primary','SWLW_Z6','SWLW_Z7',
		
		// Just Like The Simulations - The Great War
		'JLTS_Z6',
		
		// 717th Auxiliary Assets
		'Poly_DC15LE','Poly_Z6',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_GC36Z','SDT_Z6_Base',
		
		// 3AS (Beta Test)
		'3AS_DC15L_F','3AS_Chaingun'
	];

	// Assault Blasters
	_assaultBlasters =
	[
		// Legion Base - Stable
		'SWLW_DC15AC','SWLW_DC17M','SWLW_E4C','SWLW_westar35c','ls_weapon_westar_35c_primary','SWLW_westar35S','ls_weapon_westar_35s_primary','SWLW_Westar_M5_ugl','SWLW_Westar_M5','SWLW_7H73',
		
		// Just Like The Simulations - The Great War
		'JLTS_E5C','JLTS_E5C_stock',
		
		// 717th Auxiliary Assets
		'Poly_A280',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_GC36','SDT_GC36_wooden',
		
		// 3AS (Beta Test)
		'3AS_Flamer_Base','3AS_DC15C_F','E5C_F','3AS_WestarM5_F'
	];

	// Underbarrel Grenade Launcher Blasters
	_uglBlasters =
	[
		// Legion Base - Stable
		'SWLW_DC15A_ugl_wooden','SWLW_DC15A_ugl','ls_weapon_dc15a_ugl','SWLW_GL','SWLW_Westar_M5_ugl',
		
		// Just Like The Simulations - The Great War
		'JLTS_EPL2','JLTS_DC15A_ugl_plastic','JLTS_DC15A_ugl',
		
		// 717th Auxiliary Assets
		'Poly_DC15A_UGL',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_GC36UGL',
		
		// 3AS (Beta Test)
		'3AS_DC15A_GL','3AS_WestarM5_GL'
	];

	// Designated Marksman Blasters and Battle Blasters
	_largeBlasters =
	[
		// Legion Base - Stable
		'ls_weapon_dc15a_wooden','ls_weapon_dc15a','SWLW_DC15A','SWLW_DC15A_wooden',
		
		// Just Like The Simulations - The Great War
		'JLTS_DC15A_plastic','JLTS_DC15A','JLTS_DW32S',
		
		// 717th Auxiliary Assets
		'Poly_DC15A','717th_DC17M','Poly_EE3','Valken38X_F','773_Firepuncher',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_DC19A','SDT_Martini_Henry','SDT_Valken38x',
		
		// 3AS (Beta Test)
		'3AS_DC15A_F','3AS_DC17M_F','3AS_Valken38X_F'
	];

	// Sniper Blasters
	_sniperBlasters =
	[
		// Legion Base - Stable
		'SWLW_DC15BR','SWLW_DC15X','SWLW_DC15X_wooden','SWLW_sniper',
		
		// Just Like The Simulations - The Great War
		'JLTS_DC15X','JLTS_E5S',
		
		// 717th Auxiliary Assets
		'Poly_DC15X','Poly_IQA',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_DC19X_Wood','SDT_DC19X_Red_Wood','SDT_DC19X','SDT_GC36M','SDT_GC36M_wooden',
		
		// 3AS (Beta Test)
		'3AS_E3S_F'
	];

	// Slugthrowers
	_slugThrowers =
	[
		// Legion Base - Stable
		'SWLW_ACPA','SWLW_DP20',
		
		// Just Like The Simulations - The Great War
		'JLTS_DP23','JLTS_SBB3'
	];
	
	// Disposable Rocket Launchers
	_disposableLaunchers =
	[
		// Legion Base - Stable
		'ls_weapon_rps6_disposable',
		
		// 717th Auxiliary Assets
		'RPS5_Loaded','RPS5_HE_Loaded',
		
		// 3AS (Beta Test)
		'3AS_RPS6_F'
	];

	// Unguided Rocket Launchers
	_unguidedLaunchers =
	[
		// Legion Base - Stable
		'ls_weapon_rps6',
		
		// Just Like The Simulations - The Great War
		'JLTS_RPS6',
		
		// 717th Auxiliary Assets
		'Poly_HH16','RPS6',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_IonDisruptor','SDT_Valken35TB','SDT_RPS6',
		
		// 3AS (Beta Test)
		'3AS_RPS6_HP'
	];

	// Guided Rocket Launchers
	_guidedLaunchers =
	[
		// Legion Base - Stable
		'SWLW_E60R_AA','SWLW_E60R','ls_weapon_at_plx1','ls_weapon_aa_plx1',
		
		// Just Like The Simulations - The Great War
		'JLTS_E60R_AT','JLTS_PLX1_AT',
		
		// 717th Auxiliary Assets
		'Poly_PLX1','Poly_PLX2',
		
		// 3AS (Beta Test)
		'3AS_E60R_F','3AS_PLX1_F','3AS_RPS6_G'
	];
	
//==========
//MAGAZINES:
//==========

	// All Magazines
	_allMagazines =
	[
		// Legion Base - Stable
		'SWLW_DC17_Mag','ls_mag_dc17dual_20rnd','SWLW_RG4D_Mag','SWLW_westar35Sa_Mag','SWLW_acpr_Mag','SWLW_DC15AC_Mag','SWLW_DC15s_Mag','SWLW_E5_Mag','SWLW_DC15SAW_Mag','SWLW_E5C_mag','SWLW_LS150_mag',
		'SWLW_Z6_mag','SWLW_Z7_mag','SWLW_DC17M_Blaster_Mag','SWLW_westar35c_Mag','SWLW_Westar35S_Mag','SWLW_Westar35S_scatter_Mag','SWLW_WestarM5_Mag','SWLW_WestarM5_standard_Mag','SWLW_WestarM5_g_Mag','SWLW_ZH73_Mag',
		'SWLW_DC15A_Mag','SWLW_DC15A_UGL_flare_red_Mag','SWLW_DC15A_UGL_flare_gree_Mag','SWLW_DC15A_UGL_flare_white_Mag','SWLW_DC15A_UGL_Mag','SWLW_DC15A_UGL_smoke_blue_Mag','SWLW_DC15A_UGL_smoke_green_Mag','SWLW_DC15A_UGL_smoke_red_Mag',
		'SWLW_DC15A_UGL_smoke_purple_Mag','SWLW_DC15A_UGL_smoke_white_Mag','SWLW_DC15BR_Mag','SWLW_DC15X_Mag','SWLW_DC17M_Sniper_Mag','SWLW_sniper_Mag','SWLW_acpa_Mag','SWLW_DP20_Mag','SWLW_DC17M_AT_Mag','SWLW_mag_40mm_1rnd',
		'SWLW_mag_40mm_6rnd','SWLW_e60r_ap_mag','SWLW_e60r_at_mag','SWLW_e60r_aa_mag','ls_mag_rpg_1rnd','SWLW_plx1_ap_mag','SWLW_plx1_at_mag','SWLW_plx1_aa_mag','ls_mag_ap_plx','ls_mag_at_plx','ls_mag_aa_plx',
		
		// Just Like The Simulations - The Great War
		'JLTS_DC17SA_mag','JLTS_RG4D_mag','JLTS_E5_mag','JLTS_DC15S_mag','JLTS_stun_mag_long','JLTS_stun_mag_short','JLTS_Z6_mag','JLTS_E5C_mag','JLTS_DC15A_mag','JLTS_DW32S_mag','JLTS_stun_mag_long','JLTS_stun_mag_short','JLTS_DC15X_mag',
		'JLTS_E5S_mag','JLTS_DP23_mag','JLTS_SBB3_mag','JLTS_EPL2_mag','JLTS_RPS6_HE_mag','JLTS_RPS6_mag','JLTS_PLX1_AP_mag','JLTS_PLX1_AT_mag','JLTS_E60R_AP_mag','JLTS_E60R_AT_mag',
		
		// 717th Auxiliary Assets
		'Poly_DualMag','Poly_DC15A_magLP','Poly_DC15A_mag','Poly_DC15A_magHP','Poly_DC15LE_mag','Poly_60Rnd_EC40','Poly_E11_Mag','Poly_EMP_UGL','Poly_A280_mag','Poly_DC15A_mag','Poly_DC15A_magHP','Poly_773_Magazine','Poly_EMP_UGL','Poly_5Rnd_EC80',
		'Poly_DC15X_Magazine','Poly_IQA_Magazine','Poly_Valken38X_Magazine','Poly_AntiArmour_mag',
		
		// Schlabbies Depressed Textures - Legion Base
		'SDT_A180_Mag','SDT_DC17MP_Mag','SDT_DC17ST_Mag','SDT_Defender_Mag','SDT_GC36Pistol_mag','SDT_GC36_LSW_mag','SDT_Z6_mag','SDT_GC_36_mag','SDT_DC19X_Mag','SDT_GC36_HEE_mag','SDT_GC36_HE_mag','SDT_IonDisruptor_mag','SDT_ValkenTB_Mag',
		
		// 3AS (Beta Test)
		'3AS_15Rnd_EC30_mag','3AS_16Rnd_EC20_Mag','3AS_10Rnd_Test_mag','3AS_60Rnd_EC30_mag','3AS_60Rnd_EM50_RedPlasma','3AS_200Rnd_EC40_Mag','3AS_Chaingun_Drum_Mag','3AS_130Rnd_EM50_RedPlasma','3AS_FlamerFuel','3AS_100Rnd_EC40_mag',
		'3AS_40Rnd_EC40_Mag','3AS_60Rnd_EC50_Mag','3AS_10Rnd_EC80_Mag','3AS_45Rnd_EC50_Mag','3AS_5Rnd_EC80_mag','3AS_10Rnd_EM90_Mag','3AS_AntiArmour_mag','3AS_E60R_AT','3AS_JLTS_MK39_AA','3AS_JLTS_MK43_AT','3AS_JLTS_MK44_HE','3AS_MK41_AT',
		'3AS_MK42_HE',

		// Schlabbies Depressed Textures - Legion Base
		'SDT_DC19E_mag','SDT_DC19E_water_mag','SDT_DC5K_mag','SDT_Water_E5_Mag','SDT_EE3_mag','SDT_EE3ESB_mag','SDT_GC_36P_mag','SDT_DC19A_mag','SDT_DC19A_water_mag','SDT_Martini_mag','SDT_Valken_mag','SDT_rps6_mag'
	];
	
	// All Grenades
	_allGrenades =
	[
		// Arma 3
		'Chemlight_blue','Chemlight_green','Chemlight_red','Chemlight_yellow','SmokeShellBlue','SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed','SmokeShellYellow','SmokeShell',
		
		// ACE3
		'ACE_Chemlight_HiBlue','ACE_Chemlight_HiGreen','ACE_Chemlight_HiRed','ACE_Chemlight_HiWhite','ACE_Chemlight_HiYellow','ACE_Chemlight_IR','ACE_Chemlight_Orange','ACE_Chemlight_UltraHiOrange','ACE_Chemlight_White','ACE_M84',
		
		// Just Like The Simulations - The Great War
		'JLTS_grenade_emp_mag',
		
		// 717th Auxiliary
		'Poly_ThermalDetonator','Droid_Popper_Mag',
		
		// 3AS (Beta Test)
		'ShieldGrenade_Mag','SquadShieldMagazine'
	];
	
	// All Explosives
	_allExplosives =
	[
		// Arma 3
		'DemoCharge_Remote_Mag','SatchelCharge_Remote_Mag',
		
		// Legion Base - Stable
		'ls_mag_detPack_remoteCharge','ls_mag_demo_remoteCharge','ls_mag_breach_remoteCharge','ls_mag_caltrops_dispenser',
		
		// Just Like the Simulations - The Great War
		'JLTS_explosive_emp_10_mag','JLTS_explosive_emp_20_mag','JLTS_explosive_emp_50_mag',
		
		// 3AS (Beta Test)
		'3AS_DetPack','EC01_RemoteMagazine','RTX_RemoteMagazine','HX_AT_Mine_Mag',
		
		// Operation TREBUCHET
		'M168_Remote_Mag'
	];
	
	// Regular Grenades
	_regularGrenades =
	[
		// Arma 3
		'Chemlight_blue','Chemlight_green','Chemlight_red','Chemlight_yellow','SmokeShellBlue','SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed','SmokeShellYellow','SmokeShell',
		
		// ACE3
		'ACE_Chemlight_HiBlue','ACE_Chemlight_HiGreen','ACE_Chemlight_HiRed','ACE_Chemlight_HiWhite','ACE_Chemlight_HiYellow','ACE_Chemlight_IR','ACE_Chemlight_Orange','ACE_Chemlight_UltraHiOrange','ACE_Chemlight_White','ACE_M84',
		
		// Just Like The Simulations - The Great War
		'JLTS_grenade_emp_mag',
		
		// 717th Auxiliary
		'Poly_ThermalDetonator','Droid_Popper_Mag'
	];
	
	// Shield Grenades
	_shieldGrenades =
	[
		// 3AS (Beta Test)
		'ShieldGrenade_Mag','SquadShieldMagazine'
	];
	
	// Regular Explosives
	_regularExplosives =
	[
		// Arma 3
		'DemoCharge_Remote_Mag','SatchelCharge_Remote_Mag',
		
		// Legion Base - Stable
		'ls_mag_detPack_remoteCharge','ls_mag_demo_remoteCharge','ls_mag_breach_remoteCharge','ls_mag_caltrops_dispenser',
		
		// Just Like the Simulations - The Great War
		'JLTS_explosive_emp_10_mag','JLTS_explosive_emp_20_mag','JLTS_explosive_emp_50_mag',
		
		// 3AS (Beta Test)
		'3AS_DetPack','EC01_RemoteMagazine','RTX_RemoteMagazine','HX_AT_Mine_Mag'
	];
	
	// Special Explosives
	_specialExplosives =
	[
		// Arma 3
		'SatchelCharge_Remote_Mag',
		
		// Legion Base - Stable
		'ls_mag_breach_remoteCharge','ls_mag_caltrops_dispenser',
		
		// 3AS (Beta Test)
		'HX_AT_Mine_Mag',
		
		// Operation TREBUCHET
		'M168_Remote_Mag'
	];

//=================
//UNIFORM ELEMENTS:
//=================

	// Helmet Attachments
	_helmetWear = 
	[
		// Legion Base - Stable
		'SWLB_clone_P1_HUD','SWLB_clone_P2_HUD','SWLB_clone_RC_HUD','lsd_gar_republicCommando_hud','SWLB_clone_ARF_antenna_HUD','SWLB_clone_rangefinder_HUD','lsd_gar_arfAntenna_hud','lsd_gar_arfAntennaPressurized_hud','lsd_gar_p1Interior_flashlight',
		'lsd_gar_p2Interior_flashlight',

		// Just Like the Simulations - The Great War
		'JLTS_Clone_helmetInterior_AB','JLTS_Clone_helmetInterior_P2',
		
		// 717th Auxiliary
		'Phase1CC_Visor','Heavy_Visor','Heavy_Visor_red','Poly_RepublicCommandoHUD','Poly_RepublicCommandoEOD_HUD','Phase1_Visor',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_gunner_helmet_NC','SDT_gunner_helmet_black_NC','SDT_gunner_helmet_black','SDT_gunner_helmet_DarkSilver_NC','SDT_gunner_helmet_DarkSilver','SDT_gunner_helmet_silver_NC','SDT_gunner_helmet_silver','SDT_gunner_plating','SDT_bacara_plating','SDT_BARC_plates',
		'SDT_BARC_plates_black',
		
		// 3AS (Beta Test)
		'3as_Phase1CC_Visor','3as_Phase1_Lamps','3as_Phase1_MacroBinocular','3as_Phase1_RangeFinder','3as_Phase1_Visor'
	];
	
	// Cloth Coverings
	_clothWear =
	[
		// Legion Base - Stable
		'SWLB_CEE_Clone_Hood','SWLB_CEE_Clone_Scarf','SWLB_CEE_Clone_Scarf_Blue','SWLB_CEE_Clone_Scarf_Green','SWLB_CEE_Clone_Scarf_Orange','SWLB_CEE_Scarf_Red','SWLB_CEE_Clone_Scarf_Stewart','SWLB_CEE_Clone_Scarf_White','ls_misc_poncho_facewear',
		'ls_misc_poncho_partnerBlack_facewear','ls_misc_poncho_partnerWhite_facewear','ls_misc_poncho_peaceBlue_facewear','ls_misc_poncho_peaceGrean_facewear','ls_misc_poncho_peaceRed_facewear','ls_misc_poncho_sideStripeBlue_facewear',
		'ls_misc_poncho_sideStripeBrown_facewear','ls_misc_poncho_sideStripeRed_faceweat','ls_misc_poncho_sideStripeWhite_facewear'
	];
	
	// Masks
	_masks =
	[
		'',''
	];
	
	// Officer Uniforms
	_officerUniforms =
	[
		// 717th Auxiliary
		'Officer_Director','Officer_Formal','Officer_Flight','Officer_Spook','Officer_Medic'
	];
	
	// Armour Sets
	_armourSets =
	[
		// Legion Base - Stable
		'SWLB_clone_mc_uniform','SWLB_clone_uniform','SWLB_CEE_Doom_Uniform','SWLB_CEE_Wolffe_Uniform','SWLB_CEE_13th_Iron_Battalion_Clone_Trooper_Uniform','SWLB_CEE_Cody_Uniform','SWLB_CEE_Bly_Uniform','SWLB_CEE_Rex_Uniform','SWLB_CEE_Ganch_Uniform','SWLB_CEE_612th_Uniform',
		'SWLB_clone_eod_uniform','SWLB_CEE_Fordo_Uniform','SWLB_CEE_Deviss_Uniform','SWLB_Cee_KCompany_Uniform','SWLB_clone_P1Captain_uniform','SWLB_clone_P1Commander_uniform','SWLB_clone_P1Lieutenant_uniform','SWLB_clone_P1Sergeant_uniform','SWLB_clone_101stTrooper_Uniform',
		'SWLB_clone_104thTrooper_Uniform','SWLB_clone_187thOfficer_Uniform','SWLB_clone_187thTrooper_Uniform','SWLB_clone_212thBoil_Uniform','SWLB_clone_212thWaxer_Uniform','SWLB_clone_212thAB_Uniform','SWLB_clone_212thTrooper_Uniform','SWLB_clone_21stOfficer_Uniform',
		'SWLB_clone_21stTrooper_Uniform','SWLB_clone_327thTrooper_Uniform','SWLB_clone_332ndTrooper_Uniform','SWLB_CEE_34th_Clone_Assassin_Uniform','SWLB_clone_41stGCGree_Uniform','SWLB_clone_41stGCTrooper_Uniform','SWLB_clone_41stOfficer_Uniform','SWLB_clone_41stTrooper_Uniform',
		'SWLB_clone_442ndTrooper_Uniform','SWLB_clone_501stDogma_Uniform','SWLB_clone_501stEcho_Uniform','SWLB_clone_501stFives_Uniform','SWLB_clone_501stHardcase_Uniform','SWLB_clone_501stJesse_Uniform','SWLB_clone_501stKix_Uniform','SWLB_clone_501stTup_Uniform',
		'SWLB_clone_501stTrooper_Uniform','SWLB_clone_5thMedic_Uniform','SWLB_clone_5thNCO_Uniform','SWLB_clone_5thOfficer_Uniform','SWLB_clone_5thTrooper_Uniform','SWLB_clone_74thTrooper_Uniform','SWLB_clone_91stCFR_Uniform','SWLB_clone_91stMedic_Uniform',
		'SWLB_clone_91stTrooper_Uniform','SWLB_clone_CGFox_Uniform','SWLB_clone_CGThorn_Uniform','SWLB_clone_HCLock_Uniform','SWLB_clone_HCTrooper_Uniform','SWLB_CEE_Rancor_Blitz_Uniform','SWLB_CEE_Rancor_Colt_Uniform','SWLB_CEE_Rancor_Havoc_Uniform','SWLB_CEE_Rancor_Trooper_Uniform',
		'SWLB_CEE_Gregor_Uniform','SWLB_AiwhaDikut_Uniform','SWLB_AiwhaSarge_Uniform','SWLB_AiwhaTyto_Uniform','SWLB_AiwhaZag_Uniform','SWLB_Bravo2_Uniform','SWLB_Bravo3_Uniform','SWLB_Bravo4_Uniform','SWLB_BravoRam_Uniform','SWLB_DeltaBoss_Uniform','SWLB_DeltaFixer_Uniform',
		'SWLB_DeltaScorch_Uniform','SWLB_DeltaSev_Uniform','SWLB_MPGunner_Uniform','SWLB_CEE_Hodasal_Squad_Jungle_Commando_Uniform','SWLB_MPMarksman_Uniform','SWLB_Omega_Uniform','SWLB_MPRecon_Uniform','SWLB_MPStealth_Uniform','SWLB_YayaxCov_Uniform','SWLB_YayaxDev_Uniform',
		'SWLB_YayaxJind_Uniform','SWLB_YayaxYover_Uniform','ls_sob_commando_uniform','ls_gar_marshalCommander_uniform','lsd_gar_phase2Insulated_uniform','ls_gar_phase2_uniform','lsd_csf_senateGuard_uniform','lsd_csf_captainCommando_uniform','lsd_csf_guardsmanCommando_uniform',
		'lsd_csf_lieutenantCommando_uniform','SWLB_CEE_Senate_Commando_Trooper_Uniform',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneArmorMC','JLTS_CloneArmorMC_104_Wolffe','JLTS_CloneArmorMC_212_Cody','JLTS_CloneArmorMC_501_Vaughn','JLTS_CloneArmorMC_CG_Thorn','JLTS_CloneArmor_DC_Doom','JLTS_CloneArmorMC_HC_Lock','JLTS_CloneArmorMC_KS_commander','JLTS_CloneArmor','JLTS_CloneArmor_104_medic',
		'JLTS_CloneArmor_104','JLTS_CloneArmor_187_airborne','JLTS_CloneArmor_187_medic','JLTS_CloneArmor_187','JLTS_CloneArmor_212_airborne','JLTS_CloneArmor_212_medic','JLTS_CloneArmor_212','JLTS_CloneArmor_327_Bly','JLTS_CloneArmor_327_medic','JLTS_CloneArmor_327',
		'JLTS_CloneArmor_41_medic','JLTS_CloneArmor_41','JLTS_CloneArmor_442_medic','JLTS_CloneArmor_442','JLTS_CloneArmor_501_airborne','JLTS_CloneArmor_501_Appo','JLTS_CloneArmor_501_medic','JLTS_CloneArmor_501_Rex','JLTS_CloneArmor_501_Vill','JLTS_CloneArmor_501',
		'JLTS_CloneArmor_5_medic','JLTS_CloneArmor_5','JLTS_CloneArmor_91_medic','JLTS_CloneArmor_91','JLTS_CloneArmor_ARC_Blitz','JLTS_CloneArmor_501_Fives','JLTS_CloneArmor_ARC_Fordo','JLTS_CloneArmor_ARC_Hammer','JLTS_CloneArmor_501_Jesse','JLTS_CloneArmor_ARC_Predator',
		'JLTS_CloneArmor_CG_Fox','JLTS_CloneArmor_CG_medic','JLTS_CloneArmor_CG_Thire','JLTS_CloneArmor_CG','JLTS_CloneArmor_Commander','JLTS_CloneArmor_DC_medic','JLTS_CloneArmor_DC','JLTS_CloneArmor_HC_medic','JLTS_CloneArmor_HC','JLTS_CloneArmor_KC_medic','JLTS_CloneArmor_KC',
		'JLTS_CloneArmor_KS_medic','JLTS_CloneArmor_KS','JLTS_CloneArmor_Lieutenant','JLTS_CloneArmor_medic','JLTS_CloneArmor_bomb','JLTS_CloneArmor_Purge_medic','JLTS_CloneArmor_Purge','JLTS_CloneArmor_Sergeant','JLTS_CloneArmor_Shadow_medic','JLTS_CloneArmor_Shadow',
		'JLTS_CloneArmorGrenadier','JLTS_CloneArmorGrenadier_104','JLTS_CloneArmorGrenadier_187','JLTS_CloneArmorGrenadier_212','JLTS_CloneArmorGrenadier_41','JLTS_CloneArmorGrenadier_442','JLTS_CloneArmorGrenadier_501','JLTS_CloneArmorGrenadier_5','JLTS_CloneArmorGrenadier_91',
		'JLTS_CloneArmorGrenadier_CG','JLTS_CloneArmorGrenadier_DC','JLTS_CloneArmorGrenadier_HC','JLTS_CloneArmorGrenadier_KS','JLTS_CloneArmorGrenadier_Purge','JLTS_CloneArmorGrenadier_Shadow','JLTS_CloneArmorRecon','JLTS_CloneArmorRecon_91','JLTS_CloneArmorSupport',
		'JLTS_CloneArmorSupport_104','JLTS_CloneArmorSupport_187','JLTS_CloneArmorSupport_212','JLTS_CloneArmorSupport_327','JLTS_CloneArmorSupport_41_Gree','JLTS_CloneArmorSupport_41','JLTS_CloneArmorSupport_442','JLTS_CloneArmorSupport_501','JLTS_CloneArmorSupport_5',
		'JLTS_CloneArmorSupport_91','JLTS_CloneArmorSupport_CG','JLTS_CloneArmorSupport_DC','JLTS_CloneArmorSupport_HC','JLTS_CloneArmorSupport_KS','JLTS_CloneArmorSupport_Shadow','JLTS_CloneArmor_SC','JLTS_CloneArmor_SC_commander','JLTS_CloneArmor_SC_media',
		
		// 717th Auxiliary Assets
		'717th_CommandoUniform_NightOps','717th_CommandoUniform_Recon','717th_CommandoBaseUniform','717th_CommandoUniform_UrbanFighter','Poly_Legacy_HeavyUniform','Poly_Legacy_JumpUniform','Poly_Legacy_PilotUniform','Poly_Legacy_SniperUniform','P1_CG_Uni','Poly_SpecOps_Uni',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_41st_Aircrew_Uniform','SDT_41st_Aircrew_Uniform_Camo','SDT_41st_CT_Uniform','SDT_41st_CT_Uniform_Camo','SDT_DEVSchlabbie_commando_uniform_w','SDT_DEVSchlabbie_commando_uniform','SDT_LeVi_Uniform','SDT_DEVNox_uniform','SDT_DEVSchlabbie','SDT_GD_107_uniform',
		'SDT_GD_107_worn_uniform','SDT_GD_stealth_uniform','SDT_GD_stealth_w_uniform','SDT_GD_C_uniform','SDT_GD_worn_C_uniform','SDT_GD_uniform_medic','SDT_GD_uniform_worn_medic','SDT_GD_worn_CR_uniform','SDT_GD_clean_uniform','SDT_GD_worn_uniform','SDT_GD_Oak_uniform',
		'SDT_GD_worn_Oak_uniform','SDT_Lego212_uniform','SDT_Lego442_uniform','SDT_Jumper_uniform','SDT_Lego501_uniform','SDT_LegoATRT_uniform','SDT_LegoCMD_uniform','SDT_LegoG_uniform','SDT_LegoKScout_uniform','SDT_LegoK_uniform','SDT_LegoShock2_uniform','SDT_LegoShock1_uniform',
		'SDT_LegoU_uniform','SDT_GD_Stealth_uniform_S','SDT_GD_stealth_w_uniform_S','SDT_GD_uniform_S','SDT_GD_worn_uniform_S','SDT_CPT_uniform','SDT_gree_uniform','SDT_krieg_uniform','SDT_stone_uniform','SDT_CMD_uniform','SDT_Araniik_commando_uniform','SDT_Aruetyc_commando_uniform',
		'SDT_Naast_commando_uniform','SDT_Verd_commando_uniform','SDT_geospec_uniform','SDT_LT_uniform','SDT_Strike_uniform','SDT_SGT_uniform','SDT_stealth_spec_uniform','SDT_Clone_Hazard_Uniform','SDT_Intelligence_Uniform','SDT_Clone_Scuba_Uniform','SDT_501_Boomer_uniform',
		'SDT_501_vill_uniform','SDT_ATRT_ARF_uniform','SDT_desert_camo_uniform','SDT_fordo_uniform','SDT_forest_camo_uniform','SDT_geo_arf_camo_uniform','SDT_grass_camo_uniform','SDT_LT_ARC_uniform','SDT_LT2_ARC_uniform','SDT_naval_camo_uniform','SDT_night_camo_uniform',
		'SDT_sand_camo_uniform','SDT_shadowarf_uniform','SDT_Sisqua_uniform','SDT_snow_camo_uniform','SDT_urban_camo_uniform','SDT_RLI_uniform','SDT_TP_uniform',
		
		// 3AS (Beta Test)
		'3as_ATRT_Driver_Uniform','3AS_Clone_Phase1_Armor','3AS_Clone_Phase1_Armor_Captain','3AS_Clone_Phase1_Dirty_Armor_Captain','3AS_Clone_Phase1_Armor_Commander','3AS_Clone_Phase1_Dirty_Armor_Commander','3AS_Clone_Phase1_Dirty_Armor','3AS_Clone_Phase1_Armor_Lieutenant',
		'3AS_Clone_Phase1_Dirty_Armor_Lieutenant','3AS_Clone_Phase1_Armor_Sergeant','3AS_Clone_Phase1_Dirty_Armor_Sergeant','3AS_U_Rep_Katarn_Armor','3AS_U_Rep_Katarn_Armor_Boss','3AS_U_Rep_Katarn_Armor_Fixer','3AS_U_Rep_Katarn_Armor_Gregor','3AS_U_Rep_Katarn_Armor_Niner',
		'3AS_U_Rep_Katarn_Armor_Omega','3AS_U_Rep_Katarn_Armor_Scorch','3AS_U_Rep_Katarn_Armor_Sev'
	];
	
	// Coveralls
	_coverAlls =
	[
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_41st_Pilot_Uniform','SDT_41st_Pilot_Uniform_Camo','SDT_Clone_wetsuit_uniform',
		
		// 3AS (Beta Test)
		'3AS_U_501st_Pilot_Phase3','3AS_U_Pilot_Phase3'
	];

//======
//VESTS:
//======

	// Heavy Vests
	_heavyCombatVests =
	[
		// Legion Base - Stable
		'ls_mandalorian_saxonGrunt_vest','ls_mandalorian_saxonSergeant_vest','SWLB_clone_arc_armor','SWLB_clone_501stEcho_Armor','SWLB_clone_501stFives_Armor','SWLB_CEE_Engineer_Vest_Officer','SWLB_CEE_Force_Recon_Commander','SWLB_CEE_Ganch_Vest','SWLB_CEE_Force_Recon_Officer',
		'SWLB_CEE_Recon_Lieutenant','SWLB_CEE_Officer_Tactical','SWLB_CEE_Rancor_Blitz_Vest','SWLB_CEE_Rancor_Colt_Vest','SWLB_CEE_Rancor_Havoc_Vest','SWLB_clone_commander_armor','SWLB_clone_commander_armor_rank','SWLB_clone_212thCommander_armor','SWLB_clone_327thCommander_vest',
		'SWLB_clone_41stGCCommander_vest','SWLB_clone_442ndCommander_armor','SWLB_clone_501stCommander_armor','SWLB_clone_commander_armor_black','SWLB_clone_CGCommander_armor','SWLB_clone_lieutenant_armor','SWLB_clone_officer_armor','SWLB_clone_212thOfficer_armor','SWLB_CEE_Bly_Vest',
		'SWLB_clone_327thOfficer_vest','SWLB_clone_41stGCOfficer_vest','SWLB_clone_442ndOfficer_armor','SWLB_CEE_Rex_Vest','SWLB_clone_501stOfficer_armor','SWLB_clone_officer_armor_black','SWLB_clone_CGOfficer_armor','SWLB_CEE_Deviss_Vest','SWLB_CEE_Kcompany_Vest',
		'ls_imp_pauldron_vest','ls_imp_pauldronBlack_vest','ls_imp_pauldronWhiplash_vest','ls_imp_pauldronWhite_vest','ls_gar_airborneOfficer_vest','ls_mandalorian_traditional_vest',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneVestARCCadet','JLTS_CloneVestARC','JLTS_CloneVestARC_ARC_Blitz','JLTS_CloneVest_ARC_501_Fives','JLTS_CloneVestARC_ARC_Hammer','JLTS_CloneVestARC_501_Jesse','JLTS_CloneVestARC_ARC_Predator','JLTS_CloneVestCommander','JLTS_CloneVestCommander_212',
		'JLTS_CloneVestCommander_442','JLTS_CloneVestCommander_501_Rex','JLTS_CloneVestCommander_501','JLTS_CloneVestCommander_91','JLTS_CloneVestCommander_CG','JLTS_CloneVestCommander_DC','JLTS_CloneVestCommander_KS','JLTS_CloneVestLieutenant','JLTS_CloneVestLieutenant_212',
		'JLTS_CloneVestLieutenant_442','JLTS_CloneVestLieutenant_501','JLTS_CloneVestLieutenant_91','JLTS_CloneVestLieutenant_CG','JLTS_CloneVestLieutenant_DC','JLTS_CloneVestLieutenant_KS','JLTS_CloneVestOfficer','JLTS_CloneVestOfficer_212','JLTS_CloneVestOfficer_327_Bly',
		'JLTS_CloneVestOfficer_327_brown','JLTS_CloneVestOfficer_327','JLTS_CloneVestOfficer_442','JLTS_CloneVestOfficer_501_Appo','JLTS_CloneVestOfficer_501_Vill','JLTS_CloneVestOfficer_501','JLTS_CloneVestOfficer_91','JLTS_CloneVestOfficer_CG_Thire','JLTS_CloneVestOfficer_CG',
		'JLTS_CloneVestOfficer_DC','JLTS_CloneVestOfficer_KC_Deviss','JLTS_CloneVestOfficer_KC','JLTS_CloneVestOfficer_KS','JLTS_CloneVestOfficer2','JLTS_CloneVestOfficer2_212','JLTS_CloneVestOfficer2_327','JLTS_CloneVestOfficer2_442','JLTS_CloneVestOfficer2_501',
		'JLTS_CloneVestOfficer2_91','JLTS_CloneVestOfficer2_CG','JLTS_CloneVestOfficer2_DC','JLTS_CloneVestOfficer2_KC','JLTS_CloneVestOfficer2_KS','JLTS_CloneVestPurge','JLTS_CloneVestPurge_commander','JLTS_CloneVestPurge_officer',
		
		// 717th Auxiliary Assets
		'Poly_ARC_CSM','Poly_ARC_LT','717th_Officer_Commander','717th_Officer_Lieutenant','717th_Officer_Reverse','717th_Officer','CloneGunner_ChestRig',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_LeVi_Vest','SDT_DEVNox_armor_dark','SDT_DEVNox_armor_light','SDT_GD_heavy_duty_engi_vest','SDT_GD_Commander_Vest','SDT_GD_lightCommander_Vest','SDT_oak_vest_cmd','SDT_Closequarter_gunner_specialist_NCO_vest','SDT_Closequarter_gunner_specialist_vest',
		'SDT_fordo_armor','SDT_501_Vill_armor','SDT_LT_ARC_armor','SDT_gunner_carrier_Vest','SDT_gunner_carrier_Vest_black','SDT_gunner_carrier_Vest_darksilver','SDT_gunner_carrier_Vest_silver','SDT_gunner_grenadier_Vest','SDT_gunner_grenadier_Vest_Black',
		'SDT_gunner_grenadier_Vest_DarkSilver','SDT_gunner_grenadier_Vest_Silver','SDT_gunner_lightcarrier_Vest','SDT_gunner_lightcarrier_Vest_black','SDT_gunner_lightcarrier_Vest_DarkSilver','SDT_gunner_lightcarrier_Vest_Silver','SDT_gunner_NCO_vest','SDT_gunner_NCO_vest_black',
		'SDT_gunner_NCO_vest_darksilver','SDT_gunner_NCO_vest_silver','SDT_gunner_recon_Vest','SDT_gunner_recon_Vest_black','SDT_gunner_recon_Vest_DarkSilver','SDT_gunner_recon_Vest_Silver','SDT_gunner_RTO_vest','SDT_gunner_RTO_vest_black','SDT_gunner_RTO_vest_darksilver',
		'SDT_gunner_RTO_vest_silver','SDT_gunner_specialist_NCO_Vest','SDT_gunner_specialist_NCO_Vest_black','SDT_gunner_specialist_NCO_Vest_DarkSilver','SDT_gunner_specialist_NCO_Vest_Silver','SDT_gunner_specialist_vest','SDT_gunner_specialist_vest_black',
		'SDT_gunner_specialist_vest_darksilver','SDT_gunner_specialist_vest_silver','SDT_gunner_survivalist_vest','SDT_gunner_survivalist_Black_vest','SDT_gunner_vest','SDT_gunner_vest_black','SDT_gunner_vest_darksilver','SDT_gunner_vest_silver','SDT_heavy_duty_engi_vest',
		'SDT_heavy_specialist_gunner_NCO_vest','SDT_heavy_specialist_gunner_NCO_vest_black','SDT_heavy_specialist_gunner_NCO_vest_darksilver','SDT_heavy_specialist_gunner_NCO_vest_silver','SDT_heavy_specialist_gunner_vest','SDT_heavy_specialist_gunner_vest_black',
		'SDT_heavy_specialist_gunner_vest_darksilver','SDT_heavy_specialist_gunner_vest_silver','SDT_lightCommander_Vest','SDT_officer_carrier_vest','SDT_recon_support_gunner_NCO_vest','SDT_recon_support_gunner_NCO_vest_black','SDT_recon_support_gunner_NCO_vest_darksilver',
		'SDT_recon_support_gunner_NCO_vest_silver','SDT_recon_support_gunner_vest','SDT_recon_support_gunner_vest_black','SDT_recon_support_gunner_vest_darksilver','SDT_recon_support_gunner_vest_silver'
	];
	
	// Light Vests
	_lightCombatVests =
	[
		// Legion Base - Stable
		'SWLB_CEE_Airborne_CFR','SWLB_CEE_Airborne_Light','SWLB_CEE_Force_Recon_NCO','SWLB_CEE_Force_Recon','SWLB_CEE_Heavy_Vest','SWLB_CEE_Recon_Survival','SWLB_CEE_Tactical_Commander','SWLB_clone_airborne_nco_armor','SWLB_clone_recon_nco_armor','SWLB_CEE_Fordo_Vest',
		'SWLB_clone_recon_officer_armor','SWLB_clone_basic_armor','SWLB_clone_commando_basic_armor_k1','ls_misc_poncho_base','ls_misc_poncho_partnerBlack','ls_misc_poncho_partnerWhite','ls_misc_poncho_peaceBlue','ls_misc_poncho_peaceGreen','ls_misc_poncho_peaceRed',
		'ls_misc_poncho_sideStripeBlue','ls_misc_poncho_sideStripeBrown','ls_misc_poncho_sideStripeRed','ls_misc_poncho_sideStripeWhite','ls_gar_heavyAlt_vest','ls_gar_heavy_vest','lsd_gar_marine_vest',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneVestAirborneNCO','JLTS_CloneVestAirborneNCO_212','JLTS_CloneVestAirborneNCO_501','JLTS_CloneVestReconNCO','JLTS_CloneVestReconNCO_ARC_Fordo','JLTS_CloneVestReconOfficer','JLTS_CloneVestReconOfficer_91','JLTS_CloneVestReconOfficer_DC',
		
		// 717th Auxiliary Assets
		'Poly_Medical_armor','717th_MedicNCO','717th_MP_Strap','Poly_Basic_armor','Poly_Katarn_armor',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_oak_vest','SDT_heavy_recon_specialist_NCO_vest_Schlabbie','SDT_heavy_recon_specialist_vest_Schlabbie','SDT_Closequarter_specialist_NCO_vest','SDT_heavy_gunner_specialist_NCO_Vest','SDT_heavy_recon_specialist_NCO_vest','SDT_heavy_recon_specialist_vest',
		'SDT_recon_specialist_CO_vest','SDT_recon_specialist_vest','SDT_recon_support_NCO_vest','SDT_rocket_carrier_NCO_vest','SDT_recon_specialist_Schlabbie_vest',
		
		// 3AS (Beta Test)
		'3AS_Pilot_Vest'
	];
	
	// Crew Vests
	_crewVests =
	[
		// 717th Auxiliary Assets
		'Rank_CP_Army','Rank_CP_Naval','Rank_LT_Army','Rank_LT_Naval','Rank_SGT_Army','Rank_SGT_Naval'
	];
	
	// Straps, Harnesses and Bandoliers
	_strapsHarnessesBandoliers =
	[
		// Legion Base - Stable
		'SWLB_CEE_ARF_Vest','SWLB_CEE_Enginee_Vest_NCO','SWLB_CEE_Engineer_Vest','SWLB_CEE_Hazard_Vest','SWLB_clone_airborne_armor','SWLB_clone_assault_armor','SWLB_41stGCGree_vest','SWLB_clone_cfr_armor','SWLB_clone_41stGCCfr_vest','SWLB_clone_grenadier_armor','SWLB_clone_kama_armor',
		'SWLB_CEE_Doom_Vest','SWLB_CEE_Wolffe_Vest','SWLB_CEE_43th_Clone_Assassins_Vest','SWLB_clone_41stGCKama_vest','SWLB_clone_medic_armor','SWLB_clone_41stGCMedic_vest','SWLB_clone_recon_armor','SWLB_clone_specialist_armor','SWLB_clone_commando_eod_armor_k1',
		'SWLB_clone_commando_sniper_armor_k1','SWLB_clone_commando_sl_armor_k1','SWLB_clone_commando_tech_armor_k1','SWLB_OmegaAtin_Armor','SWLB_MPStealth_Armor_Tech','lsd_gar_clone_vest','lsd_orsf_trooper_vest','lsd_orsf_trooperAlt_vest',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneVestAirborne','JLTS_CloneVestAirborne_212','JLTS_CloneVestAirborne_501','JLTS_CloneVestHolster','JLTS_CloneVestKama','JLTS_CloneVestKama_104_Wolffe','JLTS_CloneVestKama_91','JLTS_CloneVestKama_DC_Doom','JLTS_CloneVestKama_DC','JLTS_CloneVestRecon',
		'JLTS_CloneVestSuspender_41_Gree','JLTS_CloneVestSuspender_white','JLTS_CloneVestSuspender',
		
		// 717th Auxiliary Assets
		'Poly_KnifeHolster','Mando_KnifeHolster','Poly_OfficerHolster',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_Closequarter_specialist_vest','SDT_heavy_gunner_specialist_vest','SDT_recon_support_vest','SDT_rocket_carrier_vest',
		
		// 3AS (Beta Test)
		'3AS_V_Katarn_Vest_Demo','3AS_V_Katarn_Vest_Tech','3AS_V_Katarn_Vest_Tech_Foxtrot','3AS_V_Katarn_Vest_Tech_Omega'
	];
	
	// Rebreathers
	_rebreathers =
	[
		// Legion Base - Stable
		'SWLB_CEE_Lightweight_Rebreather',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_GD_scuba_vest','SDT_GD_scuba_vest_w','SDT_scuba_vest','SDT_scuba_vest_old'
	];
	
//==========
//BACKPACKS:
//==========

	// Packs
	_packs =
	[
		// Legion Base - Stable
		'SWLB_clone_backpack','SWLB_clone_bag','SWLB_clone_bag_belt','SWLB_clone_backpack_eod','SWLB_clone_backpack_heavy','SWLB_clone_bag_leg','SWLB_clone_backpack_medic','SWLB_clone_41stGC_Backpack','SWLB_clone_41stGC_Backpack_heavy','SWLB_clone_41stGC_Backpack_medic',
		'SWLB_clone_commando_backpack_k2','SWLB_CEE_Gregor_Backpack','SWLB_DeltaFixer_backpack','SWLB_DeltaSev_backpack','SWLB_MPGunner_backpack','SWLB_CEE_Hodasal_Squad_Jungle_Commando_Backpack','SWLB_MPMarksman_backpack','SWLB_Omega_backpack','SWLB_MPRecon_backpack',
		'SWLB_MPStealth_backpack','SWLB_clone_commando_backpack_k2_eod','SWLB_DeltaScorch_backpack','SWLB_OmegaDarman_backpack','SWLB_YayaxDev_backpack','SWLB_YayaxYover_backpack','SWLB_clone_commando_backpack_k2_tech','lsd_gar_marine_backpack','ls_gar_survivalMedic_backpack',
		'ls_gar_survival_backpack','ls_gar_standard_backpack','ls_gar_heavy_backpack','ls_gar_heavyMedic_backpack','ls_gar_medic_backpack','ls_gar_medium_backpack','ls_gar_rocket_backpack','lsd_orsf_trooper_backpack',
		
		// Just Like The Simulations - The Great War
		'JLTS_Clone_backpack','JLTS_Clone_backpack_eod_DC','JLTS_Clone_backpack_medic_DC','JLTS_Clone_backpack_DC','JLTS_Clone_backpack_eod','JLTS_Clone_backpack_medic','JLTS_Clone_backpack_bomb','JLTS_Clone_backpack_Purge_medic','JLTS_Clone_backpack_Purge','JLTS_Clone_backpack_s',
		'JLTS_Clone_belt_bag',
		
		// Schlabbies Depressed Textures
		'SDT_gd_backpack','SDT_gd_EOD_backpack','SDT_gd_Heavy_backpack','SDT_gd_Medic_backpack','SDT_bp_Naast','SDT_bp_verd','SDT_bp_Aruetyc','SDT_Invis_backpack','SDT_Invis_Heavy_backpack','SDT_Invis_medic_backpack'
	];
	
	// Mini Radios
	_radiosMini =
	[
		// Legion Base - Stable
		'SWLB_clone_RTO_mini_backpack','SWLB_CEE_Recon_RTO_Backpack','SWLB_clone_RTO_mini_backpack_night',
		
		// Just Like The Simulations - The Great War
		'JLTS_Clone_LR_attachment','JLTS_Clone_RTO_pack','JLTS_Clone_RTO_pack_41_Gree',
	];
	
	// Radio Packs
	_radioPacks =
	[
		// Legion Base - Stable
		'SWLB_clone_arc_backpack','SWLB_clone_backpack_RTO','SWLB_clone_commando_backpack_k2_rto','SWLB_DeltaBoss_backpack','SWLB_OmegaNiner_backpack','ls_gar_survivalRadio_backpack','ls_gar_mediumRadio_backpack','ls_gar_radio_backpack','ls_orsf_trooperLR_backpack',
		
		// Just Like The Simulations - The Great War
		'JLTS_Clone_ARC_backpack','JLTS_Clone_backpack_RTO','JLTS_Clone_backpack_rto_DC','JLTS_Clone_backpack_s_RTO',
		
		// 717th Auxiliary Assets
		'717th_Commando_Backpack_Night','717th_Commando_Backpack_Recon','Lava_Commando_Backpack','Poly_LR_Backpack',
		
		// Schlabbies Depressed Textures
		'SDT_bp_ARC_Nox','SDT_gd_RTO_backpack','SDT_bp_Araniik','SDT_Invis_RTO_backpack',
		
		// 3AS (Beta Test)
		'3AS_B_Katarn_Backpack','3AS_B_Katarn_Backpack_Boss','3AS_B_Katarn_Backpack_Fixer','3AS_B_Katarn_Backpack_Gregor','3AS_B_Katarn_Backpack_Omega','3AS_B_Katarn_Backpack_Scorch','3AS_B_Katarn_Backpack_Sev'
	];
	
	// Respirators
	_respirators =
	[
		// Schlabbies Depressed Textures
		'SDT_backpack_hazard','SDT_backpack_hazard_EOD','SDT_backpack_hazard_heavy','SDT_backpack_hazard_medic','SDT_backpack_hazard_RTO','SDT_backpack_Scuba'
	];
	
	// Parachutes
	_parachutes =
	[
		// Base Arma 3
		'B_Parachute',
		
		// Legion Base - Stable
		'ls_gar_glidepackClosed_backpack','ls_gar_glidepackClosedLR_backpack','ls_greenfor_journeymanJetpack_backpack','ls_greenfor_jt12_backpack','ls_greenfor_jt12Small_backpack',
		
		// Just Like The Simulations - The Great War
		'JLTS_Clone_jumppack_mc','JLTS_Clone_jumppack_Chicken','JLTS_Clone_jumppack_chicken_501','JLTS_Clone_jumppack_chicken_black','JLTS_Clone_jumppack_chicken_DC','JLTS_Clone_jumppack_JT12','JLTS_Clone_jumppack_JT12_104',
		'JLTS_Clone_jumppack_JT12_501','JLTS_Clone_jumppack_JT12_black','JLTS_Clone_jumppack_JT12_DC','JLTS_Clone_jumppack','JLTS_Clone_jumppack_DC',
		
		// 717th Auxiliary Assets
		'Poly_ThrustPack',
		
		// Schlabbies Depressed Textures
		'SDT_GD_JT12_EOD','SDT_GD_JT12_Heavy','SDT_GD_JT12','SDT_GD_JT12_medic','SDT_GD_JT12_RTO','SDT_JT12','SDT_JT12_EOD','SDT_JT12_Heavy','SDT_JT12_medic','SDT_JT12_RTO','SDT_Z6JP_EOD','SDT_Z6JP_Heavy','SDT_Z6JP','SDT_Z6JP_Medic','SDT_Z6JP_RTO',
		
		// 3AS (Beta Test)
		'3as_JT12'
	];
	
	// Static Machine Guns
	_staticMachineGuns =
	[
		// Just Like The Simulations - The Great War
		'JLTS_UST_turret_GAR_backpack'
	];
	
	// Mortars
	_mortars =
	[
		// Legion Base - Stable
		'ls_gar_mortar_backpack',
		
		// 3AS (Beta Test)
		'3AS_Republic_Mortar_Bag'
	];
	
	// Bipods and Tripods
	_bipodsAndTripods =
	[
		'',''
	];
	
	// UAVs
	_uavs = 
	[
		// Just Like The Simulataions - The Great War
		'JLTS_UAV_prowler_gar_backpack',
		
		// 717th Auxiliary Assets
		'Poly_PoliceDrone_backpack'
	];
	
	// Deployable Cover
	_deployableCover =
	[
		// Just Like The Simulataions - The Great War
		'JLTS_portable_shield_gar_backpack'
	];
	
//==========
//HEAD GEAR:
//==========

	// Combat Helmets
	_combatHelmets =
	[
		// Legion Base - Stable
		'ls_mandalorian_saxonGrunt_helmet','ls_mandalorian_saxonSergeant_helmet','SWLB_clone_holo_P15_helmet','SWLB_cloneP15_helmet','SWLB_clone_501stEcho_helmet','SWLB_clone_501stFives_helmet','SWLB_CEE_Rancor_Blitz_Helmet','SWLB_CEE_Rancor_Colt_Helmet','SWLB_clone_eng_helmet',
		'SWLB_CEE_Hazard_Helmet','SWLB_clone_AB_helmet','SWLB_clone_212thAB_helmet','SWLB_clone_212thEngineer_helmet','SWLB_clone_P1_2_helmet','SWLB_CEE_Rex_Helmet','SWLB_Clone_P1_helmet','SWLB_CEE_187th_Trooper_Helmet','SWLB_CEE_212th_Trooper_Helmet','SWLB_CEE_21st_Trooper_Helmet',
		'SWLB_CEE_327th_Trooper_Helmet','SWLB_CEE_41st_Draa_Helmet','SWLB_CEE_41st_Gree_Helmet','SWLB_CEE_41st_Trooper_Helmet','SWLB_CEE_442nd_Trooper_Helmet','SWLB_CEE_74th_Trooper_Helmet','SWLB_CEE_91st_Trooper_Helmet','SWLB_clone_P1Captain_helmet','SWLB_CEE_CG_Fox_Helmet',
		'SWLB_CEE_CG_NCO_Helmet','SWLB_CEE_CG_Stone_Helmet','SWLB_CEE_CG_Trooper_Helmet','SWLB_clone_P1Commander_helmet','SWLB_clone_P1_Lieutenant_helmet','SWLB_clone_P1Sergeant_helmet','SWLB_clone_P2_helmet','SWLB_CEE_Doom_Helmet','SWLB_clone_101stTrooper_helmet',
		'SWLB_clone_104thBoost_helmet','SWLB_clone_104thComet_helmet','SWLB_clone_104thSinker_helmet','SWLB_clone_104thTrooper_helmet','SWLB_CEE_13thIron_Battalion_Clone_Trooper_Helmet','SWLB_clone_187thOfficer_helmet','SWLB_clone_187thTrooper_helmet','SWLB_clone_212thBoil_helmet',
		'SWLB_clone_212thWaxer_helmet','SWLB_CEE_Cody_Helmet','SWLB_clone_212thTrooper_helmet','SWLB_clone_21stOfficer_helmet','SWLB_clone_21stTrooper_helmet','SWLB_CEE_Bly_Helmet','SWLB_clone_327thTrooper_helmet','SWLB_clone_332ndTrooper_helmet','SWLB_CEE_34th_Clone_Assassin_Helmet',
		'SWLB_clone_41st_GCGree_helmet','SWLB_clone_41st_GCTrooper_helmet','SWLB_clone_442ndTrooper_helmet','SWLB_clone_501stDogma_helmet','SWLB_clone_501st_Hardcase_helmet','SWLB_clone_501stJesse_helmet','SWLB_clone_501stKix_helmet','SWLB_clone_501stTup_helmet',
		'SWLB_clone_501stTrooper_helmet','SWLB_clone_5thMedic_helmet','SWLB_clone_5thNCO_helmet','SWLB_clone_5thOfficer_helmet','SWLB_clone_5thTrooper_helmet','SWLB_CEE_Ganch_Helmet','SWLB_CEE_612th_Helmet','SWLB_clone_74thTrooper_helmet','SWLB_clone_91stTrooper_helmet',
		'SWLB_clone_CGFox_helmet','SWLB_clone_CGThorn_helmet','SWLB_clone_CGTrooper_helmet','SWLB_cloneP2_eod_helmet','SWLB_clone_HCLock_helmet','SWLB_clone_HCTrooper_helmet','SWLB_CEE_Deviss_Helmet','SWLB_CEE_Kcompany_helmet','lsd_gar_airborne_helmet','ls_gar_arc_helmet',
		'ls_gar_atrtDriver_helmet','ls_gar_barc_helmet','ls_gar_barcHologram_helmet','lsd_gar_barcm2_helmet','ls_gar_cadet_helmet','ls_sob_crosshair_helmet','ls_sob_hunter_helmet','ls_sob_tech_helmet','ls_sob_wrecker_helmet','ls_gar_desert_helmet','ls_gar_desertHologram_helmet',
		'ls_gar_engineer_helmet','ls_gar_phase2Insulated_helmet','ls_gar_GalacticMarine_helmet','ls_gar_phase1_helmet','ls_gar_phase2_helmet','lsd_gar_phase2_helmet','lsd_csf_commandoGuardsman_helmet','lsd_csf_commandoCaptain_helmet','lsd_csf_commandoLt_helmet',
		'SWLB_CEE_Senate_Commando_Trooper_Helmet','lsd_csf_senateGuard_helmet',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneHelmetAB','JLTS_CloneHelmetAB_187','JLTS_CloneHelmetAB_212','JLTS_CloneHelmetAB_501','JLTS_CloneHelmetAB_Purge','JLTS_CloneHelmetP2MC','JLTS_CloneHelmetP2MC_212_Cody','JLTS_CloneHelmetARC','JLTS_CloneHelmetP2','JLTS_CloneHelmetP2_104','JLTS_CloneHelmetP2_187',
		'JLTS_CloneHelmetP2_212','JLTS_CloneHelmetP2_327_Bly','JLTS_CloneHelmetP2_327','JLTS_CloneHelmetP2_332_Vaughn','JLTS_CloneHelmetP2_332','JLTS_CloneHelmetP2_41_Gree','JLTS_CloneHelmetP2_442','JLTS_CloneHelmetP2_501_Rex','JLTS_CloneHelmetP2_501','JLTS_CloneHelmetP2_5',
		'JLTS_CloneHelmetP2_91','JLTS_CloneHelmetP2_ARC_Blitz','JLTS_CloneHelmetP2_501_Fives','JLTS_CloneHelmetP2_ARC_Hammer','JLTS_CloneHelmetP2_501_Jesse','JLTS_CloneHelmetP2_ARC_Predator','JLTS_CloneHelmetP2_Captain','JLTS_CloneHelmetP2_CG_Fox','JLTS_CloneHelmetP2_CG_Thorn',
		'JLTS_CloneHelmetP2_CG','JLTS_CloneHelmetP2_Commander','JLTS_CloneHelmetP2_DC_Doom','JLTS_CloneHelmetP2_DC','JLTS_CloneHelmetP2_HC_Lock','JLTS_CloneHelmetP2_Lieutenant','JLTS_CloneHelmetP2_bomb','JLTS_CloneHelmetP2_Sergeant','JLTS_CloneHelmetSC_SC','JLTS_CloneHelmet_SCC_SC',
		'JLTS_CloneHelmet_SCC_SC_commander','JLTS_CloneHelmetP2_Fabulous',
		
		// 717th Auxiliary Assets
		'Poly_Base_Triton','Poly_P1_EOD_Helmet','Poly_P1_CPT','Poly_P1_CC','Poly_Base_P1','Poly_P1_LT','Poly_P1_Sgt','Poly_Legacy_HeavyHelmet','Poly_Legacy_JetHelmet','Poly_Legacy_SharpShooterHelmet','HazOp_Helmet','Clone_RTO_Helmet',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_41st_ARC_Helmet','SDT_41st_ARC_Helmet_Camo','SDT_41st_EOD_Helmet','SDT_41st_EOD_Helmet_Camo','SDT_41st_EOD_CS_Helmet','SDT_41st_EOD_CS_Helmet_Camo','SDT_41st_Medic_Helmet','SDT_41st_Medic_Helmet_Camo','SDT_41st_Sergeant_Helmet_Camo','SDT_41st_Trooper_Helmet',
		'SDT_41st_Trooper_Helmet_Camo','SDT_LeVi_Helmet','SDT_DEVNox_helmet','SDT_DEVSchlabbie_P1_helmet','SDT_DEVSchlabbie_helmet','SDT_DEVMaksim_helmetp1','SDT_DEVMaksim_helmetp2','SDT_GD_107_p1_helmet','SDT_GD_107_p1_helmet_worn','SDT_GD_AB_CR_W_helmet','SDT_GD_AB_CR_helmet',
		'SDT_GD_AB_T1_helmet','SDT_GD_AB_T1_W_helmet','SDT_GD_AB_T2_W_helmet','SDT_GD_AB_T2_helmet','SDT_GD_AB_T3_W_helmet','SDT_GD_AB_T3_helmet','SDT_GD_AB_T4_W_helmet','SDT_GD_AB_T4_helmet','SDT_GDCX_hazard_helmet','SDT_GDCX_worn_hazard_helmet','SDT_GD_CX_p1_helmet',
		'SDT_GD_worn_CX_p1_helmet','SDT_GDCC_hazard_helmet','SDT_GDCC_worn_hazard_helmet','SDT_GD_CC_p1_helmet','SDT_GD_worn_CC_p1_helmet','SDT_GD_CC_Scuba_helmet','SDT_GD_CC_W_Scuba_helmet','SDT_GDCP_hazard_helmet','SDT_GDCP_worn_hazard_helmet','SDT_GD_CP_p1_helmet',
		'SDT_GD_worn_CP_p1_helmet','SDT_GD_CP_Scuba_helmet','SDT_GD_CP_W_Scuba_helmet','SDT_GDCT_engineer_helmet','SDT_GDCL_hazard_helmet','SDT_GDCL_worn_hazard_helmet','SDT_GD_CL_p1_helmet','SDT_GD_worn_CL_p1_helmet','SDT_GD_CL_Scuba_helmet','SDT_GD_CL_W_Scuba_helmet',
		'SDT_GD_worn_CR_p1_helmet','SDT_GD_CR_Scuba_helmet','SDT_GD_SCT_p1_helmet','SDT_GD_SCT_worn_p1_helmet','SDT_GD_SCT_Scuba_helmet','SDT_GD_SCT_W_Scuba_helmet','SDT_GDCSM_hazard_helmet','SDT_GDCSM_worn_hazard_helmet','SDT_GD_CSM_p1_helmet','SDT_GD_worn_CSM_p1_helmet',
		'SDT_GD_CSM_Scuba_helmet','SDT_GD_CSM_W_Scuba_helmet','SDT_GDCS_hazard_helmet','SDT_GDCS_worn_hazard_helmet','SDT_GD_CS_p1_helmet','SDT_GD_worn_CS_p1_helmet','SDT_GD_CS_Scuba_helmet','SDT_GD_CS_W_Scuba_helmet','SDT_GD_CT_p1_helmet','SDT_GD_worn_CT_p1_helmet',
		'SDT_GD_CT_Scuba_helmet','SDT_GD_Oak_W_Scuba_helmet','SDT_GD_OAK_Scuba_helmet','SDT_GD_CT_W_Scuba_helmet','SDT_GDSCT_hazard_worn_helmet','SDT_GDSCT_hazard_helmet','SDT_GDCT_hazard_worn_helmet','SDT_GDCT_hazard_helmet','SDT_GD_OAK_p1_helmet','SDT_GD_worn_OAK_p1_helmet',
		'SDT_GDCR_hazard_helmet','SDT_GDCR_worn_hazard_helmet','SDT_LegoKscout_helmet','SDT_Lego212_helmet','SDT_Lego442_helmet','SDT_Lego501_helmet','SDT_LegoATRT_helmet','SDT_LegoCMD_helmet','SDT_LegoG_helmet','SDT_LegoK_helmet','SDT_LegoShock2_helmet','SDT_LegoShock1_helmet',
		'SDT_LegoU_helmet','SDT_Jumperp1_helmet','SDT_Jumperp2_helmet','SDT_CPT_helmet','SDT_Gree_helmet','SDT_CMD_helmet','SDT_krieg_helmet','SDT_stone_helmet','SDT_15_eng_helmet','SDT_LT_helmet','SDT_SGT_helmet','SDT_Hazard_Helmet','SDT_212th_jungle_helmet','SDT_501_Vill_helmet',
		'SDT_41_base_helmet','SDT_desert_helmet','SDT_fordop1_helmet','SDT_forest_helmet','SDT_grass_helmet','SDT_LTp1_helmet','SDT_LTp2_helmet','SDT_naval_helmet','SDT_naval_helmet','SDT_officer_502_helmet','SDT_sand_helmet','SDT_snow_helmet','SDT_urban_helmet','SDT_scuba_Helmet_old',
		'SDT_scuba_Helmet','SDT_TP_helmet',
		
		// 3AS (Beta Test)
		'3as_ATRT_Helmet','3as_Engineer_Helmet','3as_P1_212th','3as_P1_327th','3as_P1_501A','3as_P1_501','3as_P1_91st','3as_P1_EOD_Helmet','3as_P1_CPT','3as_P1_CC','3as_P1_Base','3as_P1_LT','3as_P1_Pilot_helmet','3as_P1_Sgt','3as_Tanker_Helmet','3as_Tanker_Helmet_212',
		'3as_Tanker_Helmet_501','3as_Tanker_Helmet_91','3AS_JLTS_CloneHelmetP2_Ranger'
	];
	
	// Stealth Helmets
	_stealthHelmets =
	[
		// Legion Base - Stable
		'SWLB_clone_BARC_helmet','SWLB_CEE_Wolffe_Helmet','SWLB_CEE_212th_BARC_Helmet','SWLB_CEE_327th_BARC_Helmet','SWLB_CEE_34th_Clone_Assassin_BARC','SWLB_CEE_501st_BARC_Helmet','SWLB_CEE_91st_BARC_Helmet','SWLB_CEE_Fordo_Helmet','SWLB_clone_ARF_p1_helmet','SWLB_CEE_187th_ARF_Helmet',
		'SWLB_CEE_212_ARF_NCO','SWLB_CEE_212_ARF_Trooper','SWLB_CEE_501st_ARF_Trooper','SWLB_CEE_74th_ARF_Helmet','SWLB_CEE_Rancor_ARF_Helmet','SWLB_CEE_Razor_ARF_Helmet','SWLB_CEE_Trauma_ARF_Helmet','SWLB_P1_SpecOps_Helmet','SWLB_P1_SpecOps_212th_Helmet','SWLB_P1_SpecOps_21st_Helmet',
		'SWLB_P1_SpecOps_41st_Helmet','SWLB_P1_SpecOps_501st_Helmet','SWLB_clone_ARF_P2_helmet','SWLB_P2_SpecOps_Helmet','SWLB_P2_SpecOps_212th_Helmet','SWLB_P2_SpecOps_21st_Helmet','SWLB_P2_SpecOps_41st','SWLB_P2_SpecOps_501st_Helmet','SWLB_clone_commando_helmet_k1','SWLB_CEE_Gregor_Helmet',
		'SWLB_AiwhaDikut_Helmet','SWLB_AiwhaSarge_Helmet','SWLB_AiwhaTyto_Helmet','SWLB_AiwhaZag_Helmet','SWLB_Bravo2_Helmet','SWLB_Bravo3_Helmet','SWLB_Bravo4_Helmet','SWLB_BravoRam_Helmet','SWLB_DeltaBoss_Helmet','SWLB_DeltaFixer_Helmet','SWLB_DeltaScorch_helmet','SWLB_DeltaSev_Helmet',
		'SWLB_MPGunner_Helmet','SWLB_CEE_Hodasal_Squad_Jungle_Commando_Helmet','SWLB_MPMarksman_Helmet','SWLB_Omega_Helmet','SWLB_MPRecon_Helmet','SWLB_MPStealth_Helmet','SWLB_YayaxCov_Helmet','SWLB_YayacDev_Helmet','SWLB_YayaxJind_Helmet','SWLB_YayaxYover_Helmet','lsd_sob_commando_helmet',
		'ls_sob_fordo_helmet','ls_gar_phase1Arf_helmet','ls_sob_phase1SpecOp_helmet','ls_gar_phase2ARF_helmet','ls_gar_phase2ArfHologram_helmet','ls_sob_phase2SpecOp_helmet','ls_gar_scout_helmet',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneHelmetBARC','JLTS_CloneHelmetBARC_104_Wolffe','JLTS_CloneHelmetBARC_91','JLTS_CloneHelmetBARC_ARC_Fordo','JLTS_CloneHelmetP2_Shadow',
		
		// 717th Auxiliary Assets
		'717th_CommandoHelmet_NightOps','717th_CommandoHelmet_Recon','717th_CommandoHelmet_Base','717th_CommandoHelmet_UrbanFighter','SpecOps_P1_Helmet','Poly_SpecOps_Helmet','Poly_Trition_SOB', 
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_41st_ARF_Helmet','SDT_Arf_Helmet_Camo','SDT_41st_Scout_Helmet','SDT_41st_Scout_Helmet_Camo','SDT_DEVSchlabbie_commando_helmet_w','SDT_DEVSchlabbie_commando_helmet','SDT_GD_RTO_CO_helmet','SDT_GD_RTO_CO_helmet_worn','SDT_GD_RTO_helmet','SDT_GD_RTO_helmet_worn','SDT_GD_RTO_NCO_helmet',
		'SDT_GD_RTO_NCO_helmet_worn','SDT_GD_DS_helmet','SDT_GD_DS_W_helmet','SDT_geo_arf_helmet','SDT_ATRT_ARF_helmet','SDT_forest_B_502_helmet','SDT_Araniik_helmet','SDT_Aruetyc_helmet','SDT_GD_commando_helmet','SDT_Naast_helmet','SDT_Verd_helmet','SDT_scout_helmet','SDT_strike_helmet',
		'SDT_ShadowARF_helmet','SDT_501_Boomer_helmet','SDT_501_ARF_helmet','SDT_fordoBARC_helmet','SDT_15_Nephi_helmet',
		
		// 3AS (Beta Test)
		'3AS_ARF_Helmet','3AS_H_Katarn_Helmet','3AS_H_Katarn_Helmet_Boss','3AS_H_Katarn_Helmet_Fixer','3AS_H_Katarn_Helmet_Gregor','3AS_H_Katarn_Helmet_Omega','3AS_H_Katarn_Helmet_Scorch','3AS_H_Katarn_Helmet_Sev'
	];
	
	// Non-Combat Helmets
	_nonCombatHelmets =
	[
		'',''
	];
	
	// Pilot Helmets
	_pilotHelmets =
	[
		// Legion Base - Stable
		'SWLB_P1_Pilot_Helmet','SWLB_P1_Pilot_Helmet_501st_Hawk','SWLB_P1_Pilot_Helmet_ATTE','SWLB_P1_Pilot_Helmet_Republic','SWLB_clone_pilot_P2_helmet','SWLB_clone_187thPilot_helmet','SWLB_clone_501stHawk_helmet','ls_gar_phase1Pilot_helmet','ls_gar_pahse2Pilot_helmet',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_41st_Aircrew_Helmet_Camo','SDT_41st_Aircrew_Helmet','SDT_41st_Pilot_Helmet','SDT_41st_Pilot_Helmet_Camo','SDT_GD_Pilot_T2_Helmet','SDT_GD_Pilot_worn_T2_Helmet','SDT_GD_Pilot_T4_Helmet','SDT_GD_Pilot_worn_T4_Helmet','SDT_GD_Pilot_T3_Helmet','SDT_GD_Pilot_worn_T3_Helmet',
		'SDT_GD_Pilot_T1_Helmet','SDT_GD_Pilot_worn_T1_Helmet','SDT_501_Pilot_helmet',
		
		// 3AS (Beta Test)
		'3as_P2_Pilot_helmet','3AS_P2_Pilot_helmet_101st','3AS_P2_Pilot_helmet_212th','3AS_P2_Pilot_helmet_327th','3AS_P2_Pilot_helmet_91st','3AS_P2_Pilot_helmet_Razor','3AS_P2_Pilot_helmet_Republic','3as_P2_Pilot_alt_helmet','3AS_P2_Pilot_helmet_Razor_alt','3AS_P3_Pilot_Helmet_P',
		'3AS_P3_Pilot_Helmet_501st'
	];
	
	// Officer Hats
	_officerHats =
	[
		// 717th Auxiliary Assets
		'717th_DirectorCap','717th_FlightCap','Poly_NavalCap','717th_IntelCap','717th_MedicalCap'
	];
	
//==========
//EQUIPMENT:
//==========

	// NVGs
	_nightVisionGoggles =
	[
		// Legion Base - Stable
		'SWLB_clone_commando_nvg_antenna','SWLB_clone_commando_nvg','SWLB_DeltaFixer_Antenna','SWLB_OmegaAtin_Antenna','SWLB_OmegaFi_Nvg','SWLB_MPStealth_Nvg','SWLB_CEE_Engineer_Comms','SWLB_clone_ccVisor','SWLB_CEE_P1_MC_Visor','ls_mandalorian_rangefinder_nvg',
		'lsd_gar_alphaRangefinder_nvg','lsd_gar_tanker_nvg','lsd_gar_artilleryGunner_nvg','lsd_gar_medicalScanner_nvg','lsd_gar_p1Commander_nvg','lsd_gar_p1SingleHeadlamp_nvg','lsd_gar_p1MarshalCommander_nvg','lsd_gar_p1Standard_nvg','lsd_gar_p1Rangefinder_nvg',
		'lsd_gar_p2Commander_nvg','lsd_gar_p2SingleHeadlamp_nvg','lsd_gar_p2MarshalCommander_nvg','lsd_gar_standard_nvg','lsd_gar_standardSPC_nvg','lsd_gar_rangefinder_nvg','lsd_gar_medicalScannerSPC_nvg','ls_memfor_splinterCell_nvg',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneNVGCC','JLTS_CloneNVGCC_CG','JLTS_CloneNVGCC_DC_Doom','JLTS_CloneNVGCC_HC_Lock','JLTS_CloneNVGCC_KS','JLTS_CloneNVGMC','JLTS_CloneNVGMC_212_Cody','JLTS_CloneNVGMC_332_Vaughn','JLTS_CloneNVG','JLTS_CloneNVG_327_Bly','JLTS_CloneNVG_327',
		'JLTS_CloneNVG_black','JLTS_CloneNVG_DC','JLTS_CloneNVG_KC','JLTS_CloneNVGRange_ARC_Blitz','JLTS_CloneNVGRange_ARC_Hammer','JLTS_CloneNVGRange','JLTS_CloneNVGRange_black','JLTS_CloneNVG_spec','JLTS_CloneNVG_spec_327','JLTS_CloneNVG_spec_black',
		'JLTS_CloneNVG_spec_DC','JLTS_CloneNVG_spec_KC',
		
		// 717th Auxiliary Assets
		'Poly_Headlamps','Poly_MacroBinocular','Poly_RangeFinder','CloneGunner_Attachment',
		
		// Schlabbies Depressed Textures (Legion Base)
		'SDT_LeVi_NVG','SDT_GC_NVG','SDT_GD_NVG_spec','SDT_Clone_NOD','SDT_TechnicalEngineerEquipment',
		
		//Operation TREBUCHET
		'OPTRE_NVGT_C','OPTRE_NVG'
	];
	
	//Binoculars
	_binoculars =
	[
		// Legion Base - Stable
		'SWLB_clone_commander_binocular','SWLB_clone_commander_binocular_night','SWLB_clone_binocular',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneBinocular','JLTS_CloneBinocular_black'
	];
	
	// Assigned Items
	_assignedItemsAll =
	[
		// Maps
		'ItemMap',
		
		// Terminals
		'ItemGPS','I_UavTerminal','O_UavTerminal','B_UavTerminal','I_E_UavTerminal','C_UavTerminal',
		
		// Radios
		'JLTS_clone_comlink','SWLB_comlink','ls_comlink_aur',
		
		// Compasses
		'ItemCompass',
		
		// Watches
		'ItemWatch','ChemicalDetector_01_watch_F'
	];
	
	// other inventory items
	_inventoryAll =
	[
		//Vanilla
		'firstaidkit','medikit','minedetector','toolkit',
		
		//ACE3
		'ACE_RangeTable_82mm','ACE_artilleryTable','ACE_CableTie','ACE_DefusalKit','ACE_EarPlugs','ACE_Tripod','ACE_EntrenchingTool','ACE_M26_Clacker','ACE_Clacker','ACE_Fortify','ACE_Flashlight_XL50','ACE_wirecutter',
		
		//JLTS
		'JLTS_riot_shield_item','JLTS_riot_shield_101_item','JLTS_riot_shield_212_item','JLTS_riot_shield_501_item','JLTS_riot_shield_CG_item','JLTS_riot_shield_GD_item','JLTS_ids_gar_army','JLTS_repairkit_weapon_mini','JLTS_repairkit_weapon'
	];
	
//=========================================== GET [BLACKLIST + WHITELIST] FOR PLAYER ROLE

// Undefined role (not used, kept here as an example/template).
if (_role isEqualTo '') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _allGrenades + _allExplosives),																							// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes + _staticMachineGuns + _bipodsAndTripods + _deployableCover + _mortars),	// whitelisted BACKPACKS
			(_weaponsAll)																																// whitelisted WEAPONS
		]
	]
};
// Rifleman role
if (_role isEqualTo 'rifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes),																			// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _uglBlasters + _largeBlasters + _slugThrowers + _binoculars)										// whitelisted WEAPONS
		]
	]
};
// Autorifleman role
if (_role isEqualTo 'autorifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _strapsHarnessesBandoliers + _rebreathers),													// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _shieldGrenades + _regularExplosives),																	// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes + _deployableCover),														// whitelisted BACKPACKS
			(_blasterPistols + _assaultBlasters + _rapidBlasters + _binoculars)																			// whitelisted WEAPONS
		]
	]
};
// Machine Gunner role
if (_role isEqualTo 'machine_gunner') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _strapsHarnessesBandoliers + _rebreathers),													// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted FACEWEAR
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives +_shieldGrenades),																	// whitelisted MAGAZINES
			(_packs + _staticMachineGuns + _bipodsAndTripods + _parachutes + _deployableCover),															// whitelisted BACKPACKS
			(_blasterPistols + _assaultBlasters + _rapidBlasters + _binoculars)																			// whitelisted WEAPONS
		]
	]
};
// Light Anti-Tank role
if (_role isEqualTo 'rifleman_lat') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _strapsHarnessesBandoliers + _rebreathers),													// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _parachutes),																							// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _largeBlasters + _unguidedLaunchers + _slugThrowers + _binoculars)					// whitelisted WEAPONS
		]
	]
};
// Heavy Anti Tank role
if (_role isEqualTo 'rifleman_hat') exitWith {
	[
		[	// ITEMS
			[
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _strapsHarnessesBandoliers + _rebreathers),													// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _parachutes),																							// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _largeBlasters + _guidedLaunchers + _slugThrowers + _binoculars)						// whitelisted WEAPONS
		]
	]
};
// Medic role
if (_role isEqualTo 'medic') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades),																											// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes + _deployableCover),														// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters +_assaultBlasters + _largeBlasters + _slugThrowers + _binoculars)											// whitelisted WEAPONS
		]
	]
};
// Engineer role
if (_role isEqualTo 'engineer') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives + _specialExplosives),																// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes + _deployableCover),														// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters +_assaultBlasters + _largeBlasters + _disposableLaunchers + _slugThrowers + _binoculars)					// whitelisted WEAPONS
		]
	]
};
// Mortar Gunner role
if (_role isEqualTo 'mortar_gunner') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives + _shieldGrenades),																	// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini	+ _bipodsAndTripods + _mortars + _parachutes),															// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters +_assaultBlasters + _largeBlasters + _slugThrowers + _disposableLaunchers + _binoculars)					// whitelisted WEAPONS
		]
	]
};
// Sniper role
if (_role isEqualTo 'sniper') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_armourSets),																															// whitelisted UNIFORMS
				(_lightCombatVests + _crewVests + _strapsHarnessesBandoliers),																			// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets),																					// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini+ _respirators + _parachutes),																			// whitelisted BACKPACKS
			(_blasterPistols + _largeBlasters + _sniperBlasters + _binoculars)																			// whitelisted WEAPONS
		]
	]
};
if (_role isEqualTo 'crewman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radiosMini + _respirators + _parachutes),																						// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _slugThrowers + _binoculars)															// whitelisted WEAPONS
		]
	]
};
// JTAC role
if (_role isEqualTo 'jtac') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes),																			// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _largeBlasters + _slugThrowers + _binoculars)										// whitelisted WEAPONS
		]
	]
};
// Pilot role
if (_role in ['pilot','pilot_plane','pilot_cas','pilot_heli']) exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_armourSets + _coverAlls),																												// whitelisted UNIFORMS
				(_lightCombatVests + _crewVests + _strapsHarnessesBandoliers),																			// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_pilotHelmets),																														// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives + _shieldGrenades + _specialExplosives),												// whitelisted MAGAZINES
			(_radiosMini + _parachutes),																												// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _slugThrowers + _binoculars)																			// whitelisted WEAPONS
		]
	]
};
// Officer/Commander role
if (_role isEqualTo 'commander') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes),																			// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _largeBlasters + _slugThrowers + _binoculars)										// whitelisted WEAPONS
		]
	]
};
// Squad leader/Team leader role
if (_role in ['leader']) exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes),																			// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _largeBlasters + _slugThrowers + _binoculars)										// whitelisted WEAPONS
		]
	]
};
// UAV Operator role
if (_role isEqualTo 'uav') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _regularGrenades + _regularExplosives),																					// whitelisted MAGAZINES
			(_packs + _radioPacks + _radiosMini + _respirators + _parachutes + _uavs),																	// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _largeBlasters + _slugThrowers  + _binoculars)										// whitelisted WEAPONS
		]
	]
};
if (_role isEqualTo 'o_rifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _crewVests + _strapsHarnessesBandoliers + _rebreathers),										// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _allGrenades +_allExplosives),																								// whitelisted MAGAZINES
			(_packs + _radioPacks + _respirators + _parachutes),																						// whitelisted BACKPACKS
			(_blasterPistols + _shortBlasters + _assaultBlasters + _largeBlasters + _slugThrowers + _binoculars)										// whitelisted WEAPONS
		]
	]
};
if (_role isEqualTo 'o_autorifleman') exitWith {
	[
		[	// -------------------------------------------------------------- BLACKLIST
			[	// ITEMS
				[	// blacklisted uniforms
				],
				
				[	// blacklisted vests
				],
				
				[	// blacklisted inventory
				],
				
				[	// blacklisted assigned items
					'b_uavterminal'
				],
				
				[	// blacklisted Headgear
				],
				
				[	// blacklisted goggles
				],
				
				[	// blacklisted attachments
				]
			],
			
			[	// blacklisted MAGAZINES
			],
			
			[	// blacklisted BACKPACKS
			],
			
			[	// blacklisted WEAPONS
			]
		],
		
		[	// -------------------------------------------------------------- WHITELIST
			[	// ITEMS
				(_officerUniforms + _armourSets + _coverAlls),																							// whitelisted UNIFORMS
				(_heavyCombatVests + _lightCombatVests + _strapsHarnessesBandoliers + _rebreathers),													// whitelisted VESTS
				(_inventoryAll),																														// whitelisted INVENTORY
				(_assignedItemsAll + _nightVisionGoggles),																								// whitelisted ASSIGNED ITEMS and NVGs
				(_combatHelmets + _stealthHelmets + _nonCombatHelmets + _officerHats),																	// whitelisted HEADGEAR
				(_helmetWear + _clothWear + _masks)																										// whitelisted GOGGLES
			],
			
			(_allMagazines + _allGrenades +_allExplosives),																								// whitelisted MAGAZINES
			(_packs + _radioPacks + _respirators + _parachutes + _deployableCover),																		// whitelisted BACKPACKS
			(_blasterPistols + _assaultBlasters + _rapidBlasters)																						// whitelisted WEAPONS
		]
	]
};
// Default
([WEST,'rifleman'] call (missionNamespace getVariable 'QS_data_arsenal'))