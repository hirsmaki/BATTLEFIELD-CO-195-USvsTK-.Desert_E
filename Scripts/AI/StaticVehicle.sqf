private ["_group","_vehiclecrew"];

_vehicle = _this select 0;
_crew = _this select 1;
_respawnpos = _this select 2;
_dir = _this select 3;
_group =_this select 4;
_crewtype = _this select 5;
_strategytype = _this select 6;

_side= getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "side");
_vehicletype = typeOf _vehicle;

_vehicle lock true;

[_vehicle] execVM "Scripts\AI\UNLIMITEDAMMO.sqf";

_overallskill = DAP_BF_AI_OVERALLSKILL;
_aimingskill = DAP_BF_AI_AIMINGSKILL;
_spotskill = DAP_BF_AI_SPOTSKILL;

if (isNil("_overallskill")) then {_overallskill=-1;};
if (isNil("_aimingskill")) then {_aimingskill=-1;};
if (isNil("_spotskill")) then {_spotskill=-1;};

{
	_squad = _squad + [typeOf _x];
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

}ForEach units _group;

_vehiclecrew = (units _group);

(driver _vehicle) stop true;
[(driver _vehicle)] joinSilent grpNull;

sleep 5;

if ((isServer)or (isDedicated)) then 
{
	While {alive _vehicle} do 
	{

		if ((behaviour (leader _group))!="COMBAT") then {_vehicle engineOn false;};
		_vehicle setFuel 100;
		if (!(canFire _vehicle)) then {_vehicle setDammage 1; {sleep 1;_x setDammage 1;}ForEach _vehiclecrew;};
		sleep 60;

	};

if (!(alive _vehicle)) then {{sleep 1; _x setDammage 1;}ForEach _vehiclecrew;};

WaitUntil {sleep 1;(count(units _group)==0)};

deleteGroup _group;

[_vehicle,_vehicletype,_respawnpos,_crewtype,_dir,_strategytype] execVM "Scripts\DeleteVehicles.sqf";

};