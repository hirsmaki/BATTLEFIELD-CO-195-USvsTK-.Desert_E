private ["_siden","_side"];

_barracks = _this select 0;
_caller = _this select 1;

_sides = [east, west, resistance, civilian, nil, enemy, friendly, nil];
_siden = _barracks getVariable "DAP_BF_BUILDINGSIDE";

if (isNil("_siden")) then {_siden=3;};

_side = (_sides select _siden);

if (side(group _caller) == _side) then 
{

	{
	
		if (!(alive _x)) then 
		{
			DAP_BF_PLAYERSQUAD = DAP_BF_PLAYERSQUAD - [_x];
			_x setPos [0,0,-1000];
			deleteVehicle _x;
		};
	
	
	}ForEach DAP_BF_PLAYERSQUAD;

	if ((count (units(group _caller)))<=1) then 
	{
		_squad = _caller getVariable "DAP_BF_SP_SQUAD";
		if (isNil("_squad")) then {_squad=[];};
		
		if ((count _squad)>0) then 
		{
			DAP_BF_PLAYERSQUAD = [];
		
			{
				_pos = (getPos player) findEmptyPosition [3,250]; 
				_newsquadmate = (group player) createUnit [_x, _pos, [], 5, "FORM"];
				_newsquadmate setSkill 1;
				_newsquadmate allowFleeing 0;
			
				DAP_BF_PLAYERSQUAD = DAP_BF_PLAYERSQUAD + [_newsquadmate];
				
				if (DAP_BF_CUSTOMLOADOUT==1) then 
				{
					[_newsquadmate] execVM "Scripts\SP\CustomLoadout.sqf";
				};
			
			}ForEach _squad;
		}
		else
		{
			HintSilent localize "STR_NOSQUADASSIGNED";
		};
	
	}
	else
	{
		HintSilent localize "STR_ALREADYHAVESQUAD";
	};
};