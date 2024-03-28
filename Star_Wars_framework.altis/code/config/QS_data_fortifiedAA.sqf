/*---------------------------------------------------------------------------------------------------------------------------
*
* file							:	QS_data_fortifiedAA.sqf
* 
* Synopsis						:	This file contains the composition used in generating OpFor fortified AA positions
* 
* Framework Version				:	1.3.5
* 
* Modification Date				:	2023-07-23
* 
* Modification Description		:	In addition to modifiying the file to use props and crates from 3AS and LS, documentation 
*									of this file was increased to include block comments and instruction on how to use the
*									file itself. Modifications were only made for Altis.
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
*	code in the debug console along with every object contained within the file for the first array relating to Altis.
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
*			forEach	[
*				[	//Default position 1
*					["o_apc_tracked_02_aa_f",[-5.34766,0.00170898,0.0160155],269.875,[],FALSE,FALSE,FALSE,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
*					["Land_BagFence_Long_F",[4.40967,0.370361,1.97424],90.3031,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-0.148926,-4.56372,1.97631],359.525,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_Big_F",[4.13379,-2.6626,0],90.7398,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_Big_F",[-2.53564,-4.33911,0],0.0975143,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[4.49902,-2.26929,1.97631],90.598,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-0.512695,5.02344,1.97631],358.147,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_Big_F",[-2.56104,4.60205,0],0.0975143,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[4.39453,2.92847,1.97631],90.598,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_Big_F",[4.11523,3.62256,0],90.7398,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-3.11328,-4.57031,1.94209],359.525,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-3.31396,4.88892,1.92097],358.147,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[4.53809,-4.98926,1.97631],90.598,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[4.35352,5.50195,1.97631],268.777,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-5.95508,-4.61401,1.97631],359.525,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-6.25146,4.67578,1.97631],358.147,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_Big_F",[-6.66064,-4.52563,0],0.0975143,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_Big_F",[-6.92871,4.5105,0],0.0975143,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-8.82373,-4.66748,1.97631],178.6,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-9.09863,4.36987,1.97631],354.32,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_Big_F",[-10.1143,-0.00439453,0],89.696,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-10.2422,-0.533203,1.97631],268.662,[],FALSE,FALSE,TRUE,{}],  
*					["Land_BagFence_Long_F",[-10.3984,2.45923,1.97631],268.662,[],FALSE,FALSE,TRUE,{}], 
*					["Land_BagFence_Long_F",[-10.1797,-3.36719,1.97631],90.7058,[],FALSE,FALSE,TRUE,{}]
*				],	
*				[	//Default position 2
*					["o_apc_tracked_02_aa_f",[-5.34375,0.18335,0.0162873],271.02,[],FALSE,FALSE,FALSE,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
*					["Land_HBarrier_5_F",[3.14111,1.80811,1.68038],60.7709,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_5_F",[3.39551,-2.41772,1.48671],111.429,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[4.46582,-0.60083,0],2.39138,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[2.19922,4.54834,0],313.125,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_5_F",[0.175293,-5.50317,1.48671],161.266,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[0.260742,-5.64673,0],61.7147,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_5_F",[-0.186035,5.98926,1.72212],43.508,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_5_F",[-4.93555,-6.48071,1.48671],177.276,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_5_F",[-4.67627,7.81909,1.73503],0,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[-5.30225,7.54077,0],88.8767,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[-6.44092,-6.95825,0],91.1816,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_5_F",[-9.35107,-4.6416,1.48671],43.508,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_5_F",[-9.02881,5.9585,1.73503],315.682,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[-10.1343,5.11182,0],221.716,[],FALSE,FALSE,TRUE,{}], 
*					["Land_HBarrier_3_F",[-11.7642,0.106445,1.68878],268.63,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[-11.2412,-3.95605,0.181664],138.395,[],FALSE,FALSE,TRUE,{}], 
*					["Land_Rampart_F",[-12.501,0.236816,0],0.579887,[],FALSE,FALSE,TRUE,{}]
*				]	
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

if (worldName in ['Tanoa','Lingor3','Enoch']) exitWith {
	if ((random 1) > 0.333) then [
		{
			[
				["o_t_apc_tracked_02_aa_ghex_f",[-5.34766,0.143311,0.016685],270.378,[],FALSE,FALSE,FALSE,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
				["Land_BagFence_01_long_green_F",[4.104,0.0585938,2.01259],89.7138,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[0.0810547,-4.68604,1.9154],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[4.0498,2.4082,2.01259],269.377,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[0.28125,4.70337,1.96381],0.0261029,[],FALSE,FALSE,TRUE,{}],  
				["Land_BagFence_01_long_green_F",[4.13721,-2.48828,2.01259],89.7138,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-2.49365,-4.34351,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[4.24023,-2.72827,0],90.1508,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-2.3042,4.68652,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-2.81201,-4.47412,1.85721],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-2.59473,4.71655,1.84145],0.0261029,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[4.29883,3.45776,0],90.1508,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[4.18018,-5.10205,2.01259],89.7138,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[4.03125,5.3186,2.01259],269.874,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-5.58252,-4.48584,1.9154],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-5.54932,4.72998,1.96381],0.0261029,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-6.74072,-4.37427,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-6.59717,4.69678,0],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-8.31738,4.70923,1.96381],179.601,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-8.48779,-4.46411,1.9154],178.714,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-9.85986,0.136719,2.05747],92.9792,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_big_4_green_F",[-9.89404,0.758057,0],90.7865,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-9.70703,3.06982,2.09318],92.9792,[],FALSE,FALSE,TRUE,{}], 
				["Land_BagFence_01_long_green_F",[-9.8457,-2.80469,1.92252],268.615,[],FALSE,FALSE,TRUE,{}]
			]
		},
		{
			[
				["o_t_apc_tracked_02_aa_ghex_f",[2.54688,-0.0488281,-0.0447016],270.525,[],FALSE,FALSE,FALSE,(missionNamespace getVariable 'QS_fnc_createAAVehicle')], 
				["Land_HBarrier_01_line_3_green_F",[-4.61914,0.139893,1.17173],268.138,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[-1.78027,-4.44263,1.68432],219.983,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[-5.24414,0.261719,0],0.579887,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[-3.98438,-3.93115,0.177021],138.395,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[-2.87744,5.13672,0.167141],221.716,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[-3.28613,5.17041,1.6311],310.772,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[2.79346,-6.04395,1.66587],0,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[0.815918,-6.93335,0],91.1816,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[0.82959,7.38428,1.85543],352.72,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[1.95459,7.56567,0.00454473],88.8767,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[5.81592,6.39014,1.82709],24.0442,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[7.45996,-4.86206,1.67862],151.957,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[7.51758,-5.62183,0],61.7147,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[9.45605,4.57324,0],313.125,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[9.9917,3.24292,1.78129],49.3943,[],FALSE,FALSE,TRUE,{}], 
				["Land_HBarrier_01_line_5_green_F",[10.9458,-1.0271,1.64725],102.284,[],FALSE,FALSE,TRUE,{}], 
				["Land_Rampart_F",[11.7227,-0.575928,0.112813],2.39138,[],FALSE,FALSE,TRUE,{}]
			]
		}
	];
};
if ((random 1) > 0.333) then [
	{
		[
			["3as_FlakCannon",[-5.568,0.00201893,-0.0749998],270,[],false,false,false,(missionNamespace getVariable 'QS_fnc_createAAVehicle')],
			["Land_lsb_fob_hBarrierBig_4",[-6.93708,-5.08173,0],359.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_4",[-7.06359,5.20615,0],179.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_4",[4.09173,-0.827045,0],89.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[4.12606,4.2058,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[4.19917,-5.89204,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[4.1177,6.23431,0],87.8675,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[-1.83171,-4.93305,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[0.183506,-4.92327,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[-1.99863,5.19562,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[0.00174427,5.17263,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_4",[-10.1383,0.0541692,0],89.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_4",[-6.92595,-4.97008,0],179.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_4",[-7.05121,5.08056,0],359.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_4",[4.22211,-0.83338,0],269.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_4",[-10.0079,0.0478339,0],269.696,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[4.13782,4.19883,0],181.901,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[4.21093,-5.899,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[4.12945,6.22734,0],179.075,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[-1.81995,-4.94002,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[0.195263,-4.93024,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[-1.98688,5.18866,0],0,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierBig_1",[0.0135021,5.16566,0],0,[],false,false,true,{}],
			["3AS_Barricade_prop",[-2.19387,5.30233,-0.422065],285,[],false,false,true,{}],
			["3AS_Barricade_prop",[-8.06661,5.31384,-0.422065],255,[],false,false,true,{}],
			["3AS_Barricade_prop",[-1.97044,-5.06897,-0.422065],75,[],false,false,true,{}],
			["3AS_Barricade_prop",[-7.84317,-5.05736,-0.421821],105,[],false,false,true,{}],
			["3AS_Barricade_prop",[-10.8944,0.304437,-0.421821],180,[],false,false,true,{}],
			["3AS_Barricade_prop",[4.28387,-2.51608,-0.422065],0.000121236,[],false,false,true,{}],
			["3AS_Barricade_prop",[4.28463,3.18992,-0.422065],0.000122943,[],false,false,true,{}]
		]	
	},
	{
		[
			["3as_FlakCannon",[-6.56554,0.506189,-0.0833158],271.02,[],false,false,false,(missionNamespace getVariable 'QS_fnc_createAAVehicle')],
			["Land_Rampart_F",[4.30418,-1.06453,4.76837e-007],2.39138,[],false,false,true,{}],
			["Land_Rampart_F",[2.92031,5.23813,4.76837e-007],313.125,[],false,false,true,{}],
			["Land_Rampart_F",[0.117428,-5.78207,4.76837e-007],61.7147,[],false,false,true,{}],
			["Land_Rampart_F",[-3.80425,8.82866,4.76837e-007],260.885,[],false,false,true,{}],
			["Land_Rampart_F",[-6.89468,-7.48181,0.758486],91.1816,[],false,false,true,{}],
			["Land_Rampart_F",[-10.2247,5.68457,-0.849273],221.716,[],false,false,true,{}],
			["Land_Rampart_F",[-11.467,-3.34296,1.34063],138.395,[],false,false,true,{}],
			["Land_Rampart_F",[-12.2448,0.533831,-0.959597],0.579887,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierWall_4",[-3.98951,7.65204,-1.15356],182.505,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierWall_4",[1.25773,5.11241,-1.32401],216.58,[],false,false,true,{}],
			["Land_lsb_fob_hBarrier_3",[4.63943,1.8048,-0.451901],263.476,[],false,false,true,{}],
			["Land_lsb_fob_hBarrier_3",[4.07491,-2.411,-0.410527],288.85,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierWall_4",[-0.248396,-4.79771,-1.36013],336.165,[],false,false,true,{}],
			["Land_lsb_fob_hBarrierWall_4",[-6.36403,-6.41987,-0.943411],359.782,[],false,false,true,{}],
			["Land_lsb_fob_hBarrier_3",[-10.7294,-4.91491,-0.601785],41.4261,[],false,false,true,{}],
			["Land_lsb_fob_hBarrier_3",[-8.86499,6.9166,-0.415244],135.723,[],false,false,true,{}],
			["Land_lsb_fob_hBarrier_3",[-12.4991,1.39826,-0.325498],277.871,[],false,false,true,{}]
		]	
	}
];