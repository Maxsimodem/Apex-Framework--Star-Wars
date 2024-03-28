/*/
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
_______________________________________________________/*/

//=========================================== GET PLAYER ROLE

params [
	['_side',WEST],
	['_role','rifleman']
];

//=========================================== At this point you could build up lists of weapons like "normalguns + marksmanguns + sniperguns + LMGguns + HMGguns" and use those variables instead of the default copy-paste used below.
// These variables are just suggestions, you would add them together like this:   (_weaponsBasic + _weaponsMarksman + _weaponsHandgun)
// All weapons including pistols, launchers, binoculars (yes they are classified as a weapon).

//=================
//EXAMPLE CATEGORY:
//=================

	// List Template
	_exampleSubCategory =
	[
		'',''
	];

//===================
//General Categories:
//===================

	//All weapons
	_weaponsAll = 
	[
		//LS
		'ls_weapon_westar35sa_secondary','ls_weapon_westar_35c_primary','ls_weapon_westar_35s_primary',
		
		//JLTS
		'JLTS_DC17SA','JLTS_RG4D','JLTS_DC15S','JLTS_E5','JLTS_Z6','JLTS_E5C','JLTS_E5C_stock','JLTS_EPL2','JLTS_DC15A_ugl_plastic','JLTS_DC15A_ugl','JLTS_DC15A_plastic','JLTS_DC15A','JLTS_DC15X','JLTS_E5S','JLTS_DW32S',
		'JLTS_DP23','JLTS_SBB3','JLTS_RPS6','JLTS_E60R_AT','JLTS_PLX1_AT',
		
		//3AS
		'3AS_pistol_DC15SA_F','3AS_DC15L_F','3AS_Chaingun','3AS_DC15C_F','3AS_DC15C_GL','3AS_DC17M_F','3AS_WestarM5_F','3AS_WestarM5_GL','3AS_Valken38X_F','3AS_RPS6_F','3AS_RPS6_G'
	];

	//All attachments
	_attachmentsAll = 
	[
		//LS
		'SWLW_Westar35S_scope',
		
		//JLTS
		'JLTS_DC15X_scope',
		
		//3AS
		'3AS_optic_reflec_DC15C','3AS_optic_holo_DC15S','3AS_Optic_LE_Scope_DC15A','3AS_Optic_VK38X','3AS_Optic_Scope_WestarM5','3AS_bipod_vk38x_f'
	];
	
	//All magazines
	_magazinesAll = 
	[
		//LS
		'SWLW_westar35Sa_Mag','SWLW_westar35c_Mag','SWLW_Westar35S_Mag','SWLW_Westar35S_scatter_Mag',
		
		//JLTS
		'JLTS_DC17SA_mag','JLTS_RG4D_mag','JLTS_E5_mag','JLTS_DC15S_mag','JLTS_Z6_mag','JLTS_E5C_mag','JLTS_DC15A_mag','JLTS_DW32S_mag','JLTS_E5S_mag','JLTS_DP23_mag','JLTS_SBB3_mag','JLTS_RPS6_HE_mag','JLTS_RPS6_mag',
		'JLTS_PLX1_AP_mag','JLTS_PLX1_AT_mag','JLTS_E60R_AP_mag','JLTS_E60R_AT_mag','JLTS_stun_mag_long','JLTS_stun_mag_short','JLTS_EPL2_mag',
		
		//3AS
		'3AS_15Rnd_EC30_mag','3AS_15Rnd_EM30_mag','3AS_60Rnd_EM50_RedPlasma','3AS_200Rnd_EC40_Mag','3AS_200Rnd_EM40_Mag','3AS_Chaingun_Drum_Mag','3AS_100Rnd_EC40_mag','3AS_100Rnd_EM40_mag','3AS_40Rnd_EC40_Mag',
		'3AS_40Rnd_EM40_Mag','3AS_60Rnd_EC50_Mag','3AS_10Rnd_EC80_Mag','3AS_5Rnd_EC80_mag','3AS_10Rnd_EC80_Mag','3AS_MK41_AT','3AS_MK42_HE','3AS_AntiArmour_mag','3AS_6Rnd_HE_Grenade_shell'
	];

	//All grenades
	_grenadesAll = 
	[
		//Base Arma3
		'Chemlight_blue','Chemlight_green','Chemlight_red','Chemlight_yellow','SmokeShellBlue','SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellYellow','SmokeShell',
		
		//JLTS
		'JLTS_grenade_emp_mag',
		
		//3AS
		'ShieldGrenade_Mag','SquadShieldMagazine'
	];

	//All explosives
	_explosivesAll = [
		//Base Arma3
		'DemoCharge_Remote_Mag','SatchelCharge_Remote_Mag',
		
		//Legion Base
		'ls_mag_detPack_remoteCharge','ls_mag_demo_remoteCharge','ls_mag_breach_remoteCharge','ls_mag_caltrops_dispenser',

		//JLTS
		'JLTS_explosive_emp_10_mag','JLTS_explosive_emp_20_mag','JLTS_explosive_emp_50_mag',
		
		//3AS
		'3AS_DetPack','EC01_RemoteMagazine','RTX_RemoteMagazine','HX_AT_Mine_Mag',
		
		//Operation TREBUCHET
		'M168_Remote_Mag'
	];
	
//========
//WEAPONS:
//========

	//Blaster Pistols
	_pistolsPlasma =
	[
		//LS
		'ls_weapon_westar35sa_secondary',
		
		//JLTS
		'JLTS_DC17SA','JLTS_RG4D',
		
		//3AS
		'3AS_pistol_DC15SA_F'
	];
	
	//Blaster Carbines
	_carbinesPlasma =
	[
		//JLTS
		'JLTS_DC15S','JLTS_E5'
	];
	
	//Blaster Rifles
	_riflesPlasma =
	[
		//JLTS
		'JLTS_DC15A_plastic','JLTS_DC15A'
	];
	
	//Repeating Blasters
	_blastersSquadAutomatic =
	[
		//JLTS
		'JLTS_Z6','JLTS_E5C','JLTS_E5C_stock',
		
		//3AS
		'3AS_DC15L_F','3AS_Chaingun'
	];
	
	//Assault Blasters
	_blastersAssault =
	[
		//LS
		'ls_weapon_westar_35c_primary','ls_weapon_westar_35s_primary',
		
		//3AS
		'3AS_DC15C_F','3AS_DC17M_F','3AS_WestarM5_F'
	];
	
	//Underbarrel Grenade Blasters
	_blastersUGL =
	[
		//JLTS
		'JLTS_DC15A_ugl_plastic','JLTS_DC15A_ugl',
		
		//3AS
		'3AS_DC15C_GL','3AS_WestarM5_GL'
	];
	
	//Grenade Launchers
	_launchersGrenade =
	[
		//JLTS
		'JLTS_EPL2'
	];
	
	//Sniper Blasters
	_blastersSniper =
	[
		//JLTS
		'JLTS_DC15X','JLTS_E5S','JLTS_DW32S',
		
		//3AS
		'3AS_Valken38X_F'
	];
	
	//Scatter Blasters
	_blastersScatter =
	[
		//JLTS
		'JLTS_DP23','JLTS_SBB3'
	];
	
	//Disposable Launchers
	_launchersDisposable =
	[
		//3AS
		'3AS_RPS6_F'
	];
	
	//Unguided Launchers
	_launchersUnguided =
	[
		//JLTS
		'JLTS_RPS6'
	];
	
	//Guided Launchers
	_launchersGuided =
	[
		//JLTS
		'JLTS_E60R_AT','JLTS_PLX1_AT',
		
		//3AS
		'3AS_RPS6_G'
	];
	
//===================
//WEAPON ATTACHMENTS:
//===================

	// List Template
	_attachmentsSniper =
	[	
		//JLTS
		'JLTS_DC15X_scope',
		
		//3AS
		'3AS_Optic_VK38X','3AS_bipod_vk38x_f'
	];
	
	// List Template
	_attachmentsRifle =
	[
		//3AS
		'3AS_optic_reflec_DC15C','3AS_optic_holo_DC15S','3AS_Optic_LE_Scope_DC15A','3AS_Optic_Scope_WestarM5'
	];

