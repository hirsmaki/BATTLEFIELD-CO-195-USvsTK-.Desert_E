_unit = _this select 0;

if (isMultiplayer) then 
{
	if (local _unit) then 
	{
		if (!(dialog)) then 
		{
			[nil, _unit, rSPAWN, [_unit],
			{		
				if ((isServer)or(isDedicated)) then 
				{
					_man = _this select 0;
					[_man] exec "DAPMAN\Scripts\Wounded\WoundedMain.sqs";
				};
	
			}] call RE;
		};
	};
}
else
{
	if (!(dialog)) then 
	{
		[_unit] exec "DAPMAN\Scripts\Wounded\WoundedMain.sqs";
	};
};