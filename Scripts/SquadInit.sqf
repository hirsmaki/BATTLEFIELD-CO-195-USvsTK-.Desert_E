private ["_type","_squad"];

_leader = _this select 0;
_side = _this select 1;
_type = _this select 2;

_group = group _leader;
_pos = _leader modelToWorld [0,0,0];

if (isNil("_type")) then {_type=0;};

sleep 1;

_squad= [];

if (DAP_BF_AI_ENABLED==1) then 
{

	{
		_x addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];
		_x allowFleeing 0;
		
		_squad = _squad + [typeOf _x];
		
	}ForEach units _group;

	if (DAP_BF_AI_UNLIMITEDAMMO==1) then {{[_x] execVM "Scripts\AI\UNLIMITEDAMMO.sqf";}ForEach units _group;};

	if (DAP_BF_CUSTOMLOADOUT==1) then 
		{
			{
				[_x] execVM "Scripts\SP\CustomLoadout.sqf";
			
			}ForEach units _group;
		};

	[_leader,_side,_type,_pos,_squad] execVM "Scripts\AI\AIOffensiveStrategy.sqf";
}
else
{
	if ((isServer)or(isDedicated)) then 
	{
		{deleteVehicle _x;}ForEach units _group;
	};
};