//==========
//MAGAZINES:
//==========

	//Pisol Magazines
	_magazinesPistol =
	[
		//LS
		'SWLW_westar35Sa_Mag',
		
		//JLTS
		'JLTS_DC17SA_mag','JLTS_RG4D_mag',
		
		//3AS
		'3AS_15Rnd_EC30_mag','3AS_15Rnd_EM30_mag'
	];
	
	//Carbine Magazines
	_magazinesCarbine =
	[
		//JLTS
		'JLTS_E5_mag','JLTS_DC15S_mag'
	];
	
	//Blaster Rifles
	_magazinesRifle =
	[
		//JLTS
		'JLTS_DC15A_mag'
	];
	
	//Repeating Blasters
	_magazinesRepeater =
	[
		//JLTS
		'JLTS_Z6_mag','JLTS_E5C_mag',
		
		//3AS
		'3AS_200Rnd_EC40_Mag','3AS_200Rnd_EM40_Mag','3AS_Chaingun_Drum_Mag'
	];
	
	//Assault Blasters
	_magazinesAssault =
	[
		//LS
		'SWLW_westar35c_Mag','SWLW_Westar35S_Mag','SWLW_Westar35S_scatter_Mag',
		
		//3AS
		'3AS_100Rnd_EC40_mag','3AS_100Rnd_EM40_mag','3AS_40Rnd_EC40_Mag','3AS_40Rnd_EM40_Mag','3AS_60Rnd_EC50_Mag','3AS_60Rnd_EM50_RedPlasma'
	];
	
	//Underbarrel Grenade Blasters
	_magazinesUGL =
	[
		//Base Arma3
		'1Rnd_HE_Grenade_shell','3Rnd_HE_Grenade_shell','1Rnd_Smoke_Grenade_shell','3Rnd_HE_Grenade_shell','UGL_FlareWhite_F','UGL_FlareRed_F','3Rnd_UGL_FlareWhite_F','3Rnd_UGL_FlareRed_F',
		
		//JLTS
		'JLTS_DC15A_mag',
		
		//3AS
		'3AS_40Rnd_EC40_Mag','3AS_40Rnd_EM40_Mag','3AS_60Rnd_EC50_Mag','3AS_60Rnd_EM50_RedPlasma','3AS_6Rnd_HE_Grenade_shell'
	];
	
	//Grenade Launchers
	_magazinesGrenade =
	[
		//JLTS
		'JLTS_EPL2_mag'
	];
	
	//Sniper Blasters
	_magazinesSniper =
	[
		//JLTS
		'JLTS_DC15X_mag','JLTS_DW32S_mag','JLTS_E5S_mag',
		
		//3AS
		'3AS_5Rnd_EC80_mag','3AS_10Rnd_EC80_Mag'
	];
	
	//Scatter Blasters
	_magazinesScatter =
	[
		//JLTS
		'JLTS_DP23','JLTS_SBB3'
	];
	
	//Stuns
	_magazinesStun =
	[
		//JLTS
		'JLTS_stun_mag_long','JLTS_stun_mag_short'
	];
	
	//Anti-Tank Rifle Magazines
	_magazinesAntiTank =
	[
		'3AS_AntiArmour_mag'
	];
	
	//Unguided Launchers
	_rocketsUnguided =
	[
		//JLTS
		'JLTS_RPS6_HE_mag','JLTS_RPS6_mag'
	];
	
	//Guided Launchers
	_rocketsGuided =
	[
		//JLTS
		'JLTS_PLX1_AP_mag','JLTS_PLX1_AT_mag','JLTS_E60R_AP_mag','JLTS_E60R_AT_mag'
	];

//=========
//GRENADES:
//=========

	//Chemlights
	_grenadesChemlights =
	[
		//Base Arma3
		'Chemlight_blue','Chemlight_green','Chemlight_red','Chemlight_yellow'
	];
	
	//Smoke Grenades
	_grenadesSmoke =
	[
		//Base Arma3
		'SmokeShellBlue','SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellYellow','SmokeShell'
	];
	
	//Offensive Grenades
	_grenadesOffensive =
	[
		//JLTS
		'JLTS_grenade_emp_mag',
		
		//3AS
		'3AS_ThermalDetonator'
	];
	
	//Sheild Grenades
	_grenadesShield =
	[
		//3AS
		'ShieldGrenade_Mag','SquadShieldMagazine'
	];

//===========
//EXPLOSIVES:
//===========

	//Infantry Explosives
	_explosivesInfantry =
	[
		//Base Arma3
		'DemoCharge_Remote_Mag',
		
		//LS
		'ls_mag_detPack_remoteCharge','ls_mag_demo_remoteCharge',
		
		//JLTS
		'JLTS_explosive_emp_10_mag','JLTS_explosive_emp_20_mag','JLTS_explosive_emp_50_mag',
		
		//3AS
		'3AS_DetPack','EC01_RemoteMagazine','RTX_RemoteMagazine'
	];
	
	//Engineer Explosives
	_explosivesEngineer =
	[
		//Base Arma3
		'SatchelCharge_Remote_Mag',
		
		//LS
		'ls_mag_breach_remoteCharge','ls_mag_caltrops_dispenser',
		
		//3AS
		'HX_AT_Mine_Mag',
		
		//Operation TREBUCHET
		'M168_Remote_Mag'
	];

