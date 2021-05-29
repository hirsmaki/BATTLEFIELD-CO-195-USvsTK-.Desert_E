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

DAP_BF_EAST_DEFENSESQUAD=["TK_Soldier_SL_EP1","TK_Soldier_HAT_EP1","TK_Soldier_MG_EP1","TK_Soldier_AT_EP1","TK_Soldier_AA_EP1","TK_Soldier_EP1","TK_Soldier_EP1"];
DAP_BF_WEST_DEFENSESQUAD=["US_Soldier_SL_EP1","US_Soldier_HAT_EP1","US_Soldier_AR_EP1","US_Soldier_LAT_EP1","US_Soldier_AA_EP1","US_Soldier_EP1","US_Soldier_EP1"]; 
RUG_DSAI_SIDES = ["RUG_DSAIArab","RUG_DSAI","RUG_DSAIArab","RUG_DSAIArab","RUG_DSAIArab"];


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

respawnDelay = 2;

westinfC = 
{
	private ["_eastInf","_grp","_unit","_unitL","_count","_type","_null"];
	_westInf = 70;
	while {_westInf > 0} do 
		{
			_grp = grpNull;
			_unit = objNull;
			_unitL = objNull;
			_count = count DAP_BF_WEST_DEFENSESQUAD;

			//Create team leader first
			_grp = createGroup (WEST);
			_pos = getMarkerPos "respawn_west";
			_type = DAP_BF_WEST_DEFENSESQUAD select 0;
			_unitL = _grp createUnit [_type, _pos, [], 10, "FORM"];
			Sleep 0.2;
			_unitL setSkill 1;
			_unitL allowFleeing 0;
			_westInf = _westInf-1; 
			Sleep 0.1;

			_i = 0; 
			for [{ _i = 0}, {_i < 7}, {_i = _i + 1}] do 
			{
				_type = DAP_BF_WEST_DEFENSESQUAD select round(random _count)-1;
				_unit = _grp createUnit [_type, _pos, [], 20, "FORM"];
				Sleep respawnDelay;
				_unit setSkill 1;
				_unit allowFleeing 0;
				_westInf = _westInf-1; 
				Sleep 0.1;
			}; 
			WESTCOM hcsetgroup [_grp,""];
			_null= [_unitL,1] execVM "Scripts\SquadInit.sqf";
		};
};

eastInfC = 
	{
	private ["_eastInf","_grp","_unit","_unitL","_count","_type","_null"];
	_eastInf = 70;
	while {_eastInf > 0} do 
		{
			_grp = grpNull;
			_unit = objNull;
			_unitL = objNull;
			_count = count DAP_BF_EAST_DEFENSESQUAD;

			//Create team leader first
			_grp = createGroup (EAST);
			_pos = getMarkerPos "respawn_east";
			_type = DAP_BF_EAST_DEFENSESQUAD select 0;
			_unitL = _grp createUnit [_type, _pos, [], 10, "FORM"];
			Sleep 0.2;
			_unitL setSkill 1;
			_unitL allowFleeing 0;
			_eastInf = _eastInf-1; 
			Sleep 0.1;

			_i = 0; 
			for [{ _i = 0}, {_i < 7}, {_i = _i + 1}] do 
			{
				_type = DAP_BF_EAST_DEFENSESQUAD select round(random _count)-1;
				_unit = _grp createUnit [_type, _pos, [], 20, "FORM"];
				Sleep respawnDelay;
				_unit setSkill 1;
				_unit allowFleeing 0;
				_eastInf = _eastInf-1; 
				Sleep 0.1;
			}; 
			EASTCOM hcsetgroup [_grp,""];
			_null= [_unitL,0] execVM "Scripts\SquadInit.sqf";
		};
};

_nul = [] spawn westinfC;
_nul = [] spawn eastinfC;

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