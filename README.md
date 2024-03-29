This repository is a fork of the Apex Framework originally written by Quiksilver.
```
Quiksilver
Apex Framework 1.3.5 (Stable) 14/10/2023 A3 2.14
by Quiksilver
( armacombatgroup@gmail.com )
( https://www.patreon.com/QS )
```

Its main goal is to create a playable Star Wars version of the Invade and Annex game mode, as it was my introduction to the game. This conversion is being made with the intent to be as true to the original game mode as possible while creating an immersive Star Wars environment.

Please be aware that this project has not actually been worked on in months at time of writing, so there may be issues with the current state of the mission file that I cannot recall. A copy of the to-do list is included in this repository, though it has not been revised for some time.

Some general notes of the current state are as follows:
```
-Blufor has mostly been configured.
	-Base needs a slight redesign
	-default loadouts need fixing
	-spawn positions need tinkering
	-Gitmo, speed limit areas, and MedEvac areas need to be moved.
	-AAA needs checking
-Opfor has not been configured; enemy still consists of CSAT and AAF.
	-exceptions include
		-Supply Depot
		-AAA Site 1
-TFAR can function
	-Edits must be made to arsenal.sqf to include all 1000 TFAR radio items
-ACE cannot function
	-Apex Framework introduces redundancies that can conflict with ACE.
	-ACE Interraction can be used to circumvent mission roles.
	-ACE Arsenal needs to be made compatible with QS Arsenal before introduction to the mission.
-Arsenal.sqf is likely outdated. Attachments are not configured
-Holdovers from original unit-specific themes need to be changed.
-
```

Quiksilver
Apex Framework 1.3.5 (Stable) 14/10/2023 A3 2.14
by Quiksilver
( armacombatgroup@gmail.com )
( https://www.patreon.com/QS )

Support
https://forums.bistudio.com/forums/topic/212240-apex-framework/
https://discord.gg/FfVaPce
https://community.bistudio.com/wiki/server.cfg

Apex Framework step-by-step setup guide:

Specific setup instruction will be revised after the project has been completed. Until that time, please be aware that the instructions below are for a TEST INSTANCE of Invade and Annex.

* Setup time: 60 minutes (longer for inexperienced admins).
* Server must be a Dedicated server. Not configured for local client hosting.
* Server must be running Windows x64, or Linux.

Video Setup Guide - https://www.youtube.com/watch?v=FCj2qyThCH0
_______________
For testing purposes:
0. Download the Arma 3 Server utility from steam and open the directiory. The remainder of the guide follows this path.

For servers meant to run the stable release:
0. Purchase a server and open the directory
_______________
1. Download the "Star_Wars_Frameword_Version135_Test005.altis.pbo" file.
_______________
2. Place mission PBO files in your servers MPMissions folder.
_______________
3a. Place @Apex folder in your servers ArmA3 directory. Reference: https://i.imgur.com/ijdXgg6.png

3b. Place @Apex_cfg folder in your servers A3 directory.Reference: https://i.imgur.com/ijdXgg6.png

3c. Find your steam workshop directory and COPY the mods you wish to use into your server directory. It is recommended to shorten the file names such that they are not truncated on server startup.
____________
4a. Copy the difficulty options from server.Arma3Profile file into your servers .arma3profile file. 
	Reference:   https://i.imgur.com/X71jy3z.png

4b. Ensure the difficulties are set correctly.
	Reference:   https://i.imgur.com/9NXqPnI.png
____________
5a. In your "server.cfg" file, ensure your server will load the correct difficulty options. Example:

--------------------------
```
class Missions {

  class apex_framework {

    template="Star_Wars_Frameword_Version135_Test005.altis";

    //template="Apex_framework_156.Tanoa";

    //template="Apex_framework_156.Malden";
    
    //template="Apex_framework_156.Enoch";
	
	//template="Apex_framework_156.Stratis";

    difficulty="Custom";

  };
};
```

```
forcedDifficulty = "Custom";
missionWhitelist[] = {"Star_Wars_Frameword_Version135_Test005.altis","Apex_framework_156.Altis","Apex_framework_156.Tanoa","Apex_framework_156.Malden","Apex_framework_156.Enoch","Apex_framework_156.Stratis"};
```

--------------------------

5b. Ensure that:    ```forcedDifficulty = "Custom";```

5c. At this time, also double check to ensure the mission template matches the mission you are trying to run.
_______________
6. In your "server.cfg" file, ensure you have a serverCommandPassword set. Example:

```serverCommandPassword = "abc123";```

Make note of the password you have (or created), you will need it now. Copy it to your clipboard.
_______________
7a. Open the new @Apex_cfg folder which you placed in your arma 3 directory.

7b. Open the "parameters.sqf" file.

7c. Locate this:

```_serverCommandPassword = "'abc123'";```

7d. Ignoring the " and ' quotations (do not touch them), copy your serverCommandPassword into that line as shown. See #7 to compare.

7e. Dont use that password!!!

7f. Ensure you change the admin login password in server.cfg. "passwordAdmin"
_______________
8. In the "parameters.sqf" file, locate this:

```_main_mission_type = 'NONE';```

Using the notes and examples posted beneath that line, select the mission type you want to run. Reference:   https://i.imgur.com/FI8tWHZ.png
_______________
9. As a final step before launching, copy the Arma 3 Invade and Annex server.bat file and place it in your server directory. Write or alter the following Parameters accordingly:
--------------------------
```
@echo off
"C:\DIRECTORTY\Arma 3 Server\arma3server_x64.exe"		//YOUR SERVER .EXE DIRECTORY***
"-profiles=C:\DIRECTORY\Arma 3 Server\Users"			//YOUR SERVER PROFILE DIRECTORY***
-name="server"											//Server name, leave as default
-cfg=basic.cfg											//Server basic config
-config=server.cfg										//Server config
-filePatching											//YOU MUST ENABLE FILE PATCHING***
-mod="@Mod1;@Mod2;@Mod3"								//The file name of each mod directory; copy file names
-servermod=@Apex										//SET SERVER MOD AS YOUR @APEX FOLDER***
-port=2302												//Server Port
-world=empty											//Set world to empty
```
--------------------------
_______________

Other notes:

- There are a few other options to choose inside that "parameters.sqf" file.
- Inside the "whitelist.sqf" file, you can set player UIDs to give them various permissions. Zeus and Developer permissions are located near the bottom. For Zeus you do not need to edit the mission file, the framework will generate a module on the fly as you log in.
- You can set custom chat messages inside the "chatMessages.sqf" file.
- Ingame admin tools are accessed with key-combo [Shift]+[F2]. For more info, view the map diary tab "Key bindings". 



