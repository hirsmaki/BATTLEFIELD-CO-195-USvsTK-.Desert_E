_vehicle = _this select 0;
_vehicletype = _this select 1;
_respawnpos = _this select 2;
_dir = _this select 3;

if (!(alive _vehicle)) then 
{
	sleep 60;
};

While {(!(isNull _vehicle))} do 
{
	deleteVehicle _vehicle;
	sleep 30;
};

sleep 60;
[_vehicletype,_respawnpos,_dir]execVM "Scripts\SP\SpawnEmptyVehicle.sqf";