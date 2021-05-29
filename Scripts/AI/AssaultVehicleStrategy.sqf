private ["_COM","_ALLCP","_WPPOS","_FIRSTCP","_UNCAPTUREDCP","_CP","_BH","_dist","_side","_vpl","_vehwp","_x","_group","_position","_taskstate","_cparea","_nearunits","_enemyside","_countenemy","_randommode","_vehicleatbase","_playercrew","_aistartduration"];

_vehicle = _this select 0;
_crew = _this select 1;
_respawnpos = _this select 2;
_dir = _this select 3;
_group =_this select 4;
_crewtype = _this select 5;
_strategytype = _this select 6;

if (({isPlayer _x}count (crew _vehicle))==0) then 
{
	if (_vehicle isKindOf "Su25_base") then 
	{
		_vehicle removeWeapon "R73Launcher_2";
	};

	if (_vehicle isKindOf "A10") then 
	{
		_vehicle removeWeapon "SidewinderLaucher_AH1Z";
	};
};

_aistartduration = _vehicle getVariable "DAP_VEHICLE_STARTDURATION";
if (isNil("_aistartduration")) then {_aistartduration=0;};

sleep _aistartduration;

sleep 5;

_vehicletype = typeOf _vehicle;

_vpl=0;
_taskstate=1;
_vehicleatbase=0;

_side= getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "side");

_ALLCP = ACP;
_WPPOS = AVEHWP;

if ((isServer)or (isDedicated)) then {

if (_side==0) then {_COM=DAP_BF_EAST_COMMANDER;};
if (_side==1) then {_COM=DAP_BF_WEST_COMMANDER;};

_COM hcsetgroup [_group,""];

if (_side==0) then 
	{
	_FIRSTCP = EASTFCP;
	};

if (_side==1) then	
	{
	_FIRSTCP = WESTFCP;
	};

_vpl = floor(random(count _FIRSTCP));
_CP = (_FIRSTCP select _vpl); 
_vpl = (_ALLCP find _CP);
_position = (_WPPOS select _vpl);

if (_CP getVariable "DAP_BF_PTOWNER"==_side) then
{
	_UNCAPTUREDCP = _ALLCP;

	{
		if (_x getVariable "DAP_BF_PTOWNER"==_side) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_x];};
		sleep 1;
	
	}ForEach _ALLCP;

	if (count(_UNCAPTUREDCP)==0) then {_UNCAPTUREDCP = _ALLCP;};

	_CP = (_UNCAPTUREDCP select 0);
	_dist = _vehicle distance (getPos _CP);

	{
		if ((_vehicle distance _x)<_dist) then {_dist = _vehicle distance _x;_CP = _x;};
		sleep 1;

	}ForEach _UNCAPTUREDCP;
};


_vpl = _ALLCP find _CP;
_position = (_WPPOS select (_vpl));


if (!(isPlayer _COM)) then 
	{
	
		_vehwp = _group addWaypoint [_position,0];
		
		if ((_CP getVariable "DAP_BF_PTOWNER"==_side) and (DAP_BF_ASSAULTMODE!=1)) then 
		{
			[_group, 1] setWaypointType "MOVE";
		}
		else
		{
			[_group, 1] setWaypointType "SAD";
		};

		if (!(_vehicle isKindOf "AIR") and (DAP_BF_ASSAULTMODE!=1)) then
		{
			[_group, 1] setWaypointBehaviour "SAFE";
		};
	
		if (!(_vehicle isKindOf "AIR")) then {_group LockWP true;};
	}
	else
	{
		_taskstate=0;
	};
	
sleep 5;

