_unit = _this select 0;

if (local _unit) then 
{
	if (isPlayer _unit) then 
	{
		_squadstatus = _unit addAction [localize "STR_DAP_BF_SQUAD_STATUS", "Scripts\Support\SquadStatus.sqf", [0],0,false,true];		
		
		if (isMultiplayer) then 
		{
			_options = _unit addAction [localize "STR_DAP_BF_OPTIONS_ACTION", "Scripts\UI\Options.sqf", [0],0,false,true];
		};
		
		WaitUntil {sleep 1; (!(alive _unit));};
		
		if (isMultiplayer) then 
		{
			_unit removeAction _options;
		};

		_unit removeAction _squadstatus;
	};

};