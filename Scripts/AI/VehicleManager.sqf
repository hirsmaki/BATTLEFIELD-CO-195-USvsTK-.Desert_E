private ["_playercrew","_overallskill","_aimingskill","_spotskill"];

_vehicle = _this select 0;
_crew = _this select 1;
_spawnpos = _this select 2;
_dir = _this select 3;
_group =_this select 4;
_crewtype = _this select 5;
_strategytype = _this select 6;

_cargospace = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "transportsoldier");

_overallskill = DAP_BF_AI_OVERALLSKILL;
_aimingskill = DAP_BF_AI_AIMINGSKILL;
_spotskill = DAP_BF_AI_SPOTSKILL;

if (isNil("_overallskill")) then {_overallskill=-1;};
if (isNil("_aimingskill")) then {_aimingskill=-1;};
if (isNil("_spotskill")) then {_spotskill=-1;};

//HA HA
//_vehicle lockDriver true;

{
	_x allowFleeing 0;
	if (_overallskill!=-1) then { _x setSkill _overallskill;};
	if (_aimingskill!=-1) then 
	{
		_x setSkill ["aimingAccuracy",_aimingskill];
	};
	if (_spotskill!=-1) then 
	{
		_x setSkill ["spotDistance",_spotskill];
	
	};

}ForEach crew _vehicle;

if (DAP_BF_AI_UNLIMITEDAMMO==1) then 
{
	_playercrew =0;
	{
		if (isPlayer _x) then {_playercrew=_playercrew+1;};
				
	}ForEach crew _vehicle;
		
	if (_playercrew==0) then {[_vehicle] execVM "Scripts\AI\UNLIMITEDAMMO.sqf";};
};

waitUntil{!(isNil "BIS_fnc_init")};
	
[nil, _vehicle, "per", rSPAWN, [_vehicle], 
{
	_veh = _this select 0;
	[_veh] execVM "Scripts\SP\VehicleState.sqf";
	
}] call RE;

if (_strategytype==0) then 
{
	if (canFire _vehicle) then 
	{
		[_vehicle, _crew,_spawnpos,_dir,_group,_crewtype,_strategytype] execVM "Scripts\AI\AssaultVehicleStrategy.sqf";
	}
	else
	{
		[_vehicle, _crew,_spawnpos,_dir,_group,_crewtype,_strategytype] execVM "Scripts\AI\TransportVehicleStrategy.sqf";
	};
};
if ((_strategytype==1) and (_cargospace>0)) then
{
	[_vehicle, _crew,_spawnpos,_dir,_group,_crewtype,_strategytype] execVM "Scripts\AI\TransportVehicleStrategy.sqf";
};
if (_strategytype==2) then
{
	[_vehicle, _crew,_spawnpos,_dir,_group,_crewtype,_strategytype] execVM "Scripts\AI\StaticVehicle.sqf";
};