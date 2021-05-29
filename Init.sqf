#include "Settings\CombatArea.hpp"
#include "Settings\MissionSettings.hpp"

#include "Settings\AddonsConfigurator.hpp"

eBleedBias = 1;
wBleedBias = 1;
tBleedSide = sideEmpty;
westFactions = 
[
	"USMC",
	"CDF",	
	"BIS_US",
	"BIS_CZ",
	"BIS_GER",
	"BIS_BAF"
];
eastFactions = 
[
	"INS",
	"RU",
	"BIS_TK",
	"BIS_TK_INS"
];



if (isMultiplayer) then 
{
	MAXTIME = paramsArray select 0;
	PublicVariable "MAXTIME";
	MAXSCORE = paramsArray select 1;
	PublicVariable "MAXSCORE";
	
	DAP_BF_PLAYERSMARKERS = paramsArray select 4;
	PublicVariable "DAP_BF_PLAYERSMARKERS";
	
	DAP_BF_AI_ENABLED = paramsArray select 5;
	PublicVariable "DAP_BF_AI_ENABLED";
	DAP_BF_AI_UNLIMITEDAMMO = paramsArray select 6;
	PublicVariable "DAP_BF_AI_UNLIMITEDAMMO";
	
	if (DAP_BF_AI_ENABLED==1) then 
	{
	DAP_BF_SPAWNDEFENCESQUAD = paramsArray select 7;
	PublicVariable "DAP_BF_SPAWNDEFENCESQUAD";
	}
	else
	{
		DAP_BF_SPAWNDEFENCESQUAD = 0;
		PublicVariable "DAP_BF_SPAWNDEFENCESQUAD";
	};
		
	setViewDistance (paramsArray select 2);
	setTerrainGrid (paramsArray select 3);
	
	if ((isServer)or(isDedicated)) then
	{
		_CurrentDate = date;
		setDate [(_CurrentDate select 0), (_CurrentDate select 1), (_CurrentDate select 2), (paramsArray select 9), 0];
	};
	
	[player] execVM "Scripts\SP\MPLoadout.sqf";
}
Else
{
	MAXSCORE=3000;
	PublicVariable "MAXSCORE";
	MAXTIME=3600;
	PublicVariable "MAXTIME";
	
	[player] execVM "Scripts\SP\MPSquad.sqf";
};

"respawn_east" setMarkerAlpha 0;
"respawn_west" setMarkerAlpha 0;

if ((isServer)or(isDedicated)) then
{
	if (MAXTIME>0) then {[MAXTIME]execVM "Scripts\UI\Timer.sqf";};
	DAP_BF_MISSIONEND=0;
	PublicVariable "DAP_BF_MISSIONEND";
	EASTWIN = 0;
	PublicVariable "EASTWIN";
	WESTWIN = 0;
	PublicVariable "WESTWIN";
	MISSIONDRAW=0;
	PublicVariable "MISSIONDRAW";
};

5 CutText ["","BLACK FADED",1];

finishMissionInit;

dap_mission_loaded = 0;
onPreloadStarted 
{ 
	dap_mission_loaded = 0;
}; 
onPreloadFinished 
{ 
	dap_mission_loaded = 1;
};
bleedBias = 
{
_captor = _this select 0;
_flagState = _this select 1; //captured from who?

	switch (_captor) do
	{
		case WEST: 
		{
			if(_flagState == 2) then {eBleedBias = eBleedBias -1;};
			wBleedBias = wBleedBias +1;
		};

		case EAST:
		{
			if(_flagState == 1) then {wBleedBias = wBleedBias -1;};
			eBleedBias = eBleedBias +1;
		};
	};

	_biasSum = eBleedBias + wBleedBias;

	//Start bleed system after 2 towns captured
	if(_biasSum > 3) then 
	{
		//Calculate ticket bleed, when 40% or less flags owned, bleed tickets

		if(eBleedBias*100/_biasSum <= 40) then {tBleedSide = EAST};
		if(wBleedBias*100/_biasSum <= 40) then {tBleedSide = WEST};
	};
};
waitUntil {dap_mission_loaded == 1};

if (!(isDedicated)) then
{
	DAP_ROLL_KEYCHECK = compile preprocessFile "Scripts\SP\RollKey.sqf";
	(findDisplay 46) displayAddEventHandler ["keyDown","_this call DAP_ROLL_KEYCHECK"];
	
	[] execVM "Briefing.sqf";
	[] execVM "Scripts\UI\Intro.sqf";
	[player] execVM "Scripts\Support\Common\Soldier.sqf";
	
	if (isMultiplayer) then 
	{
		player addEventHandler ["Respawn", 
		{
			[(_this select 0)] execVM "Scripts\Support\Common\Soldier.sqf";
			[(_this select 1)] execVM "Scripts\ClearBattlefield.sqf";
				
			(_this select 0) setVariable ["BIS_BC_HASACTIONS", nil,true];
				
			[nil, nil, "per",rSPAWN, [(_this select 0)], 
			{
				_newunit = _this select 0;
				[_newunit] execVM "\ca\Modules\BC\data\scripts\BC_addActions.sqf";
									
			}] call RE;
		}];
	};
};

sleep 2;

5 CutText ["","BLACK IN",5];

if (isMultiplayer) then 
{
	setPlayerRespawnTime (paramsArray select 8);
};

BIS_Effects_AirDestructionStage2=compile preprocessFileLineNumbers "Scripts\SP\AirDestruction.sqf";

ace_sys_vehicledamage_DisableT72CatastrophicDestruction = true;
PublicVariable "ace_sys_vehicledamage_DisableT72CatastrophicDestruction";

ace_sys_wounds_all_medics = false;
PublicVariable "ace_sys_wounds_all_medics";

if (!(isDedicated)) then
{

	if (MAXTIME>0) then {[MAXTIME]execVM "Scripts\UI\TimeCounter.sqf";};
	
	[] execVM "Scripts\UI\UISetup.sqf";
};