//=================
//UNIFORM ELEMENTS:
//=================

	//All Uniforms
	_uniformsAll =
	[
		//LS
		'lsd_gar_republicCommando_hud','lsd_gar_p1Interior_hud','SWLB_CEE_Clone_Hood','SWLB_CEE_Clone_Scarf','SWLB_CEE_Clone_Scarf_Blue','SWLB_CEE_Clone_Scarf_Green','SWLB_CEE_Clone_Scarf_Orange','SWLB_CEE_Scarf_Red',
		'SWLB_CEE_Clone_Scarf_Stewart','SWLB_CEE_Clone_Scarf_White','ls_misc_poncho_facewear','ls_misc_poncho_partnerBlack_facewear','ls_misc_poncho_partnerWhite_facewear','ls_misc_poncho_peaceBlue_facewear',
		'ls_misc_poncho_peaceGrean_facewear','ls_misc_poncho_peaceRed_facewear','ls_misc_poncho_sideStripeBlue_facewear','ls_misc_poncho_sideStripeBrown_facewear','ls_misc_poncho_sideStripeRed_faceweat',
		'ls_misc_poncho_sideStripeWhite_facewear',
		
		//JLTS
		'JLTS_Clone_helmetInterior_AB','JLTS_Clone_helmetInterior_P2','JLTS_CloneArmorMC','JLTS_CloneArmorMC_104_Wolffe','JLTS_CloneArmorMC_212_Cody','JLTS_CloneArmorMC_501_Vaughn','JLTS_CloneArmorMC_CG_Thorn',
		'JLTS_CloneArmor_DC_Doom','JLTS_CloneArmorMC_HC_Lock','JLTS_CloneArmorMC_KS_commander','JLTS_CloneArmor','JLTS_CloneArmor_104','JLTS_CloneArmor_187_airborne','JLTS_CloneArmor_187','JLTS_CloneArmor_212_airborne',
		'JLTS_CloneArmor_212','JLTS_CloneArmor_327_Bly','JLTS_CloneArmor_327','JLTS_CloneArmor_41','JLTS_CloneArmor_442','JLTS_CloneArmor_501_airborne','JLTS_CloneArmor_501_Appo','JLTS_CloneArmor_501_Rex',
		'JLTS_CloneArmor_501_Vill','JLTS_CloneArmor_501','JLTS_CloneArmor_5','JLTS_CloneArmor_91','JLTS_CloneArmor_ARC_Blitz','JLTS_CloneArmor_501_Fives','JLTS_CloneArmor_ARC_Fordo','JLTS_CloneArmor_ARC_Hammer',
		'JLTS_CloneArmor_501_Jesse','JLTS_CloneArmor_ARC_Predator','JLTS_CloneArmor_CG_Fox','JLTS_CloneArmor_CG_Thire','JLTS_CloneArmor_CG','JLTS_CloneArmor_Commander','JLTS_CloneArmor_DC','JLTS_CloneArmor_HC',
		'JLTS_CloneArmor_KC','JLTS_CloneArmor_KS','JLTS_CloneArmor_Lieutenant','JLTS_CloneArmor_bomb','JLTS_CloneArmor_Purge','JLTS_CloneArmor_Sergeant','JLTS_CloneArmor_Shadow','JLTS_CloneArmorGrenadier',
		'JLTS_CloneArmorGrenadier_104','JLTS_CloneArmorGrenadier_187','JLTS_CloneArmorGrenadier_212','JLTS_CloneArmorGrenadier_41','JLTS_CloneArmorGrenadier_442','JLTS_CloneArmorGrenadier_501','JLTS_CloneArmorGrenadier_5',
		'JLTS_CloneArmorGrenadier_91','JLTS_CloneArmorGrenadier_CG','JLTS_CloneArmorGrenadier_DC','JLTS_CloneArmorGrenadier_HC','JLTS_CloneArmorGrenadier_KS','JLTS_CloneArmorGrenadier_Purge','JLTS_CloneArmorGrenadier_Shadow',
		'JLTS_CloneArmorRecon','JLTS_CloneArmorRecon_91','JLTS_CloneArmorSupport','JLTS_CloneArmorSupport_104','JLTS_CloneArmorSupport_187','JLTS_CloneArmorSupport_212','JLTS_CloneArmorSupport_327',
		'JLTS_CloneArmorSupport_41_Gree','JLTS_CloneArmorSupport_41','JLTS_CloneArmorSupport_442','JLTS_CloneArmorSupport_501','JLTS_CloneArmorSupport_5','JLTS_CloneArmorSupport_91','JLTS_CloneArmorSupport_CG',
		'JLTS_CloneArmorSupport_DC','JLTS_CloneArmorSupport_HC','JLTS_CloneArmorSupport_KS','JLTS_CloneArmorSupport_Shadow','JLTS_CloneArmor_SC','JLTS_CloneArmor_SC_commander','JLTS_CloneArmor_SC_medic',
		'JLTS_CloneArmor_104_medic','JLTS_CloneArmor_187_medic','JLTS_CloneArmor_212_medic','JLTS_CloneArmor_327_medic','JLTS_CloneArmor_41_medic','JLTS_CloneArmor_442_medic','JLTS_CloneArmor_501_medic',
		'JLTS_CloneArmor_5_medic','JLTS_CloneArmor_91_medic','JLTS_CloneArmor_CG_medic','JLTS_CloneArmor_DC_medic','JLTS_CloneArmor_HC_medic','JLTS_CloneArmor_KC_medic','JLTS_CloneArmor_KS_medic','JLTS_CloneArmor_medic',
		'JLTS_CloneArmor_Purge_medic','JLTS_CloneArmor_Shadow_medic',
		
		//3AS
		'3AS_Clone_Phase1_Armor','3AS_Clone_Phase1_Armor_Captain','3AS_Clone_Phase1_Dirty_Armor_Captain','3AS_Clone_Phase1_Armor_Commander','3AS_Clone_Phase1_Dirty_Armor_Commander','3AS_Clone_Phase1_Dirty_Armor',
		'3AS_Clone_Phase1_Armor_Lieutenant','3AS_Clone_Phase1_Dirty_Armor_Lieutenant','3AS_Clone_Phase1_Armor_Sergeant','3AS_Clone_Phase1_Dirty_Armor_Sergeant','3AS_U_Rep_Katarn_Armor','3AS_U_Rep_Katarn_Armor_Boss',
		'3AS_U_Rep_Katarn_Armor_Fixer','3AS_U_Rep_Katarn_Armor_Gregor','3AS_U_Rep_Katarn_Armor_Niner','3AS_U_Rep_Katarn_Armor_Omega','3AS_U_Rep_Katarn_Armor_Scorch','3AS_U_Rep_Katarn_Armor_Sev','3AS_U_501st_Pilot_Phase3',
		'3AS_U_Pilot_Phase3'
	];

	//Helmet Attachments
	_attachmentsHelmet =
	[
		//LS
		'lsd_gar_republicCommando_hud','lsd_gar_p1Interior_hud',
		
		//JLTS
		'JLTS_Clone_helmetInterior_AB','JLTS_Clone_helmetInterior_P2'
	];
	
	//Cloth Coverings
	_uniformsClothCovering =
	[
		//LS
		'SWLB_CEE_Clone_Hood','SWLB_CEE_Clone_Scarf','SWLB_CEE_Clone_Scarf_Blue','SWLB_CEE_Clone_Scarf_Green','SWLB_CEE_Clone_Scarf_Orange','SWLB_CEE_Scarf_Red','SWLB_CEE_Clone_Scarf_Stewart','SWLB_CEE_Clone_Scarf_White',
		'ls_misc_poncho_facewear','ls_misc_poncho_partnerBlack_facewear','ls_misc_poncho_partnerWhite_facewear','ls_misc_poncho_peaceBlue_facewear','ls_misc_poncho_peaceGrean_facewear','ls_misc_poncho_peaceRed_facewear',
		'ls_misc_poncho_sideStripeBlue_facewear','ls_misc_poncho_sideStripeBrown_facewear','ls_misc_poncho_sideStripeRed_faceweat','ls_misc_poncho_sideStripeWhite_facewear'
	];
	
	//Masks
	_uniformsMasks =
	[
		'',''
	];
	
	//Formalwear
	_uniformsFormal =
	[
		'',''
	];
	
	//Armour
	_uniformsArmour =
	[
		//JLTS
		'JLTS_CloneArmorMC','JLTS_CloneArmorMC_104_Wolffe','JLTS_CloneArmorMC_212_Cody','JLTS_CloneArmorMC_501_Vaughn','JLTS_CloneArmorMC_CG_Thorn','JLTS_CloneArmor_DC_Doom','JLTS_CloneArmorMC_HC_Lock',
		'JLTS_CloneArmorMC_KS_commander','JLTS_CloneArmor','JLTS_CloneArmor_104','JLTS_CloneArmor_187_airborne','JLTS_CloneArmor_187','JLTS_CloneArmor_212_airborne','JLTS_CloneArmor_212','JLTS_CloneArmor_327_Bly',
		'JLTS_CloneArmor_327','JLTS_CloneArmor_41','JLTS_CloneArmor_442','JLTS_CloneArmor_501_airborne','JLTS_CloneArmor_501_Appo','JLTS_CloneArmor_501_Rex','JLTS_CloneArmor_501_Vill','JLTS_CloneArmor_501','JLTS_CloneArmor_5',
		'JLTS_CloneArmor_91','JLTS_CloneArmor_ARC_Blitz','JLTS_CloneArmor_501_Fives','JLTS_CloneArmor_ARC_Fordo','JLTS_CloneArmor_ARC_Hammer','JLTS_CloneArmor_501_Jesse','JLTS_CloneArmor_ARC_Predator','JLTS_CloneArmor_CG_Fox',
		'JLTS_CloneArmor_CG_Thire','JLTS_CloneArmor_CG','JLTS_CloneArmor_Commander','JLTS_CloneArmor_DC','JLTS_CloneArmor_HC','JLTS_CloneArmor_KC','JLTS_CloneArmor_KS','JLTS_CloneArmor_Lieutenant','JLTS_CloneArmor_bomb',
		'JLTS_CloneArmor_Purge','JLTS_CloneArmor_Sergeant','JLTS_CloneArmor_Shadow','JLTS_CloneArmorGrenadier','JLTS_CloneArmorGrenadier_104','JLTS_CloneArmorGrenadier_187','JLTS_CloneArmorGrenadier_212',
		'JLTS_CloneArmorGrenadier_41','JLTS_CloneArmorGrenadier_442','JLTS_CloneArmorGrenadier_501','JLTS_CloneArmorGrenadier_5','JLTS_CloneArmorGrenadier_91','JLTS_CloneArmorGrenadier_CG','JLTS_CloneArmorGrenadier_DC',
		'JLTS_CloneArmorGrenadier_HC','JLTS_CloneArmorGrenadier_KS','JLTS_CloneArmorGrenadier_Purge','JLTS_CloneArmorGrenadier_Shadow','JLTS_CloneArmorRecon','JLTS_CloneArmorRecon_91','JLTS_CloneArmorSupport',
		'JLTS_CloneArmorSupport_104','JLTS_CloneArmorSupport_187','JLTS_CloneArmorSupport_212','JLTS_CloneArmorSupport_327','JLTS_CloneArmorSupport_41_Gree','JLTS_CloneArmorSupport_41','JLTS_CloneArmorSupport_442',
		'JLTS_CloneArmorSupport_501','JLTS_CloneArmorSupport_5','JLTS_CloneArmorSupport_91','JLTS_CloneArmorSupport_CG','JLTS_CloneArmorSupport_DC','JLTS_CloneArmorSupport_HC','JLTS_CloneArmorSupport_KS',
		'JLTS_CloneArmorSupport_Shadow','JLTS_CloneArmor_SC','JLTS_CloneArmor_SC_commander','JLTS_CloneArmor_SC_medic',
		
		//3AS
		'3AS_Clone_Phase1_Armor','3AS_Clone_Phase1_Armor_Captain','3AS_Clone_Phase1_Dirty_Armor_Captain','3AS_Clone_Phase1_Armor_Commander','3AS_Clone_Phase1_Dirty_Armor_Commander','3AS_Clone_Phase1_Dirty_Armor',
		'3AS_Clone_Phase1_Armor_Lieutenant','3AS_Clone_Phase1_Dirty_Armor_Lieutenant','3AS_Clone_Phase1_Armor_Sergeant','3AS_Clone_Phase1_Dirty_Armor_Sergeant','3AS_U_Rep_Katarn_Armor','3AS_U_Rep_Katarn_Armor_Boss',
		'3AS_U_Rep_Katarn_Armor_Fixer','3AS_U_Rep_Katarn_Armor_Gregor','3AS_U_Rep_Katarn_Armor_Niner','3AS_U_Rep_Katarn_Armor_Omega','3AS_U_Rep_Katarn_Armor_Scorch','3AS_U_Rep_Katarn_Armor_Sev'
	];
	
	//Medic Armour
	_uniformsMedic =
	[
		//JLTS
		'JLTS_CloneArmor_104_medic','JLTS_CloneArmor_187_medic','JLTS_CloneArmor_212_medic','JLTS_CloneArmor_327_medic','JLTS_CloneArmor_41_medic','JLTS_CloneArmor_442_medic','JLTS_CloneArmor_501_medic',
		'JLTS_CloneArmor_5_medic','JLTS_CloneArmor_91_medic','JLTS_CloneArmor_CG_medic','JLTS_CloneArmor_DC_medic','JLTS_CloneArmor_HC_medic','JLTS_CloneArmor_KC_medic','JLTS_CloneArmor_KS_medic','JLTS_CloneArmor_medic',
		'JLTS_CloneArmor_Purge_medic','JLTS_CloneArmor_Shadow_medic'
	];
	
	//Coveralls
	_uniformsCoveralls =
	[
		//3AS
		'3AS_U_501st_Pilot_Phase3','3AS_U_Pilot_Phase3'
	];
	
