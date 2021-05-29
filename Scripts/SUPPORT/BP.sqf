private ["_freeSpace","_neededSpace","_usedSpace","_weapons","_slot"];

_unit = (_this select 1);
_type = (_this select 3) select 0;

removeBackpack _unit;
sleep 0.5;
if (!(_type == "")) then 
{
	
	_usedSpace = 0;
	_weapons = weapons _unit;

	{
	_slot = getNumber (configFile >> "cfgWeapons" >> _x >> "type");
	if ((_slot >= 1) && (_slot <= 16)) then 
		{
			_usedSpace = _usedSpace + _slot;
		};
	} foreach _weapons;

	if (_usedSpace<4) then 
	{
		_unit addBackpack _type;
	} 
	else 
	{
			HintSilent localize "STR_NOSPACEBACKPACK";
	};
	
};

