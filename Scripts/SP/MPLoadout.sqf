if (DAP_BF_CUSTOMLOADOUT==1) then 
{
	[player] execVM "Scripts\SP\CustomLoadout.sqf";
};
if (PrimaryWeapon _unit != "") then 
{
	_unit selectWeapon (primaryWeapon _unit);
}
else
{
	if (SecondaryWeapon _unit != "") then
		{
			_unit selectWeapon (primaryWeapon _unit);
		};
};

player addMPEventHandler ["MPRespawn",{ [(_this select 0)] execVM "Scripts\SP\CustomLoadout.sqf";}];