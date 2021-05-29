_unit = (_this select 0);
_vehicle = vehicle _unit;
_faction = faction _unit;


if(_unit isKindOf "Man" and _faction in westFactions) then {Wscore = Wscore - 1};
if(_unit isKindOf "Man" and _faction in eastFactions) then {Escore = Escore - 1};



if ((vehicle _unit) == _unit) then
{
	sleep 60;
	While {(!(isNull _unit))} do 
	{
		deleteVehicle _unit;
		sleep 60;
	};
}
else
{
	sleep 60;
	While {(!(isNull _unit))} do 
	{
		
		if (_unit in crew _vehicle) then 
		{
			_unit setPos [0,0,-1000];
		};
		deleteVehicle _unit;
		sleep 15;
	};
	
	
};


