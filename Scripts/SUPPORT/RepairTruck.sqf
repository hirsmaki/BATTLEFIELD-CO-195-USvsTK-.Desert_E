_Truck = _this select 0;

sleep 1;

_Truck allowDamage false;

_Truck setVariable ["DAP_VEHICLE_NOLIFT",1,true];

if ((isServer)or(isDedicated)) then 
{

	While {true} do 
	{
		clearWeaponCargoGlobal _Truck;
		clearMagazineCargoGLobal _Truck;
	
		_Truck setRepairCargo 1;

		 sleep 300; 
	};
};