While {alive _vehicle} do 
{
	
	if (_side==0) then {_COM=DAP_BF_EAST_COMMANDER;};
	if (_side==1) then {_COM=DAP_BF_WEST_COMMANDER;};

	_COM hcsetgroup [_group,""];
	
	if (_vehicle isKindOf "AIR") then 
	{
		WaitUntil {sleep 1;((UnitReady _vehicle) or (count(crew _vehicle)==0) or (!(canFire _vehicle)) or (!(canMove _vehicle)) or (!(alive _vehicle)));};
	};
	
	if ((alive _vehicle) and (canFire _vehicle) and (canMove _vehicle)) then 
	{
	
		if (!(_vehicle isKindOf "AIR")) then 
		{

			if (_CP getVariable "DAP_BF_PTOWNER"==_side) then 
			{

				_UNCAPTUREDCP = _ALLCP;

				{
					if (_x getVariable "DAP_BF_PTOWNER"==_side) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_x];};
					sleep 1;
					
				}ForEach _ALLCP;

				if (count(_UNCAPTUREDCP)==0) then {_UNCAPTUREDCP = _ALLCP;};

				_CP = (_UNCAPTUREDCP select 0);
				_dist = _vehicle distance (getPos _CP);

				{
					if ((_vehicle distance _x)<_dist) then {_dist = _vehicle distance _x;_CP = _x;};
					sleep 1;
					
				}ForEach _UNCAPTUREDCP;
	
				_vpl = _ALLCP find _CP;
				_position = (_WPPOS select (_vpl));
				_taskstate=0;
			};	
		}
		Else
		{
			_cparea = _CP getVariable "DAP_BF_CPAREA";
	
			if (_side == 0) then {_enemyside=WEST};
			if (_side == 1) then {_enemyside=EAST};
	
			_nearunits = [getPos _vehicle select 0, getPos _vehicle select 1,0] nearEntities _cparea;
			_countenemy = _enemyside countSide _nearunits;
	
			if ((_CP getVariable "DAP_BF_PTOWNER"==_side)or(_CP getVariable "DAP_BF_PTOWNER"==5)or(_countenemy==0)or(_vehicleatbase==1)) then 
			{
			
				_vehicleatbase=0;
			
				_UNCAPTUREDCP = _ALLCP;

				{
					if (_x getVariable "DAP_BF_PTOWNER"==_side) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_x];};
					if (_x getVariable "DAP_BF_PTOWNER"==5) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_x];};
					sleep 1;
	
				}ForEach _ALLCP;
			
				if (count(_UNCAPTUREDCP)>0) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_CP];};
			
				if (count(_UNCAPTUREDCP)==0) then 
					{
						_UNCAPTUREDCP = _ALLCP;
						{
							if (_x getVariable "DAP_BF_PTOWNER"==_side) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_x];};
							sleep 1;
							
						}ForEach _ALLCP;
					};
			
				if (count(_UNCAPTUREDCP)>0) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_CP];};
			
				if (count(_UNCAPTUREDCP)==0) then 
					{
						_UNCAPTUREDCP = _ALLCP;
					};

				if (count(_UNCAPTUREDCP)>1) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_CP];};
			
				_CP = (_UNCAPTUREDCP select 0);
				_dist = _vehicle distance (getPos _CP);

				_randommode = (random 10); 
				if (_randommode>5) then 
				{
					{
						if ((_vehicle distance _x)<_dist) then {_dist = _vehicle distance _x;_CP = _x;};
						sleep 1;
	
					}ForEach _UNCAPTUREDCP;
				}
				else
				{
					_vpl = floor(random(count _UNCAPTUREDCP));
					_CP = (_UNCAPTUREDCP select _vpl); 
				};
				
				_vpl = _ALLCP find _CP;
				_position = (_WPPOS select (_vpl));
				_taskstate=0;
			};
			
		};

		if (!(isPlayer _COM) and (_taskstate==0)) then 
			{
			
				deleteWaypoint [_group, 1];
			
				_vehwp = _group addWaypoint [_position,0];
			
				[_group, 1] setWaypointType "SAD";

				if (!(_vehicle isKindOf "AIR") and (DAP_BF_ASSAULTMODE!=1)) then
				{
					[_group, 1] setWaypointBehaviour "SAFE";
				}
				else
				{
					[_group, 1] setWaypointBehaviour "AWARE";
				};

				if (!(_vehicle isKindOf "AIR")) then {_group LockWP true;};

				_taskstate=1;
			};
		
		if (_vehicle isKindOf "Helicopter") then
		{
			if ((!(someAmmo _vehicle)) or ((fuel _vehicle)<=0.25)) then 
			{
				deleteWaypoint [_group, 1];
			
				_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
						
				if (alive _vehicle) then {sleep 5;};
					
				if  (((count(units _group)==0) or (count(crew _vehicle)==0) or (!(canMove _vehicle))) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; {doStop _x}ForEach units _group;sleep 30; _vehicle setDammage 1;};
			
				WaitUntil {sleep 1;((unitReady _vehicle) or (((count(units _group)==0) or (count(crew _vehicle)==0) or (!(canMove _vehicle))) or (!(canMove _vehicle))))};
					
				_vehicle land "LAND";
						
				if (alive _vehicle) then {sleep 5;};
			
				if ((count(crew _vehicle)==0) or (!(canFire _vehicle)) or (!(canMove _vehicle))) then {sleep 30;};
	
				if  ((count(crew _vehicle)==0) or (!(canFire _vehicle)) or (!(canMove _vehicle)))then {_vehicle setDammage 1;};
	
				WaitUntil {sleep 1;((!(isEngineOn _vehicle)) or (((count(units _group)==0) or (count(crew _vehicle)==0) or (!(canMove _vehicle))) or (!(canMove _vehicle))));};
					
				if (alive _vehicle) then {sleep 30;};
			
				WaitUntil {sleep 1;((SomeAmmo _vehicle) or (count(crew _vehicle)==0) or (!(canFire _vehicle))or (!(canMove _vehicle)));};		
						
				WaitUntil {sleep 1;(((fuel _vehicle)==1) or (count(crew _vehicle)==0) or (!(canFire _vehicle)) or (!(canMove _vehicle)));};
			
				_vehicleatbase=1;
			
				if ((count(crew _vehicle)==0) or (!(canFire _vehicle)) or (!(canMove _vehicle))) then {sleep 30;};
	
				if ((count(crew _vehicle)==0) or (!(canFire _vehicle)) or (!(canMove _vehicle)))then {_vehicle setDammage 1;};
			};
		};
	}
	else
	{
		{doStop _x} ForEach units _group;
		
		sleep 30;
	
		_vehicle setDammage 1;
	};
	sleep (10+(random 5));
	
	if ((_vehicle EmptyPositions "Driver") >0) then {_vehicle setDammage 1;};
};

if (!(alive _vehicle)) then {{sleep 1; _x setDammage 1;}ForEach units _group;};

WaitUntil {sleep 1;(count(units _group)==0)};

deleteGroup _group;

[_vehicle,_vehicletype,_respawnpos,_crewtype,_dir,_strategytype] execVM "Scripts\DeleteVehicles.sqf";

};