private ["_startpos","_safepos","_dir","_backpack"];
_unit = _this select 0;

_startpos = _unit getVariable "DAP_BF_PLAYER_RESPAWNPOS";
_dir = _unit getVariable "DAP_BF_PLAYER_RESPAWNDIR";

_safepos = [(_startpos select 0), (_startpos select 1),-1000];

_weapons = weapons _unit;	
_ammo = magazines _unit;

if (!(isMultiplayer)) then 
{
	_unit addEventHandler ["killed", {_this execVM "Scripts\SPRespawn.sqf"}];
};

While {(alive _unit)} do 
{
if (alive _unit) then 
{
_unit allowDamage false;
_unit setDamage 0;
_unit setHit ["hands",0];
_unit setHit ["legs",0];
_unit switchMove "";

_unit enableSimulation false;
_unit hideObject true;

removeallWeapons _unit;
{_unit addMagazine _x}ForEach _ammo;
{_unit addWeapon _x}ForEach _weapons;
_unit selectWeapon (primaryWeapon _unit);

_unit setPos _safepos;
_unit setDir _dir;
};

_backpack = getText(configFile >> "CfgVehicles" >> (typeOf _unit) >> "backpack") ;
if ((_backpack=="") or (isNil("_backpack"))) then 
{
	removeBackpack _unit;
}
else
{
	removeBackpack _unit;
	_unit addBackpack _backpack;
};

WaitUntil {((isPlayer _unit) or !(alive _unit));};

if (alive _unit) then 
{
_unit setPos _startpos;
_unit setDir _dir;

_unit enableSimulation true;
_unit hideObject false;
_unit allowDamage true;
};

WaitUntil {(!(isPlayer _unit) or !(alive _unit));};
};