//======
//VESTS:
//======

	//All Vests
	_vestsAll =
	[
		//JLTS
		'JLTS_CloneVestARCCadet','JLTS_CloneVestARC','JLTS_CloneVestARC_ARC_Blitz','JLTS_CloneVest_ARC_501_Fives','JLTS_CloneVestARC_ARC_Hammer','JLTS_CloneVestARC_501_Jesse','JLTS_CloneVestARC_ARC_Predator',
		'JLTS_CloneVestCommander','JLTS_CloneVestCommander_212','JLTS_CloneVestCommander_442','JLTS_CloneVestCommander_501_Rex','JLTS_CloneVestCommander_501','JLTS_CloneVestCommander_91','JLTS_CloneVestCommander_CG',
		'JLTS_CloneVestCommander_DC','JLTS_CloneVestCommander_KS','JLTS_CloneVestLieutenant','JLTS_CloneVestLieutenant_212','JLTS_CloneVestLieutenant_442','JLTS_CloneVestLieutenant_501','JLTS_CloneVestLieutenant_91',
		'JLTS_CloneVestLieutenant_CG','JLTS_CloneVestLieutenant_DC','JLTS_CloneVestLieutenant_KS','JLTS_CloneVestOfficer','JLTS_CloneVestOfficer_212','JLTS_CloneVestOfficer_327_Bly','JLTS_CloneVestOfficer_327_brown',
		'JLTS_CloneVestOfficer_327','JLTS_CloneVestOfficer_442','JLTS_CloneVestOfficer_501_Appo','JLTS_CloneVestOfficer_501_Vill','JLTS_CloneVestOfficer_501','JLTS_CloneVestOfficer_91','JLTS_CloneVestOfficer_CG_Thire',
		'JLTS_CloneVestOfficer_CG','JLTS_CloneVestOfficer_DC','JLTS_CloneVestOfficer_KC_Deviss','JLTS_CloneVestOfficer_KC','JLTS_CloneVestOfficer_KS','LTS_CloneVestOfficer2','JLTS_CloneVestOfficer2_212',
		'JLTS_CloneVestOfficer2_327','JLTS_CloneVestOfficer2_442','JLTS_CloneVestOfficer2_501','JLTS_CloneVestOfficer2_91','JLTS_CloneVestOfficer2_CG','JLTS_CloneVestOfficer2_DC','JLTS_CloneVestOfficer2_KC',
		'JLTS_CloneVestOfficer2_KS','JLTS_CloneVestPurge','JLTS_CloneVestPurge_commander','JLTS_CloneVestPurge_officer','JLTS_CloneVestAirborneNCO','JLTS_CloneVestAirborneNCO_212','JLTS_CloneVestAirborneNCO_501',
		'JLTS_CloneVestReconNCO','JLTS_CloneVestReconNCO_ARC_Fordo','JLTS_CloneVestReconOfficer','JLTS_CloneVestReconOfficer_91','JLTS_CloneVestReconOfficer_DC','JLTS_CloneVestAirborne','JLTS_CloneVestAirborne_212',
		'JLTS_CloneVestAirborne_501','JLTS_CloneVestHolster','JLTS_CloneVestKama','JLTS_CloneVestKama_104_Wolffe','JLTS_CloneVestKama_91','JLTS_CloneVestKama_DC_Doom','JLTS_CloneVestKama_DC','JLTS_CloneVestRecon',
		'JLTS_CloneVestSuspender_41_Gree','JLTS_CloneVestSuspender_white','JLTS_CloneVestSuspender',
		
		//3AS
		'3AS_V_Katarn_Vest_Demo','3AS_V_Katarn_Vest_Tech','3AS_V_Katarn_Vest_Tech_Foxtrot','3AS_V_Katarn_Vest_Tech_Omega','3AS_Pilot_Vest'
	];

	//Heavy Vests
	_vestsHeavy =
	[
		//JLTS
		'JLTS_CloneVestARCCadet','JLTS_CloneVestARC','JLTS_CloneVestARC_ARC_Blitz','JLTS_CloneVest_ARC_501_Fives','JLTS_CloneVestARC_ARC_Hammer','JLTS_CloneVestARC_501_Jesse','JLTS_CloneVestARC_ARC_Predator',
		'JLTS_CloneVestCommander','JLTS_CloneVestCommander_212','JLTS_CloneVestCommander_442','JLTS_CloneVestCommander_501_Rex','JLTS_CloneVestCommander_501','JLTS_CloneVestCommander_91','JLTS_CloneVestCommander_CG',
		'JLTS_CloneVestCommander_DC','JLTS_CloneVestCommander_KS','JLTS_CloneVestLieutenant','JLTS_CloneVestLieutenant_212','JLTS_CloneVestLieutenant_442','JLTS_CloneVestLieutenant_501','JLTS_CloneVestLieutenant_91',
		'JLTS_CloneVestLieutenant_CG','JLTS_CloneVestLieutenant_DC','JLTS_CloneVestLieutenant_KS','JLTS_CloneVestOfficer','JLTS_CloneVestOfficer_212','JLTS_CloneVestOfficer_327_Bly','JLTS_CloneVestOfficer_327_brown',
		'JLTS_CloneVestOfficer_327','JLTS_CloneVestOfficer_442','JLTS_CloneVestOfficer_501_Appo','JLTS_CloneVestOfficer_501_Vill','JLTS_CloneVestOfficer_501','JLTS_CloneVestOfficer_91','JLTS_CloneVestOfficer_CG_Thire',
		'JLTS_CloneVestOfficer_CG','JLTS_CloneVestOfficer_DC','JLTS_CloneVestOfficer_KC_Deviss','JLTS_CloneVestOfficer_KC','JLTS_CloneVestOfficer_KS','LTS_CloneVestOfficer2','JLTS_CloneVestOfficer2_212',
		'JLTS_CloneVestOfficer2_327','JLTS_CloneVestOfficer2_442','JLTS_CloneVestOfficer2_501','JLTS_CloneVestOfficer2_91','JLTS_CloneVestOfficer2_CG','JLTS_CloneVestOfficer2_DC','JLTS_CloneVestOfficer2_KC',
		'JLTS_CloneVestOfficer2_KS','JLTS_CloneVestPurge','JLTS_CloneVestPurge_commander','JLTS_CloneVestPurge_officer'
	];
	
	//Light Vests
	_vestsLight =
	[
		//JLTS
		'JLTS_CloneVestAirborneNCO','JLTS_CloneVestAirborneNCO_212','JLTS_CloneVestAirborneNCO_501','JLTS_CloneVestReconNCO','JLTS_CloneVestReconNCO_ARC_Fordo','JLTS_CloneVestReconOfficer','JLTS_CloneVestReconOfficer_91',
		'JLTS_CloneVestReconOfficer_DC',
		
		//3AS
		'3AS_V_Katarn_Vest_Demo','3AS_V_Katarn_Vest_Tech','3AS_V_Katarn_Vest_Tech_Foxtrot','3AS_V_Katarn_Vest_Tech_Omega'
	];
	
	//Medic Vests
	_vestsMedic =
	[
		'',''
	];
	
	//Crew Vests
	_vestsCrew =
	[
		//3AS
		'3AS_Pilot_Vest'
	];
	
	//Straps and Bandoliers
	_vestsStrapsBandoliers =
	[
		//JLTS
		'JLTS_CloneVestAirborne','JLTS_CloneVestAirborne_212','JLTS_CloneVestAirborne_501','JLTS_CloneVestHolster','JLTS_CloneVestKama','JLTS_CloneVestKama_104_Wolffe','JLTS_CloneVestKama_91','JLTS_CloneVestKama_DC_Doom',
		'JLTS_CloneVestKama_DC','JLTS_CloneVestRecon','JLTS_CloneVestSuspender_41_Gree','JLTS_CloneVestSuspender_white','JLTS_CloneVestSuspender'
	];

