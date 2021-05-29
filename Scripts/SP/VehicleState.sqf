
_vehicle = _this select 0;
_allowedweapons = DAP_CREWALLOWEDWEAPONS;
_pilotclass = DAP_PILOTCLASS;

if (isMultiplayer) then 
{
	_vehicle addAction [localize "STR_DAP_BF_OPTIONS_ACTION", "Scripts\UI\Options.sqf", [0],0,false,true,"","((!(player == vehicle player))and(_target == (vehicle player)))"];
};

_vehicle addAction [localize "STR_DAP_BF_SQUAD_STATUS", "Scripts\Support\SquadStatus.sqf", [0],0,false,true,"","((!(player == vehicle player))and(_target == (vehicle player)))"];

if (_vehicle isKindOF "AIR") then 
{
	While {((!(isNull _vehicle))and(alive _vehicle))} do 
	{
		if (!(_vehicle isKindOF "Plane")) then 
		{
			if ((getPos _vehicle select 2)>3) then {_vehicle lock true;} else {_vehicle lock false;};
		};
		
		if (isMultiplayer) then 
		{
			if ((player == (driver _vehicle))or(player == (gunner _vehicle))or(player == (commander _vehicle))) then 
			{
				if (player == (driver _vehicle)) then 
				{
					if (player isKindOf _pilotclass) then 
					{
						if ((!((primaryWeapon player) in _allowedweapons))or(!((secondaryWeapon player) == ""))) then 
						{
							hintSilent (localize "STR_PILOTGEARRESTRICTION");
							player action ["getout",_vehicle];
						};
					}
					else
					{
						hintSilent (localize "STR_PILOTRESTRICTION");
						player action ["getout",_vehicle];
					};	
				}
				else
				{
					if ((player == (gunner _vehicle))or(player == (commander _vehicle))) then 
					{
						if ((_vehicle isKindOf "Plane")or(_vehicle isKindOf "AH1Z")or(_vehicle isKindOf "AH64_base_EP1")or(_vehicle isKindOf "Mi24_Base")or(_vehicle isKindOf "Kamov_Base")) then 
						{
							if (player isKindOf _pilotclass) then 
							{
								if ((!((primaryWeapon player) in _allowedweapons))or(!((secondaryWeapon player) == ""))) then 
								{
									hintSilent (localize "STR_PILOTGEARRESTRICTION");
									player action ["getout",_vehicle];
								};
							}
							else
							{
								hintSilent (localize "STR_PILOTRESTRICTION");
								player action ["getout",_vehicle];
							};
						};
					};
				};
			};
		};
				
		sleep 1;	
	};
}
else
{
	[_vehicle] execVM "Scripts\Support\Common\CargoInit.sqf";
};
