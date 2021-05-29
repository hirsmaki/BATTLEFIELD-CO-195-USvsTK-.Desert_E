private ["_n","_tn","_delay","_state"];

_vehicle = _this select 0;
_respawnpos = _this select 1;
_dir = _this select 2;

_vehicletype = typeOf _vehicle;

_delay = 300;
_state = 0;

if ((isServer)or(isDedicated)) then 
{
	waitUntil{!(isNil "BIS_fnc_init")};
	
	[nil, _vehicle, "per", rSPAWN, [_vehicle], 
	{
		_veh = _this select 0;
		//[_veh] execVM "Scripts\SP\VehicleState.sqf";
		
	}] call RE;
	
	if ((_vehicle isKindOf "UH60_Base") or (_vehicle isKindOf "Mi17_base") or (_vehicle isKindOf "CH47_base_EP1")) then 
	{

	waitUntil{!(isNil "BIS_fnc_init")};
	
		[nil, _vehicle, "per", rSPAWN, [_vehicle], 
		{
			_lifter = _this select 0;
			[_lifter] execVM "Scripts\Support\CargoManager.sqf";

		}] call RE;
	};
};

While {((alive _vehicle)and(_state==0))} do 
{
	WaitUntil {sleep (1+(random 1));(((_vehicle distance _respawnpos)>1)or(!(canMove _vehicle))or(!(alive _vehicle)))};
	
	_n = count (crew _vehicle);
	
	While {_n>0}do
	{
		sleep 5;
		{if(!(alive _x)) then {_x setPos (getPos _vehicle); deletevehicle _x;};sleep 1;}ForEach crew _vehicle;
		_n = count (crew _vehicle);
	};
	
	if ((_vehicle distance _respawnpos)>1) then {_delay = 300;};
	
	_tn=0;
	
	While {_tn<_delay} do
	{
		sleep 5;
		_tn = _tn+5;
		
		if ((!(canMove _vehicle)) and ((_vehicle distance _respawnpos)<=DAP_BF_CARGOSEARCHRANGE)) then 
		{
			_delay = 60;
		};
		
		_vehiclestate = _vehicle getVariable "DAP_VEHICLE_ATTACHED";
							 
		if (!(isNil("_vehiclestate"))) then {_tn=0;};
	};
	
	if ((count (crew _vehicle)==0) and ((_vehicle distance _respawnpos)>1)) then {_state=1;};
	if ((count (crew _vehicle)==0) and (!(canMove _vehicle))) then {_state=1;};
	
	if (_state==1) then 
	{
		if ((_vehicle distance _respawnpos)>DAP_BF_CARGOSEARCHRANGE) then 
		{
			_Entities = (getPos _vehicle) nearEntities [["CAManBase","Air","LandVehicle"],DAP_BF_CARGOSEARCHRANGE];
			
			if (({isPlayer _x}count _Entities) > 0) then 
			{
				_state=0;
			};
		};
	};
	
};

{if(!(alive _x)) then {_x setPos (getPos _vehicle); deletevehicle _x;};sleep 1;}ForEach crew _vehicle;

[_vehicle,_vehicletype,_respawnpos,_dir]execVM "Scripts\SP\DeleteEmptyVehicle.sqf";