//==========
//BACKPACKS:
//==========

	//All Backpacks
	_backpacksAll =
	[
		//Base Arma3
		'B_Parachute',
	
		//LS
		'ls_gar_glidepackClosed_backpack',
		
		//JLTS
		'JLTS_Clone_backpack','JLTS_Clone_backpack_eod_DC','JLTS_Clone_backpack_DC','JLTS_Clone_backpack_eod','JLTS_Clone_backpack_bomb','JLTS_Clone_backpack_Purge','JLTS_Clone_backpack_s','JLTS_Clone_belt_bag',
		'JLTS_Clone_backpack_medic_DC','JLTS_Clone_backpack_medic','JLTS_Clone_backpack_Purge_medic','JLTS_Clone_ARC_backpack','JLTS_Clone_LR_attachment','JLTS_Clone_RTO_pack','JLTS_Clone_RTO_pack_41_Gree',
		'JLTS_Clone_backpack_RTO','JLTS_Clone_backpack_rto_DC','JLTS_Clone_backpack_s_RTO','JLTS_Clone_jumppack_mc','JLTS_Clone_jumppack_Chicken','JLTS_Clone_backpack_DC','JLTS_Clone_jumppack_chicken_501',
		'JLTS_Clone_jumppack_chicken_black','JLTS_Clone_jumppack_chicken_DC','JLTS_Clone_jumppack_JT12','JLTS_Clone_jumppack_JT12_104','JLTS_Clone_jumppack_JT12_501','JLTS_Clone_jumppack_JT12_black',
		'LTS_Clone_jumppack_JT12_DC','JLTS_Clone_jumppack','JLTS_Clone_jumppack_DC','JLTS_UST_turret_GAR_backpack','JLTS_UAV_prowler_gar_backpack',
		
		//JLTS:EA
		'SEA_Backpack_Heavy','SEA_Backpack_Heavy_s','SEA_Backpack_Heavy_invis',
		
		//3AS
		'3AS_Republic_Mortar_Bag'
	];

	//Carrier Packs
	_backpacksCarrier =
	[
		//JLTS
		'JLTS_Clone_backpack','JLTS_Clone_backpack_eod_DC','JLTS_Clone_backpack_DC','JLTS_Clone_backpack_eod','JLTS_Clone_backpack_bomb','JLTS_Clone_backpack_Purge','JLTS_Clone_backpack_s','JLTS_Clone_belt_bag',
		
		//JLTS:EA
		'SEA_Backpack_Heavy','SEA_Backpack_Heavy_s','SEA_Backpack_Heavy_invis'
	];
	
	//Medic Packs
	_backpacksMedic =
	[
		//JLTS
		'JLTS_Clone_backpack_medic_DC','JLTS_Clone_backpack_medic','JLTS_Clone_backpack_Purge_medic'
	];
	
	//Radio Packs
	_backpacksRadio =
	[
		//JLTS
		'JLTS_Clone_ARC_backpack','JLTS_Clone_LR_attachment','JLTS_Clone_RTO_pack','JLTS_Clone_RTO_pack_41_Gree','JLTS_Clone_backpack_RTO','JLTS_Clone_backpack_rto_DC','JLTS_Clone_backpack_s_RTO',
		
		//JLTS:EA
		'SEA_Backpack_RTO_invis','SEA_Backpack_RTO_Attachment','SEA_Backpack_RTO_Pack'
	];
	
	//Jetpacks
	_backpacksJet =
	[
		//JLTS
		'JLTS_Clone_jumppack_mc','JLTS_Clone_jumppack_Chicken','JLTS_Clone_backpack_DC','JLTS_Clone_jumppack_chicken_501','JLTS_Clone_jumppack_chicken_black','JLTS_Clone_jumppack_chicken_DC','JLTS_Clone_jumppack_JT12',
		'JLTS_Clone_jumppack_JT12_104','JLTS_Clone_jumppack_JT12_501','JLTS_Clone_jumppack_JT12_black','LTS_Clone_jumppack_JT12_DC','JLTS_Clone_jumppack','JLTS_Clone_jumppack_DC'
	];
	
	//Respirators
	_backpacksRespirator =
	[
		'',''
	];
	
	//Parachutes
	_backpacksParachute =
	[
		//Base Arma3
		'B_Parachute',
		
		//LS
		'ls_gar_glidepackClosed_backpack'
	];
	
	//Static MGs
	_backpacksTurret =
	[
		//JLTS
		'JLTS_UST_turret_GAR_backpack'
	];
	
	//Mortars
	_backpacksMortar =
	[
		//LS
		'ls_gar_mortar_backpack',
		
		//3AS
		'3AS_Republic_Mortar_Bag'
	];
	
	//UAVs
	_backpacksUAV =
	[
		//JLTS
		'JLTS_UAV_prowler_gar_backpack'
	];
	
