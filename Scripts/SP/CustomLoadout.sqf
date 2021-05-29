_unit = _this select 0;

_type = typeOf _unit;

if (!(isClass(configFile>>"CfgPatches">>"ace_main"))) then 
{

if (isClass(configFile>>"CfgPatches">>"vilas_rw_forces")) then 
{
	switch (_type) do 
	{
	case "Alfa01": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "IR_Strobe_Target", "SmokeShellRed", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "Alfa1": {removeallWeapons _unit; _magazines =["100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "Alfa0002": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "Alfa0001": {removeallWeapons _unit; _magazines =["20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
	case "Alfa10": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "RPG18", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};			
	};

	switch (_type) do 
	{
	case "Alfa01": {_weapons =["vil_AK_74m_EOT_FSB", "vil_APS", "NVGoggles","Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	case "Alfa1": {_weapons =["Pecheneg", "vil_APS", "NVGoggles","Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	case "Alfa0002": {_weapons =["vil_AK_74m_gp_29", "vil_APS", "NVGoggles","Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	case "Alfa0001": {_weapons =["VSS_Vintorez", "vil_APS", "NVGoggles","Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	case "Alfa10": {_weapons =["vil_AK_74m_EOT_FSB", "RPG18", "vil_APS", "NVGoggles","Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	};
	
	if (!(isClass(configFile>>"CfgPatches">>"DAPRA"))) then 
	{
		switch (_type) do 
		{
		case "RU_Soldier": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier2": {removeallWeapons _unit; _magazines =["8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_GL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_AR": {removeallWeapons _unit; _magazines =["75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_MG": {removeallWeapons _unit; _magazines =["100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_LAT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "RPG18"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_AT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "Vil_PGO_PG7VL", "Vil_PGO_PG7VL", "Vil_PGO_PG7VL"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_HAT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "AT13"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_AA": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "igla"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_Officer": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell", "SmokeShellOrange", "SmokeShellBlue", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_SL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell", "SmokeShellOrange", "SmokeShellBlue", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_TL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShellOrange", "SmokeShellBlue", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_SMOKE_GP25", "1Rnd_SMOKE_GP25", "FlareWhite_GP25", "FlareRed_GP25"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_Medic": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_Marksman": {removeallWeapons _unit; _magazines =["10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RU_Soldier_Spotter": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	
		case "RUS_Soldier1": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "SmokeShell", "SmokeShell", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Soldier2": {removeallWeapons _unit; _magazines =["64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "HandGrenade_East", "HandGrenade_East", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Soldier3": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Soldier_GL": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "RPG18", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Soldier_TL": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Commander": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Soldier_Marksman": {removeallWeapons _unit; _magazines =["20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Soldier_Sab": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "PipeBomb", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		};

		switch (_type) do 
		{
		case "RU_Soldier": {_weapons =["VIL_AK_74M"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier2": {_weapons =["Saiga12K"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_GL": {_weapons =["VIL_AK_74M_GP"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_AR": {_weapons =["RPK_74"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_MG": {_weapons =["Pecheneg"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_LAT": {_weapons =["VIL_AK_74M", "RPG18"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_AT": {_weapons =["VIL_AK_74M", "Vil_RPG7V_PGO"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_HAT": {_weapons =["VIL_AK_74M", "MetisLauncher", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_AA": {_weapons =["VIL_AK_74M", "Igla", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_Officer": {_weapons =["VIL_AK_74M_P29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RU_Soldier_SL": {_weapons =["VIL_AK_74M_P29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_TL": {_weapons =["VIL_AK_74M_GP_29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_Medic": {_weapons =["VIL_AK_74M"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_Marksman": {_weapons =["SVD", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RU_Soldier_Spotter": {_weapons =["VIL_AK_74M_GP_29", "Makarov", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	
		case "RUS_Soldier1": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Soldier2": {_weapons =["Bizon_silenced", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Soldier3": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Soldier_GL": {_weapons =["VIL_VAL_C", "RPG18", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Soldier_TL": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Commander": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Soldier_Marksman": {_weapons =["VSS_Vintorez", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Soldier_Sab": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		};
	
	};
	
	if (!(isClass(configFile>>"CfgPatches">>"DAPRAD"))) then 
	{
		switch (_type) do 
		{
		case "RUS_Desert_Soldier": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier2": {removeallWeapons _unit; _magazines =["8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_GL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_AU": {removeallWeapons _unit; _magazines =["75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_MG": {removeallWeapons _unit; _magazines =["100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_LAT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "RPG18"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_AT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "Vil_PGO_PG7VL", "Vil_PGO_PG7VL", "Vil_PGO_PG7VL"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_HAT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "AT13"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_AA": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "igla"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_Officer": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell", "SmokeShellOrange", "SmokeShellBlue", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_SL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell", "SmokeShellOrange", "SmokeShellBlue", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_TL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShellOrange", "SmokeShellBlue", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_SMOKE_GP25", "1Rnd_SMOKE_GP25", "FlareWhite_GP25", "FlareRed_GP25"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_MD": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_Marksman": {removeallWeapons _unit; _magazines =["10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	
		case "RUS_Desert_Spec1": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "SmokeShell", "SmokeShell", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Spec2": {removeallWeapons _unit; _magazines =["64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "HandGrenade_East", "HandGrenade_East", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Spec3": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Spec_GL": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "RPG18", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Spec_TL": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Spec_COM": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Spec_Marksman": {removeallWeapons _unit; _magazines =["20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Spec_MD": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "SmokeShell", "SmokeShell", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RUS_Desert_Soldier_Sab": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "PipeBomb", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};			
		};

		switch (_type) do 
		{
		case "RUS_Desert_Soldier": {_weapons =["VIL_AK_74M"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier2": {_weapons =["Saiga12K"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_GL": {_weapons =["VIL_AK_74M_GP"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_AU": {_weapons =["RPK_74"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_MG": {_weapons =["Pecheneg"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_LAT": {_weapons =["VIL_AK_74M", "RPG18"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_AT": {_weapons =["VIL_AK_74M", "Vil_RPG7V_PGO"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_HAT": {_weapons =["VIL_AK_74M", "MetisLauncher", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_AA": {_weapons =["VIL_AK_74M", "Igla", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_Officer": {_weapons =["VIL_AK_74M_P29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Desert_Soldier_SL": {_weapons =["VIL_AK_74M_P29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_TL": {_weapons =["VIL_AK_74M_GP_29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_MD": {_weapons =["VIL_AK_74M"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Soldier_Marksman": {_weapons =["SVD", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
	
		case "RUS_Desert_Spec1": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Desert_Spec2": {_weapons =["Bizon_silenced", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Desert_Spec3": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Desert_Spec_GL": {_weapons =["VIL_VAL_C", "RPG18", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Desert_Spec_TL": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Spec_COM": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RUS_Desert_Spec_Marksman": {_weapons =["VSS_Vintorez", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Desert_Spec_MD": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RUS_Desert_Soldier_Sab": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		};
	};
	
	if ((isClass(configFile>>"CfgPatches">>"RW_Characters"))) then 
	{
		switch (_type) do 
		{
		case "RW_RU_Soldier": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier2": {removeallWeapons _unit; _magazines =["8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_74Slug", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_GL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_AR": {removeallWeapons _unit; _magazines =["75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "75Rnd_545x39_RPK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_MG": {removeallWeapons _unit; _magazines =["100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "100Rnd_762x54_PK", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_LAT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "RPG18"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_AT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "Vil_PGO_PG7VL", "Vil_PGO_PG7VL", "Vil_PGO_PG7VL"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_HAT": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "AT13"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_AA": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "igla"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_Officer": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell", "SmokeShellOrange", "SmokeShellBlue", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_SL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell", "SmokeShellOrange", "SmokeShellBlue", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov", "8Rnd_9x18_Makarov"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_TL": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShellOrange", "SmokeShellBlue", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_HE_GP25", "1Rnd_SMOKE_GP25", "1Rnd_SMOKE_GP25", "FlareWhite_GP25", "FlareRed_GP25"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_Medic": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_Marksman": {removeallWeapons _unit; _magazines =["10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "10Rnd_762x54_SVD", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RU_Soldier_Spotter": {removeallWeapons _unit; _magazines =["30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "30Rnd_545x39_AK", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	
		case "RW_RUS_Soldier1": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "SmokeShell", "SmokeShell", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RUS_Soldier2": {removeallWeapons _unit; _magazines =["64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "64Rnd_9x19_SD_Bizon", "HandGrenade_East", "HandGrenade_East", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RUS_Soldier3": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RUS_Soldier_GL": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "RPG18", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RUS_Soldier_TL": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RUS_Commander": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellBlue", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "LaserBatteries"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RUS_Soldier_Marksman": {removeallWeapons _unit; _magazines =["20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "20Rnd_9x39_SP5_VSS", "HandGrenade_East", "HandGrenade_East", "SmokeShell", "SmokeShellOrange", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		case "RW_RUS_Soldier_Sab": {removeallWeapons _unit; _magazines =["VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "VIL_20Rnd_9x39_SP6_VAL", "PipeBomb", "PipeBomb", "PipeBomb", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps", "vil_20Rnd_9x18_aps"]; {_unit addMagazine _x}ForEach _magazines;};
		};

		switch (_type) do 
		{
		case "RW_RU_Soldier": {_weapons =["VIL_AK_74M"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier2": {_weapons =["Saiga12K"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_GL": {_weapons =["VIL_AK_74M_GP"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_AR": {_weapons =["RPK_74"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_MG": {_weapons =["Pecheneg"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_LAT": {_weapons =["VIL_AK_74M", "RPG18"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_AT": {_weapons =["VIL_AK_74M", "Vil_RPG7V_PGO"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_HAT": {_weapons =["VIL_AK_74M", "MetisLauncher", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_AA": {_weapons =["VIL_AK_74M", "Igla", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_Officer": {_weapons =["VIL_AK_74M_P29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RW_RU_Soldier_SL": {_weapons =["VIL_AK_74M_P29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_TL": {_weapons =["VIL_AK_74M_GP_29", "Makarov", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_Medic": {_weapons =["VIL_AK_74M"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_Marksman": {_weapons =["SVD", "NVGoggles", "Binocular"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RU_Soldier_Spotter": {_weapons =["VIL_AK_74M_GP_29", "Makarov", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	
		case "RW_RUS_Soldier1": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RW_RUS_Soldier2": {_weapons =["Bizon_silenced", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RW_RUS_Soldier3": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RW_RUS_Soldier_GL": {_weapons =["VIL_VAL_C", "RPG18", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RW_RUS_Soldier_TL": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RUS_Commander": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "LaserDesignator"]; {_unit addWeapon _x}ForEach _weapons;};
		case "RW_RUS_Soldier_Marksman": {_weapons =["VSS_Vintorez", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		case "RW_RUS_Soldier_Sab": {_weapons =["VIL_VAL_C", "vil_APS", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};	
		};
	
	};
};

if (isClass(configFile>>"CfgPatches">>"CAWeapons")) then 
{

	switch (_type) do 
	{	
	case "US_Soldier_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_B_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_AMG_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_AAR_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_AHAT_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_AAT_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Light_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "HandGrenade_West", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};								
			
	case "US_Soldier_GL_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203", "1Rnd_HE_M203"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Officer_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "IR_Strobe_Target", "SmokeShellRed", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_SL_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "SmokeShell", "SmokeShell", "IR_Strobe_Target", "SmokeShellGreen", "15Rnd_9x19_M9", "15Rnd_9x19_M9", "15Rnd_9x19_M9", "15Rnd_9x19_M9"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_TL_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "IR_Strobe_Target", "SmokeShellGreen", "15Rnd_9x19_M9", "15Rnd_9x19_M9", "15Rnd_9x19_M9", "15Rnd_9x19_M9", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_LAT_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "M136"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_AT_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "MAAWS_HEAT", "MAAWS_HEDP", "HandGrenade_West", "HandGrenade_West"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_HAT_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "Javelin"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_AA_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "Stinger"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Medic_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_AR_EP1": {removeallWeapons _unit; _magazines =["200Rnd_556x45_M249", "200Rnd_556x45_M249", "200Rnd_556x45_M249", "200Rnd_556x45_M249", "200Rnd_556x45_M249", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_MG_EP1": {removeallWeapons _unit; _magazines =["100Rnd_762x51_M240", "100Rnd_762x51_M240", "100Rnd_762x51_M240", "100Rnd_762x51_M240", "100Rnd_762x51_M240", "SmokeShell", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Spotter_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "HandGrenade_West", "HandGrenade_West", "IR_Strobe_Target", "smokeshellYellow"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Sniper_EP1": {removeallWeapons _unit; _magazines =["5Rnd_762x51_M24", "5Rnd_762x51_M24", "5Rnd_762x51_M24", "5Rnd_762x51_M24", "5Rnd_762x51_M24", "5Rnd_762x51_M24", "5Rnd_762x51_M24", "5Rnd_762x51_M24", "HandGrenade_West", "HandGrenade_West", "smokeshell", "smokeshellgreen", "15Rnd_9x19_M9", "15Rnd_9x19_M9", "15Rnd_9x19_M9", "15Rnd_9x19_M9"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_SniperH_EP1": {removeallWeapons _unit; _magazines =["10Rnd_127x99_m107", "10Rnd_127x99_m107", "10Rnd_127x99_m107", "10Rnd_127x99_m107", "10Rnd_127x99_m107", "10Rnd_127x99_m107", "10Rnd_127x99_m107", "10Rnd_127x99_m107", "HandGrenade_West", "HandGrenade_West", "smokeshell", "smokeshellgreen", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911", "7Rnd_45ACP_1911"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Engineer_EP1": {removeallWeapons _unit; _magazines =["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "Mine", "Mine", "HandGrenade_West", "SmokeShell"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Pilot_EP1": {removeallWeapons _unit; _magazines =["30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "SmokeShellRed", "SmokeShellGreen"]; {_unit addMagazine _x}ForEach _magazines;};
	case "US_Soldier_Crew_EP1": {removeallWeapons _unit; _magazines =["30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "30Rnd_9x19_MP5", "SmokeShellRed", "SmokeShellGreen"]; {_unit addMagazine _x}ForEach _magazines;};
	};

	switch (_type) do 
	{	
	case "US_Soldier_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_B_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_AMG_EP": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_AAR_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_AHAT_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_AAT_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Light_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
						
	case "US_Soldier_GL_EP1": {_weapons =["M4A1_RCO_GL", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Officer_EP1": {_weapons =["M4A1_Aim", "Colt1911", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_SL_EP1": {_weapons =["M4A1_Aim", "NVGoggles", "Binocular_Vector", "M9"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_TL_EP1": {_weapons =["M4A1_Aim", "NVGoggles", "Binocular_Vector", "M9"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_LAT_EP1": {_weapons =["M4A1_Aim", "NVGoggles", "M136"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_AT_EP1": {_weapons =["M4A1_Aim", "NVGoggles", "MAAWS"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_HAT_EP1": {_weapons =["M4A1_Aim", "NVGoggles",  "Javelin"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_AA_EP1": {_weapons =["M4A1_Aim", "Stinger", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Medic_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_AR_EP1": {_weapons =["M249", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_MG_EP1": {_weapons =["m240_scoped_EP1", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Spotter_EP1": {_weapons =["M4A3_CCO_EP1", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Sniper_EP1": {_weapons =["M24_des_EP1", "M9", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};			
	case "US_Soldier_SniperH_EP1": {_weapons =["M107", "Colt1911", "NVGoggles", "Binocular_Vector"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Engineer_EP1": {_weapons =["M4A1_Aim", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Pilot_EP1": {_weapons =["MP5A5", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	case "US_Soldier_Crew_EP1": {_weapons =["MP5A5", "NVGoggles"]; {_unit addWeapon _x}ForEach _weapons;};
	};
};
		
if (PrimaryWeapon _unit != "") then 
{
	_unit selectWeapon (primaryWeapon _unit);
}
else
{
	reload _unit;
};

};