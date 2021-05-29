private ["_loadout","_weapons","_magazines","_usedSpace","_slot"];

_unit = _this select 1;

if (local _unit) then 
{
	_loadout = _unit getVariable "DAP_BF_PLAYERLOADOUT";
	if (isNil("_loadout")) then 
	{
		HintSilent localize "STR_ARMORY_NOSAVEDLOADOUT";
		
		sleep 5;
		
		HintSilent "";
	}
	else
	{
		_weapons = _loadout select 0;
		_magazines = _loadout select 1;
		_backpack = _loadout select 2;
		_backpackWeapons = _loadout select 3;
		_backpackMagazines = _loadout select 4;
		
		removeAllWeapons _unit;
		
		{_unit addMagazine _x;}ForEach _magazines;
		{_unit addWeapon _x;}ForEach _weapons;
		
		if (PrimaryWeapon _unit != "") then 
		{
			_unit selectWeapon (primaryWeapon _unit);
		}
		else
		{
			_unit selectWeapon ((weapons _unit) select 0);
		};
		
		_usedSpace = 0;
		{
			_slot = getNumber (configFile >> "cfgWeapons" >> _x >> "type");
			if ((_slot >= 1) && (_slot <= 16)) then 
			{
				_usedSpace = _usedSpace + _slot;
			};
		} foreach _weapons;

		if ((_usedSpace>4)or(SecondaryWeapon _unit != "")) then 
		{
			removeBackpack _unit;
		};
		
		if (_backpack != "NULL") then 
		{
			removeBackpack _unit;
			
			_unit addBackpack _backpack;
			
			_unitbackpack  = (unitBackpack _unit);
			
			if ((count _backpackWeapons) >0) then 
			{
				_WeaponTypes = _backpackWeapons select 0;
				_WeaponCount = _backpackWeapons select 1;
				
				{
					_number = _WeaponCount select _ForEachIndex;
					_unitbackpack addWeaponCargoGlobal [_x,_number];
					
				}ForEach _WeaponTypes;
			};
			
			if ((count _backpackMagazines) >0) then 
			{
				_MagazinesTypes = _backpackMagazines select 0;
				_MagazinesCount = _backpackMagazines select 1;
				
				{
					_number = _MagazinesCount select _ForEachIndex;
					_unitbackpack addMagazineCargoGlobal [_x,_number];
					
				}ForEach _MagazinesTypes;
			};			
		}
		else
		{
			removeBackpack _unit;
		};	
	};
};