//========
//Helmets:
//========

	//All Helmets
	_helmetsAll =
	[
		//JLTS
		'JLTS_CloneHelmetAB','JLTS_CloneHelmetAB_187','JLTS_CloneHelmetAB_212','JLTS_CloneHelmetAB_501','JLTS_CloneHelmetAB_Purge','JLTS_CloneHelmetP2MC','JLTS_CloneHelmetP2MC_212_Cody','JLTS_CloneHelmetARC',
		'JLTS_CloneHelmetP2','JLTS_CloneHelmetP2_104','JLTS_CloneHelmetP2_187','JLTS_CloneHelmetP2_212','JLTS_CloneHelmetP2_327_Bly','JLTS_CloneHelmetP2_327','JLTS_CloneHelmetP2_332_Vaughn','JLTS_CloneHelmetP2_332',
		'JLTS_CloneHelmetP2_41_Gree','JLTS_CloneHelmetP2_442','JLTS_CloneHelmetP2_501_Rex','JLTS_CloneHelmetP2_501','JLTS_CloneHelmetP2_5','JLTS_CloneHelmetP2_91','JLTS_CloneHelmetP2_ARC_Blitz','JLTS_CloneHelmetP2_501_Fives',
		'JLTS_CloneHelmetP2_ARC_Hammer','JLTS_CloneHelmetP2_501_Jesse','JLTS_CloneHelmetP2_ARC_Predator','JLTS_CloneHelmetP2_Captain','JLTS_CloneHelmetP2_CG_Fox','JLTS_CloneHelmetP2_CG_Thorn','JLTS_CloneHelmetP2_CG',
		'JLTS_CloneHelmetP2_Commander','JLTS_CloneHelmetP2_DC_Doom','JLTS_CloneHelmetP2_DC','JLTS_CloneHelmetP2_HC_Lock','JLTS_CloneHelmetP2_HC','JLTS_CloneHelmetP2_KC','JLTS_CloneHelmetP2_KS','JLTS_CloneHelmetP2_Lieutenant',
		'JLTS_CloneHelmetP2_bomb','JLTS_CloneHelmetP2_Sergeant','JLTS_CloneHelmetSC_SC','JLTS_CloneHelmet_SCC_SC','JLTS_CloneHelmet_SCC_SC_commander','JLTS_CloneHelmetBARC','JLTS_CloneHelmetBARC_104_Wolffe',
		'JLTS_CloneHelmetBARC_91','JLTS_CloneHelmetBARC_ARC_Fordo','JLTS_CloneHelmetP2_Shadow',
		
		//JLTS:EA
		'SEA_Helmet_ARC','SEA_Helmet_ARF_base','SEA_Helmet Engineer_Base','SEA_Helmet_Hazard_Base','SEA_Helmet_P1_Base','LSEA_Helmet_Pilot_P1_Base','SEA_Helmet_SpecOps_LR_Base','SEA_Helmet_SpecOps_SR_Base',
		
		//3AS
		'3as_ATRT_Helmet','3as_P1_212th','3as_P1_327th','3as_P1_501A','3as_P1_501','3as_P1_91st','3as_P1_EOD_Helmet','3as_P1_CPT','3as_P1_CC','3as_P1_LT','3as_P1_Sgt','3AS_ARF_Helmet','3AS_H_Katarn_Helmet',
		'3AS_H_Katarn_Helmet_Boss','3AS_H_Katarn_Helmet_Fixer','3AS_H_Katarn_Helmet_Gregor','3AS_H_Katarn_Helmet_Omega','3AS_H_Katarn_Helmet_Scorch','3AS_H_Katarn_Helmet_Sev','3AS_P2_Pilot_helmet_101st',
		'3AS_P2_Pilot_helmet_212th','3AS_P2_Pilot_helmet_327th','3AS_P2_Pilot_helmet_91st','3AS_P2_Pilot_helmet_Razor','3AS_P2_Pilot_helmet_Republic','3as_P2_Pilot_alt_helmet','3AS_P2_Pilot_helmet_Razor_alt',
		'3AS_P3_Pilot_Helmet_P','3AS_P3_Pilot_Helmet_501st'
	];

	//Combat Helmets
	_helmetsCombat =
	[
		//JLTS
		'JLTS_CloneHelmetAB','JLTS_CloneHelmetAB_187','JLTS_CloneHelmetAB_212','JLTS_CloneHelmetAB_501','JLTS_CloneHelmetAB_Purge','JLTS_CloneHelmetP2MC','JLTS_CloneHelmetP2MC_212_Cody','JLTS_CloneHelmetARC',
		'JLTS_CloneHelmetP2','JLTS_CloneHelmetP2_104','JLTS_CloneHelmetP2_187','JLTS_CloneHelmetP2_212','JLTS_CloneHelmetP2_327_Bly','JLTS_CloneHelmetP2_327','JLTS_CloneHelmetP2_332_Vaughn','JLTS_CloneHelmetP2_332',
		'JLTS_CloneHelmetP2_41_Gree','JLTS_CloneHelmetP2_442','JLTS_CloneHelmetP2_501_Rex','JLTS_CloneHelmetP2_501','JLTS_CloneHelmetP2_5','JLTS_CloneHelmetP2_91','JLTS_CloneHelmetP2_ARC_Blitz','JLTS_CloneHelmetP2_501_Fives',
		'JLTS_CloneHelmetP2_ARC_Hammer','JLTS_CloneHelmetP2_501_Jesse','JLTS_CloneHelmetP2_ARC_Predator','JLTS_CloneHelmetP2_Captain','JLTS_CloneHelmetP2_CG_Fox','JLTS_CloneHelmetP2_CG_Thorn','JLTS_CloneHelmetP2_CG',
		'JLTS_CloneHelmetP2_Commander','JLTS_CloneHelmetP2_DC_Doom','JLTS_CloneHelmetP2_DC','JLTS_CloneHelmetP2_HC_Lock','JLTS_CloneHelmetP2_HC','JLTS_CloneHelmetP2_KC','JLTS_CloneHelmetP2_KS','JLTS_CloneHelmetP2_Lieutenant',
		'JLTS_CloneHelmetP2_bomb','JLTS_CloneHelmetP2_Sergeant','JLTS_CloneHelmetSC_SC','JLTS_CloneHelmet_SCC_SC','JLTS_CloneHelmet_SCC_SC_commander',
		
		//JLTS:EA
		'SEA_Helmet_ARC','SEA_Helmet_ARF_base','SEA_Helmet Engineer_Base','SEA_Helmet_Hazard_Base','SEA_Helmet_P1_Base','LSEA_Helmet_Pilot_P1_Base',
		
		//3AS
		'3as_ATRT_Helmet','3as_P1_212th','3as_P1_327th','3as_P1_501A','3as_P1_501','3as_P1_91st','3as_P1_EOD_Helmet','3as_P1_CPT','3as_P1_CC','3as_P1_LT','3as_P1_Sgt'
	];
	
	//Stealth Helmets
	_helmetsStealth =
	[
		//JLTS
		'JLTS_CloneHelmetBARC','JLTS_CloneHelmetBARC_104_Wolffe','JLTS_CloneHelmetBARC_91','JLTS_CloneHelmetBARC_ARC_Fordo','JLTS_CloneHelmetP2_Shadow',
		
		//JLTS:EA
		'SEA_Helmet_SpecOps_LR_Base','SEA_Helmet_SpecOps_SR_Base',
		
		//3AS
		'3AS_ARF_Helmet','3AS_H_Katarn_Helmet','3AS_H_Katarn_Helmet_Boss','3AS_H_Katarn_Helmet_Fixer','3AS_H_Katarn_Helmet_Gregor','3AS_H_Katarn_Helmet_Omega','3AS_H_Katarn_Helmet_Scorch','3AS_H_Katarn_Helmet_Sev'
	];
	
	//Pilot Helmets
	_helmetsPilot =
	[
		//3AS
		'3AS_P2_Pilot_helmet_101st','3AS_P2_Pilot_helmet_212th','3AS_P2_Pilot_helmet_327th','3AS_P2_Pilot_helmet_91st','3AS_P2_Pilot_helmet_Razor','3AS_P2_Pilot_helmet_Republic','3as_P2_Pilot_alt_helmet',
		'3AS_P2_Pilot_helmet_Razor_alt','3AS_P3_Pilot_Helmet_P','3AS_P3_Pilot_Helmet_501st'
	];
	
