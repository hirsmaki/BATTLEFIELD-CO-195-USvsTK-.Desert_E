private ["_strategytype","_spawnpos","_vehicleDir","_vehicleClass"];

_vehicle = _this select 0;
_strategytype = _this select 1;

_spawnpos = _vehicle modelToWorld [0,0,0];
_vehicleDir = getDir _vehicle;

if (isNil("_strategytype")) then {_strategytype = 0;};

_strategytype = round(_strategytype);

if (_strategytype>2) then {_strategytype =0;};
if (_strategytype<0) then {_strategytype =0;};

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;

if (_vehicle isKindOf "Su25_TK_EP1") then 
{
	_weapons=["GSh301","Ch29Launcher","R73Launcher_2","S8Launcher","CMFlareLauncher"];
	_magazines = ["180Rnd_30mm_GSh301","4Rnd_Ch29","2Rnd_R73","80Rnd_S8T","120Rnd_CMFlareMagazine"];

	{_vehicle removeMagazine _x;}ForEach magazines _vehicle;
	{_vehicle removeWeapon _x;}ForEach weapons _vehicle;

	{_vehicle addMagazine _x;}ForEach _magazines;
	{_vehicle addWeapon _x;}ForEach _weapons;
};

if (_vehicle isKindOf "AH1Z") then 
{
	_vehicle removeWeapon "SidewinderLaucher_AH1Z";
	_vehicle removeMagazine "2rnd_Sidewinder_AH1Z";
};

sleep 1;

if (DAP_BF_AI_ENABLED==1) then 
{
	if (count(crew _vehicle)>0) then 
	{
		_group = (group (driver _vehicle)); 
		_crew = units _group;

		_spawnedcrewtype = (typeof ((crew _vehicle)select 0));

		_side= getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "side");

		{_x addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];}ForEach crew _vehicle;
	
		if (DAP_BF_CUSTOMLOADOUT==1) then 
		{
			{
				[_x] execVM "Scripts\SP\CustomLoadout.sqf";
				
			}ForEach crew _vehicle;
		};
		
		_vehicle setVariable ["DAP_VEHICLE_NOLIFT",1,true];
		
		if ((isServer)or(isDedicated)) then 
		{
			[_vehicle, _crew,_spawnpos,_vehicleDir,_group,_spawnedcrewtype,_strategytype] execVM "Scripts\AI\VehicleManager.sqf";
		};

	}
	else
	{
	
		if ((isServer)or(isDedicated)) then 
		{
			[_vehicle,_spawnpos,_vehicleDir] execVM "Scripts\SP\EmptyVehicle.sqf";
		};

	};
}
else
{
	if ((isServer)or(isDedicated)) then 
	{
		_vehicleClass = typeOf _vehicle;
		{deleteVehicle _x;}ForEach crew _vehicle;
		
		deleteVehicle _vehicle;
		WaitUntil {sleep 1;(isNull _vehicle);};
		
		[_vehicleClass,_spawnpos,_vehicleDir] execVM "Scripts\SP\SpawnEmptyVehicle.sqf";
	};
};