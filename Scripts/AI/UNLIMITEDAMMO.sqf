_unit = vehicle (_this select 0);
_unit addEventHandler ["fired", 
	{
	if ((((_this select 0) ammo (_this select 1))==0) or (((_this select 0) ammo (_this select 2))==0))then 
	{
		if ((_this select 0) isKindOf "MAN") then 
		{
			(_this select 0) addMagazine (_this select 5);
			if (((_this select 1)=="throw") or ((_this select 1)=="put")) then {reload (_this select 0);};
		}
		else
		{
			(_this select 0) setVehicleAmmo 1;
		};
	};
	}];