//==========
//Equipment:
//==========

	//NVGs
	_equipmentNVGs =
	[
		//JLTS
		'JLTS_CloneNVGCC','JLTS_CloneNVGCC_CG','JLTS_CloneNVGCC_DC_Doom','JLTS_CloneNVGCC_HC_Lock','JLTS_CloneNVGCC_KS','JLTS_CloneNVGMC','JLTS_CloneNVGMC_212_Cody','JLTS_CloneNVGMC_332_Vaughn','JLTS_CloneNVG',
		'JLTS_CloneNVG_327_Bly','JLTS_CloneNVG_327','JLTS_CloneNVG_black','JLTS_CloneNVG_DC','JLTS_CloneNVG_KC','JLTS_CloneNVGRange_ARC_Blitz','JLTS_CloneNVGRange_ARC_Hammer','JLTS_CloneNVGRange','JLTS_CloneNVGRange_black',
		'JLTS_CloneNVG_spec','JLTS_CloneNVG_spec_327','JLTS_CloneNVG_spec_black','JLTS_CloneNVG_spec_DC','JLTS_CloneNVG_spec_KC','JLTS_NVG_droid_chip_2','JLTS_NVG_droid_chip_1',
		
		//JLTS:EA
		'SEA_CloneNVG_TI','SEA_P1_Rangefinder','SEA_Rangefinder_Black',
		
		//Operation TREBUCHET
		'OPTRE_NVGT_C','OPTRE_NVG'
	];

	//Assigned Items
	_equipmentAssignedItems =
	[
		// Maps
		'ItemMap',
		
		// Terminals
		'ItemGPS',
		
		// Radios
		'ItemRadio',
		
		// Compasses
		'ItemCompass',
		
		// Watches
		'ItemWatch','ChemicalDetector_01_watch_F'
	];
	
	//UAV Operater items
	_equipmentUAV =
	[
		//Base Arma3
		'I_UavTerminal','O_UavTerminal','B_UavTerminal','I_E_UavTerminal','C_UavTerminal'
	];
	
	//Miscellaneous Equipment
	_equipmentInventory =
	[
		//Vanilla
		'firstaidkit','minedetector','Laserbatteries',
		
		//JLTS
		'JLTS_riot_shield_item','JLTS_riot_shield_101_item','JLTS_riot_shield_212_item','JLTS_riot_shield_501_item','JLTS_riot_shield_CG_item','JLTS_riot_shield_GD_item','JLTS_ids_gar_army','JLTS_repairkit_weapon_mini'
	];
	
		//Medic items
	_equipmentMedic =
	[
		//Base Arma3
		'medikit'
	];
	
	//Engineer items
	_equipmentEngineer =
	[
		//Base Arma3
		'toolkit','JLTS_repairkit_weapon'
	];
	
	//Binoculars
	_equipmentbinoculars =
	[
		// Legion Base - Stable
		'SWLB_clone_commander_binocular','SWLB_clone_commander_binocular_night','SWLB_clone_binocular',
		
		// Just Like The Simulations - The Great War
		'JLTS_CloneBinocular','JLTS_CloneBinocular_black'
	];

