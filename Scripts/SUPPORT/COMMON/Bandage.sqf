_unit = _this select 1;
_target = cursortarget;

if ((damage _unit)>0) then 
{
	_wounded = _unit;
	[nil, _unit, rSPAWN, [_unit], 
	{
		_man = _this select 0;
		_man playMove "AinvPknlMstpSlayWrflDnon_medic";
			
	}] call RE;
	
	sleep 5;
	
	if ((alive _wounded)and((damage _wounded) < 0.5)) then 
	{
		_wounded setDammage 0;
		[nil, _wounded,"loc", rSPAWN, [_wounded], 
		{
			_man = _this select 0;
			
			_man setHit ["hands",0];
			_man setHit ["legs",0];
			
		}] call RE;
	};
}
else
{
	_wounded = _target;
	if (_target isKindOf "CAManBase") then 
	{
		[nil, _unit, rSPAWN, [_unit,_target], 
		{
			_man = _this select 0;
			_victim = _this select 1;
		
			_man playMove "AinvPknlMstpSlayWrflDnon_medic";
			_victim playMove "AinvPknlMstpSlayWrflDnon_healed2";
			
		}] call RE;
	
		sleep 5;
	
		if ((alive _wounded)and((damage _wounded) < 0.5)) then 
		{
			_wounded setDammage 0;
			[nil, _wounded,"loc", rSPAWN, [_wounded], 
			{
				_man = _this select 0;
				
				_man setHit ["hands",0];
				_man setHit ["legs",0];
			
			}] call RE;
		};
	};
};
