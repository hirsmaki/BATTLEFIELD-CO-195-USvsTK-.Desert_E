private ["_side"];

_position = _this select 0;
_unit = _this select 1;

if((side group(_unit))==EAST) then {_side=0;};
if((side group(_unit))==WEST) then {_side=1;};

if (isMultiplayer) then 
{
	waitUntil{!(isNil "BIS_fnc_init")};
	
	_targetpos = _position;
	_teamside = _side;
	
	[nil, _unit, rSPAWN, [_targetpos,_teamside], 
	{
		_pos = _this select 0;
		_team = _this select 1;
		 
		if ((isServer)or(isDedicated)) then 
		{
			if(_team == 0)then 
			{
				[_pos]execVM "Scripts\SUPPORT\ARTILLERY\EASTArtilleryHQ.sqf";
			};
			if(_team == 1)then 
			{
				[_pos]execVM "Scripts\SUPPORT\ARTILLERY\WESTArtilleryHQ.sqf";
			};
		};
					
	}] call RE;
}
else
{
	if(_side == 0) then 
	{
		[_position]execVM "Scripts\SUPPORT\ARTILLERY\EASTArtilleryHQ.sqf";
	};
	if(_side == 1) then 
	{
		[_position]execVM "Scripts\SUPPORT\ARTILLERY\WESTArtilleryHQ.sqf";
	};
};