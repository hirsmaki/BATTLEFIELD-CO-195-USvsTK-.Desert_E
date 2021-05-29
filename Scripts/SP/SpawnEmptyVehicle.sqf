_vehicleclass= _this select 0;
_spawnpos = _this select 1;
_vehicleDir = _this select 2;

if ((isServer)or(isDedicated)) then 
{
	_vehicleType = _vehicleclass;
	_position = _spawnpos;
	_vehicle = createVehicle [_vehicleType, [_position select 0, _position select 1, 100000],[],0, "NONE"];
	
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
	
	_vehicle  setDir _vehicleDir;
	_vehicle setvelocity [0,0,0];
	_vehicle  setPos [_position select 0, _position select 1, 0.15];
	
	[_vehicle,_spawnpos,_vehicleDir] execVM "Scripts\SP\EmptyVehicle.sqf";
};