_StaticWeapon = _this select 0;
_ReloadTime = _this select 1;

private ["_ReloadTime"];

if (isNil("_ReloadTime")) then {_ReloadTime=15;};

_Ammo= magazines _StaticWeapon;
_n = count _Ammo;

While {_n>0}do
{
_StaticWeapon removeMagazine (_Ammo select _n);
_n=_n-1;
};

Reload _StaticWeapon;

While {true} do
{
if (!(someAmmo _StaticWeapon))then {_StaticWeapon setVehicleammo 1;};
WaitUntil {sleep 1;(!(someAmmo _StaticWeapon))};
sleep _ReloadTime;
};

