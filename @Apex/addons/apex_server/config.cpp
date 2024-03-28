#include "BIS_AddonInfo.hpp"
class CfgPatches {
	class apex_server {
		requiredAddons[] = {};
		author[]= {"Quiksilver"};
	};
};
class CfgFunctions {
	class A3 {
		tag = "BIS";
		project = "arma3";
		class Aircraft {
			class AircraftWingStateCheck {file = "\apex_server\BIS\fn_AircraftWingStateCheck.sqf";};
		};
		class Ambient {
			class ambientFlyBy {file = "\apex_server\BIS\fn_ambientFlyBy.sqf";};
			class animalBehaviour {file = "\apex_server\BIS\fn_animalBehaviour.sqf";};
		};
		class Curator {
			class moduleCurator {file = "\apex_server\BIS\fn_moduleCurator.sqf";};
		};
		class Effects {
			class effectFired {file = "\apex_server\BIS\fn_effectFired.sqf";};
			class effectFiredHeliRocket {file = "\apex_server\BIS\fn_effectFiredHeliRocket.sqf";};
			class effectFiredRocket {file = "\apex_server\BIS\fn_effectFiredRocket.sqf";};
			class effectKilled {file = "\apex_server\BIS\fn_effectKilled.sqf";};
			class effectKilledAirDestruction {file = "\apex_server\BIS\fn_effectKilledAirDestruction.sqf";};
			class effectKilledAirDestructionStage2 {file = "\apex_server\BIS\fn_effectKilledAirDestructionStage2.sqf";};
			class effectKilledSecondaries {file = "\apex_server\BIS\fn_effectKilledSecondaries.sqf";};
		};
		class MP {
			class call {file = "\apex_server\BIS\fn_call.sqf";};
			class execFSM {file = "\apex_server\BIS\fn_execFSM.sqf";};
			class execRemote {file = "\apex_server\BIS\fn_execRemote.sqf";};
			class execVM {file = "\apex_server\BIS\fn_execVM.sqf";};
			class spawn {file = "\apex_server\BIS\fn_spawn.sqf";};
		};
		class Objects {
			class setIdentity {file = "\apex_server\BIS\fn_setIdentity.sqf";};
		};
		class Tasks {
			class deleteTask {file = "\apex_server\BIS\fn_deleteTask.sqf";};
			class setTask {file = "\apex_server\BIS\fn_setTask.sqf";};
		};
		class Vehicles {
			class missileLaunchPositionFix {file = "\apex_server\BIS\fn_missileLaunchPositionFix.sqf";};
		};
	};
	class A3_Jets {
		tag = "BIS";
		project = "arma3";
		class Aircraft {
			class AircraftWingStateCheck {file = "\apex_server\BIS\fn_AircraftWingStateCheck.sqf";};
		};
		class Ejection {
			class PlaneEjection {file = "\apex_server\BIS\fn_PlaneEjection.sqf";};
		};
	};
	class A3_Orange {
		tag = "BIS";
		project = "arma3";
		class Sound {
			class setCustomSoundController {file = "\apex_server\BIS\fn_setCustomSoundController.sqf";};
		};
	};
	class A2 {
		tag = "BIS";
		project = "arma2";
		class Numbers {
			class parseNumber {file = "\apex_server\BIS\fn_parseNumber.sqf";};
		};
	};
};
class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;
class CfgWeapons {
	access = 1;
	// CSAT MMG
	class RifleCore;
	class Rifle_Long_Base_F;
	class MMG_01_base_F: Rifle_Long_Base_F {
		modes[] += {"QS_medium"};
		class manual;
		class burst;
		class close;
		class short;
		class medium: short {
			aiRateOfFire = 3.0;
			aiRateOfFireDistance = 900;
			minRange = 700;
			minRangeProbab = 0.1;
			midRange = 900;
			midRangeProbab = 0.2;
			maxRange = 1100;
			maxRangeProbab = 0.2;
			burst = "ceil (random [5,8,12])";
		};
		class far_optic1: medium {};
		class far_optic2: far_optic1 {};
	};
};
class CfgAmmo {
	access = 1;
	class RocketBase;	
	class R_PG32V_F: RocketBase {
		airLock = 1;
		allowAgainstInfantry = 1;
		aiAmmoUsageFlags = "64 + 128 + 256 + 512";
	};
	class R_PG7_F: RocketBase {
		airLock = 1;
		allowAgainstInfantry = 1;
		aiAmmoUsageFlags = "64 + 128 + 256 + 512";
	};
	class FlareCore;
	class FlareBase: FlareCore {
		intensity = 20000;
		flareSize = 12;
	};
	class F_40mm_White: FlareBase {
		intensity = 40000;
		flareSize = 12;
	};
	class F_20mm_White: FlareBase {
		intensity = 20000;
		flareSize = 12;
	};
	class F_Signal_Green: FlareBase {
		intensity = 20000;
		flareSize = 12;
	};
	class Flare_82mm_AMOS_White: FlareCore {
		intensity = 80000;
		flareSize = 12;
	};
	class B_35mm_AA;
	class B_35mm_AA_Tracer_Green : B_35mm_AA {
		allowAgainstInfantry = 0;
	};
	class B_35mm_AA_Tracer_Red : B_35mm_AA {
		allowAgainstInfantry = 0;
	};
	class B_35mm_AA_Tracer_Yellow : B_35mm_AA {
		allowAgainstInfantry = 0;
	};
};
class CfgAISkill {
	aimingAccuracy[] = {0,0,1,1};
	aimingShake[] = {0,0,1,1};
	aimingSpeed[] = {0,0,1,1};
	commanding[] = {0,0,1,1};
	courage[] = {0,0,1,1};
	endurance[] = {0,0,1,1};
	general[] = {0,0,1,1};
	reloadSpeed[] = {0,0,1,1};
	spotDistance[] = {0,0,1,1};
	spotTime[] = {0,0,1,1};
};
class CfgSurfaces {
    class Default {
        AIAvoidStance = 2;
    };
};
class CfgSFX
{
	class PlowDown
	{
		sound0[] = {"A3\Sounds_F\vehicles\armor\bobcat\bobcat_plow_down_01",20,1,75,1,15,20,25};
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
	class PlowUp
	{
		sound0[] = {"A3\Sounds_F\vehicles\armor\bobcat\bobcat_plow_up_01",20,1,75,1,15,20,25};
		sounds[] = {sound0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
};
class CfgDisabledCommands {
    class CREATEUNIT
    {
        class SYNTAX1
        {
            targets[] = {0,0,0};
            args[] = {{"STRING"},{"ARRAY"}};
        };

        class SYNTAX2
        {
            targets[] = {1,1,1};
            args[] = {{"GROUP"},{"ARRAY"}};
        };
    };

    class ALLVARIABLES
    {
        class SYNTAX1
        {
            targets[] = {1,1,1};
            args[] = {{},{"CONTROL"}};
        };

        class SYNTAX2
        {
            targets[] = {1,1,1};
            args[] = {{},{"TEAM_MEMBER"}};
        };

        class SYNTAX3
        {
            targets[] = {0,0,0};
            args[] = {{},{"NAMESPACE"}};
        };

        class SYNTAX4
        {
            targets[] = {1,1,1};
            args[] = {{},{"OBJECT"}};
        };

        class SYNTAX5
        {
            targets[] = {1,1,1};
            args[] = {{},{"GROUP"}};
        };

        class SYNTAX6
        {
            targets[] = {1,1,1};
            args[] = {{},{"TASK"}};
        };

        class SYNTAX7
        {
            targets[] = {1,1,1};
            args[] = {{},{"LOCATION"}};
        };
    };
};