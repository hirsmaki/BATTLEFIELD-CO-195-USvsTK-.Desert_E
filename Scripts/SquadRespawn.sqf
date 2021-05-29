private ["_group","_squad","_side","_spawnpos","_pos","_n"];

_spawnpos = _this select 0;
_squadtype = _this select 1;
_side = _this select 2;
_squad = _this select 3;

_count = count _squad;

_sides = [east, west, resistance, civilian, nil, enemy, friendly, nil];
_group = createGroup (_sides select _side);

_n=0;
_pos = [(_spawnpos select 0), (_spawnpos select 1), (_spawnpos select 2)];

_unit = _group createUnit [(_squad select 0), _pos, [], 0, "FORM"];
_unit setRank "LIEUTENANT";
_unit setSkill 0.45;
if (DAP_BF_CUSTOMLOADOUT==1) then 
{
	[_unit] execVM "Scripts\SP\CustomLoadout.sqf";
};

_unit setDir (random(360));

_n=1;
while {(_n<_count)} do 
	{
		
		_pos = [(_spawnpos select 0)+(random 5)*sin(random(360)), (_spawnpos select 1)+(random 5)*cos(random(360)), (_spawnpos select 2)];
		_unitType = (_squad select _n);
		_unit = _group createUnit [_unitType, _pos, [], 0, "FORM"];
		if (DAP_BF_CUSTOMLOADOUT==1) then 
		{
			[_unit] execVM "Scripts\SP\CustomLoadout.sqf";
		};
		_n=_n+1;
	};

if (DAP_AIFAS==1) then {[(units _group)] execVM "DAPMAN\Init.sqf";};

{
	_x addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];
	if (!(isNil("BIS_BC_dragDist"))) then {[_x] execVM "\ca\Modules\BC\data\scripts\BC_addActions.sqf";};
	_x allowFleeing 0;
	
}ForEach units _group;

if (DAP_BF_CUSTOMLOADOUT==1) then 
	{
		{
			[_x] execVM "Scripts\SP\CustomLoadout.sqf";
			
		}ForEach units _group;
	};

if (DAP_BF_AI_UNLIMITEDAMMO==1) then {{[_x] execVM "Scripts\AI\UNLIMITEDAMMO.sqf";}ForEach units _group;};

[(leader _group),_side,_squadtype,_spawnpos, _squad] execVM "Scripts\AI\AIOffensiveStrategy.sqf";