//====================
//OPFOR SUBCATEGORIES:
//====================

	_o_weapons = [
		'','arifle_ak12_f','arifle_ak12_gl_f','arifle_akm_f','arifle_aks_f','arifle_ctars_blk_f','arifle_ctars_ghex_f','arifle_ctars_hex_f','arifle_ctar_blk_f','arifle_ctar_ghex_f',
		'arifle_ctar_hex_f','arifle_ctar_gl_blk_f','arifle_ctar_gl_ghex_f','arifle_ctar_gl_hex_f','srifle_dmr_07_blk_f','srifle_dmr_07_ghex_f','srifle_dmr_07_hex_f','arifle_katiba_f',
		'arifle_katiba_c_f','arifle_katiba_gl_f','lmg_03_f','arifle_mk20_plain_f','arifle_mk20_f','arifle_mk20_gl_plain_f','arifle_mk20_gl_f','arifle_mk20c_plain_f','arifle_mk20c_f',
		'hgun_pdw2000_f','smg_05_f','smg_02_f','arifle_trg20_f','arifle_trg21_f','arifle_trg21_gl_f','arifle_arx_blk_f','arifle_arx_ghex_f','arifle_arx_hex_f','smg_01_f'
	];
	_o_uniforms = [
		'','u_i_c_soldier_bandit_4_f','u_i_c_soldier_bandit_1_f','u_i_c_soldier_bandit_2_f','u_i_c_soldier_bandit_5_f','u_i_c_soldier_bandit_3_f','u_o_t_soldier_f',
		'u_o_combatuniform_ocamo','u_o_combatuniform_oucamo','u_o_fullghillie_ard','u_o_t_fullghillie_tna_f','u_o_fullghillie_lsh','u_o_fullghillie_sard','u_o_t_sniper_f',
		'u_o_ghilliesuit','u_bg_guerrilla_6_1','u_bg_guerilla1_1','u_bg_guerilla1_2_f','u_bg_guerilla2_2','u_bg_guerilla2_1','u_bg_guerilla2_3','u_bg_guerilla3_1','u_bg_leader',
		'u_o_officer_noinsignia_hex_f','u_o_t_officer_f','u_o_officeruniform_ocamo','u_i_c_soldier_para_2_f','u_i_c_soldier_para_3_f','u_i_c_soldier_para_5_f','u_i_c_soldier_para_4_f',
		'u_i_c_soldier_para_1_f','u_o_pilotcoveralls','u_o_specopsuniform_ocamo','u_i_c_soldier_camo_f'
	];
	_o_vests = [
		'','v_harnessogl_brn','v_harnessogl_ghex_f','v_harnesso_brn','v_harnesso_ghex_f','v_harnesso_gry','v_bandollierb_cbr','v_tacchestrig_cbr_f','v_tacvest_khk'
	];
	_o_backpacks = [
		'','b_assaultpack_ocamo','b_fieldpack_ghex_f','b_fieldpack_ocamo','b_tacticalpack_ocamo','b_viperharness_ghex_f','b_viperharness_hex_f','b_viperlightharness_blk_f',
		'b_viperlightharness_ghex_f','b_viperlightharness_hex_f'
	];
	_o_headgear = [
		'','h_helmetspeco_blk','h_helmetspeco_ghex_f','h_helmetspeco_ocamo','h_bandanna_gry','h_bandanna_blu','h_bandanna_cbr','h_bandanna_khk_hs','h_bandanna_khk',
		'h_bandanna_mcamo','h_cap_brn_specops','h_helmetcrew_o','h_helmetleadero_ghex_f','h_helmetleadero_ocamo','h_helmetleadero_oucamo','h_milcap_ghex_f','h_milcap_ocamo',
		'h_milcap_dgtl','h_helmeto_ghex_f','h_helmeto_ocamo','h_helmeto_oucamo','h_shemag_olive','h_shemag_olive_hs','h_shemagopen_tan','h_shemagopen_khk'
	];
	_o_magazines = [
		''
	];
	_o_attachments = [
		''
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesAll + _grenadesAll + _explosivesAll),																																							// whitelisted MAGAZINES
			(_backpacksAll),																																															// whitelisted BACKPACKS
			(_weaponsAll + _equipmentBinoculars)																																										// whitelisted WEAPONS
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
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesRifle + _magazinesAssault + _magazinesUGL + _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive + _explosivesInfantry),			// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _riflesPlasma + _blastersAssault + _blastersUGL + _equipmentBinoculars)																									// whitelisted WEAPONS
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesAssault + _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive + _grenadesShield + _explosivesInfantry),							// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _blastersAssault + _equipmentBinoculars)																																// whitelisted WEAPONS
		]
	]
};
// Machine Gunner role
if (_role in ['machine_gunner','machine_gunner_WL']) exitWith {
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesRepeater + _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive + _explosivesInfantry),												// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _blastersSquadAutomatic + _equipmentBinoculars)																															// whitelisted WEAPONS
		]
	]
};
// Unguided Anti-Tank role
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesRifle + _magazinesAssault + _rocketsUnguided + _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive),								// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _riflesPlasma + _blastersAssault + _launchersUnguided + _equipmentBinoculars)																							// whitelisted WEAPONS
		]
	]
};
// Guided Anti-Tank role
if (_role isEqualTo 'rifleman_hat') exitWith {
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesAssault + _rocketsGuided + _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive),													// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _blastersAssault + _launchersGuided + _equipmentBinoculars)																												// whitelisted WEAPONS
		]
	]
};
// Medic role
if (_role in ['medic','medic_WL']) exitWith {
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
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour + _uniformsMedic),																																					// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory + _equipmentInventory),																																							// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesRifle + _magazinesAssault + _magazinesUGL+ _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive),														// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksMedic + _backpacksRadio + _backpacksParachute),																																// whitelisted BACKPACKS
			(_pistolsPlasma + _riflesPlasma + _blastersAssault + _blastersUGL + _launchersDisposable + _equipmentBinoculars)																							// whitelisted WEAPONS
		]
	]
};
// Engineer role
if (_role in ['engineer']) exitWith {
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
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour + _uniformsMedic),																																					// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentEngineer + _equipmentInventory),																																								// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth + _helmetsPilot),																																						// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesScatter + _magazinesAssault + _magazinesStun + _explosivesInfantry + _explosivesEngineer + _grenadesChemlights + _grenadesSmoke),							// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksTurret + _backpacksRadio + _backpacksParachute),																																// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _blastersScatter + _blastersAssault + _equipmentBinoculars)																												// whitelisted WEAPONS
		]
	]
};
// Mortar Gunner role
if (_role in ['mortar_gunner']) exitWith {
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
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour + _uniformsMedic),																																					// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentEngineer + _equipmentInventory),																																								// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesRifle + _magazinesAssault + _magazinesUGL+ _magazinesStun),																								// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute + _backpacksMortar),																																// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _riflesPlasma + _blastersAssault + _blastersUGL + _equipmentBinoculars)																									// whitelisted WEAPONS
		]
	]
};
// Sniper role
if (_role in ['sniper','sniper_WL']) exitWith {
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour + _uniformsMedic),																																					// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentEngineer + _equipmentInventory),																																								// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesSniper + _magazinesStun + _grenadesChemlights + _grenadesSmoke),																												// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _blastersSniper + _equipmentBinoculars)																																					// whitelisted WEAPONS
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_attachmentsHelmet + _uniformsClothCovering + _uniformsMasks + _uniformsFormal + _uniformsArmour),																										// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted Inventory
				(_equipmentAssignedItems),																																												// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_equipmentNVGs),																																														// whitelisted goggles (facewear)
				(_attachmentsRifle + _attachmentsSniper)																																								// whitelisted Attachments
			],
			(_magazinesPistol + _magazinesCarbine + _blastersScatter + _magazinesStun + _grenadesChemlights + _grenadesSmoke),																							// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _magazinesScatter + _equipmentBinoculars)																																// whitelisted WEAPONS
		]
	]
};
// RTO role
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour + _uniformsMedic),																																					// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentEngineer + _equipmentInventory),																																								// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesRifle + _magazinesAssault + _magazinesUGL + _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive + _explosivesInfantry),			// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _riflesPlasma + _blastersAssault + _blastersUGL + _equipmentBinoculars)																									// whitelisted WEAPONS
		]
	]
};
// Pilot role
if (_role in ['pilot','pilot_plane','pilot_cas','pilot_heli','pilot_heli_WL']) exitWith {
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour + _uniformsMedic),																																					// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentEngineer + _equipmentInventory),																																								// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _magazinesRifle + _magazinesAssault + _magazinesUGL + _magazinesStun + _grenadesChemlights + _grenadesSmoke + _grenadesOffensive + _explosivesInfantry),			// whitelisted MAGAZINES
			(_backpacksCarrier + _backpacksRadio + _backpacksParachute),																																				// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _riflesPlasma + _blastersAssault + _blastersUGL + _equipmentBinoculars)																									// whitelisted WEAPONS
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	//	Items
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesAll + _grenadesAll + _explosivesAll),																																							// whitelisted MAGAZINES
			(_backpacksAll),																																															// whitelisted BACKPACKS
			(_weaponsAll + _equipmentBinoculars)																																										// whitelisted WEAPONS
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
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesAll + _grenadesAll + _explosivesAll),																																							// whitelisted MAGAZINES
			(_backpacksAll),																																															// whitelisted BACKPACKS
			(_weaponsAll + _equipmentBinoculars)																																										// whitelisted WEAPONS
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
				[	// blacklisted assigned items  (we dont blacklist the uav terminal for the uav operator!)
					
				],
				_headgearThermal,	// blacklisted Headgear
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
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour + _uniformsMedic),																																					// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentEngineer + _equipmentInventory),																																								// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesPistol + _magazinesCarbine + _blastersScatter + _magazinesStun + _grenadesChemlights + _grenadesSmoke),																							// whitelisted MAGAZINES
			(_backpacksUAV + _backpacksParachute),																																									// whitelisted BACKPACKS
			(_pistolsPlasma + _carbinesPlasma + _magazinesScatter + _equipmentBinoculars)																																// whitelisted WEAPONS
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
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesAll + _grenadesAll + _explosivesAll),																																							// whitelisted MAGAZINES
			(_backpacksAll),																																															// whitelisted BACKPACKS
			(_weaponsAll + _equipmentBinoculars)																																										// whitelisted WEAPONS
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
				_headgearThermal,	// blacklisted Headgear
				[	// blacklisted goggles
				
				],
				[	// blacklisted attachments
				
				]
			],
			[	// blacklisted MAGAZINES
				
			],
			[	// blacklisted BACKPACKS
			
			],
			(_weaponsMMG + _weaponsSniper + _weaponsLauncherRegular)	// blacklisted WEAPONS
		],
		// -------------------------------------------------------------- WHITELIST
		[	// ITEMS
			[	
				(_uniformsFormal + _uniformsArmour),																																									// whitelisted UNIFORMS
				(_vestsHeavy + _vestsLight + _vestsCrew + _vestsStrapsBandoliers),																																		// whitelisted VESTS
				(_equipmentInventory),																																													// whitelisted INVENTORY
				(_equipmentNVGs + _equipmentAssignedItems),																																								// whitelisted ASSIGNED ITEMS + NVGs
				(_helmetsCombat + _helmetsStealth),																																										// whitelisted HEADGEAR
				(_uniformsClothCovering + _attachmentsHelmet + _uniformsMasks),																																			// whitelisted FACEWEAR
				(_attachmentsRifle)																																														// whitelisted WEAPON ATTACHMENTS
			],
			(_magazinesAll + _grenadesAll + _explosivesAll),																																							// whitelisted MAGAZINES
			(_backpacksAll),																																															// whitelisted BACKPACKS
			(_weaponsAll + _equipmentBinoculars)																																										// whitelisted WEAPONS
		]
	]
};
// Default
([WEST,'rifleman'] call (missionNamespace getVariable 'QS_data_arsenal'))