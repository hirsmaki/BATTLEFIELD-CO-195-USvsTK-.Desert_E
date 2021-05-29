private ["_unitbackpack","_backpack","_backpackMagazines","_backpackWeapons"];

_unit = _this select 1;

if (local _unit) then 
{
	_unitbackpack  = (unitBackpack _unit);
		
	if (isNull _unitbackpack) then 
	{
		_backpack = "NULL";
		_backpackMagazines = [];
		_backpackWeapons = [];
	}
	else
	{
		_backpack = typeOf _unitbackpack;
		
		_backpackWeapons = getWeaponCargo _unitbackpack;
		_backpackMagazines = getMagazineCargo _unitbackpack;
	};
	
	_unit setVariable ["DAP_BF_PLAYERLOADOUT",[(weapons _unit),(magazines _unit),_backpack,_backpackWeapons,_backpackMagazines],true];
	HintSilent localize "STR_ARMORY_LOADOUTWASSAVED";
	
	sleep 5;
	
	HintSilent "";
};