_armory = _this select 0;
_side = _this select 1;

sleep 1;

_armory addaction [localize "STR_ARMORY_SAVELOADOUT", "Scripts\Support\SaveLoadout.sqf", [],0,false,true];
_armory addaction [localize "STR_ARMORY_LOADLOADOUT", "Scripts\Support\Loadloadout.sqf", [],0,false,true];

if ((isServer)or(isDedicated)) then 
{

	While {true} do 
	{
		if (_side==0)then 
		{
			clearMagazineCargoGlobal _armory;
			clearWeaponCargoGlobal _armory;
	
			{_armory addWeaponCargoGlobal _x;}ForEach EASTWEAPONS;
			{_armory addMagazineCargoGlobal _x;} ForEach EASTMAGAZINES;
		};
 
 		if (_side==1)then 
 		{
			clearMagazineCargoGlobal _armory;
			clearWeaponCargoGlobal _armory;
	
			{_armory addWeaponCargoGlobal _x;}ForEach WESTWEAPONS;
			{_armory addMagazineCargoGlobal _x;} ForEach WESTMAGAZINES;
		};
 		
 		sleep 600;
 	};
};




