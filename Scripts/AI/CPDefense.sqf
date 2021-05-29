private ["_group","_squad","_count","_n","_spawnpos","_pos", "_overallskill","_aimingskill","_spotskill","_unitsarray"];

_CP= _this select 0;
_CPL = _this select 1;
_RANGE = _this select 2;

_unitsarray = [];

_spawnpos = getPos _CP;

_n=0;

if ((_CPL getVariable "DAP_BF_PTOWNER")==0) then 
	{
		_group = createGroup EAST;
		_squad = DAP_BF_EAST_DEFENSESQUAD;
		_count= count DAP_BF_EAST_DEFENSESQUAD;
		
		if ((getPosATL _CP select 2)>0.25) then 
		{
			_spawnpos = [(_spawnpos select 0)+(5+(random 1))*sin(random(360)), (_spawnpos select 1)+(5+(random 1))*cos(random(360)), _spawnpos select 2];
		}
		else
		{
			_spawnpos = [(_spawnpos select 0)+(10+(random 5))*sin(random(360)), (_spawnpos select 1)+(10+(random 5))*cos(random(360)), 0];
		};
		
		_unit = _group createUnit [(_squad select 0), _spawnpos, [], 0, "FORM"];
		_unitsarray = _unitsarray + [_unit];
		
		_unit setRank "LIEUTENANT";
		_unit setSkill 0.45;
		if (DAP_BF_CUSTOMLOADOUT==1) then 
		{
			[_unit] execVM "Scripts\SP\CustomLoadout.sqf";
		};
		
		_n=1;
		while {(_n<_count)} do 
		{
			_unitType = (_squad select _n);
			if ((getPosATL _CP select 2)>0.25) then 
			{
				_spawnpos = [(_spawnpos select 0)+(5+(random 1))*sin(random(360)), (_spawnpos select 1)+(5+(random 1))*cos(random(360)), _spawnpos select 2];
			}
			else
			{
				_spawnpos = [(_spawnpos select 0)+(10+(random 5))*sin(random(360)), (_spawnpos select 1)+(10+(random 5))*cos(random(360)), 0];
			};
			_unit = _group createUnit [_unitType, _spawnpos, [], 0, "FORM"];
			_unitsarray = _unitsarray + [_unit];
			
			if (DAP_BF_CUSTOMLOADOUT==1) then 
			{
				[_unit] execVM "Scripts\SP\CustomLoadout.sqf";
			};
			sleep 1;
			_n=_n+1;
		};
		
				
	};
if ((_CPL getVariable "DAP_BF_PTOWNER")==1) then 
	{
		_group = createGroup WEST;
		_squad = DAP_BF_WEST_DEFENSESQUAD;
		_count= count DAP_BF_WEST_DEFENSESQUAD;
		
		if ((getPosATL _CP select 2)>0.25) then 
		{
			_spawnpos = [(_spawnpos select 0)+(5+(random 1))*sin(random(360)), (_spawnpos select 1)+(5+(random 1))*cos(random(360)), _spawnpos select 2];
		}
		else
		{
			_spawnpos = [(_spawnpos select 0)+(10+(random 5))*sin(random(360)), (_spawnpos select 1)+(10+(random 5))*cos(random(360)), 0];
		};
		
		_unit = _group createUnit [(_squad select 0), _spawnpos, [], 0, "FORM"];
		_unitsarray = _unitsarray + [_unit];
		
		_unit setRank "LIEUTENANT";
		_unit setSkill 0.45;
		if (DAP_BF_CUSTOMLOADOUT==1) then 
		{
			[_unit] execVM "Scripts\SP\CustomLoadout.sqf";
		};
		
		_n=1;
		while {(_n<_count)} do 
		{
			_unitType = (_squad select _n);
			if ((getPosATL _CP select 2)>0.25) then 
			{
				_spawnpos = [(_spawnpos select 0)+(5+(random 1))*sin(random(360)), (_spawnpos select 1)+(5+(random 1))*cos(random(360)), _spawnpos select 2];
			}
			else
			{
				_spawnpos = [(_spawnpos select 0)+(10+(random 5))*sin(random(360)), (_spawnpos select 1)+(10+(random 5))*cos(random(360)), 0];
			};
			_unit = _group createUnit [_unitType, _spawnpos, [], 0, "FORM"];
			_unitsarray = _unitsarray + [_unit];
			
			if (DAP_BF_CUSTOMLOADOUT==1) then 
			{
				[_unit] execVM "Scripts\SP\CustomLoadout.sqf";
			};
			sleep 1;
			_n=_n+1;
		};
		
	};
		
if (DAP_AIFAS==1) then {[(units _group)] execVM "DAPMAN\Init.sqf";};

_overallskill = DAP_BF_AI_OVERALLSKILL;
_aimingskill = DAP_BF_AI_AIMINGSKILL;
_spotskill = DAP_BF_AI_SPOTSKILL;

if (isNil("_overallskill")) then {_overallskill=-1;};
if (isNil("_aimingskill")) then {_aimingskill=-1;};
if (isNil("_spotskill")) then {_spotskill=-1;};

{
	if (alive _x) then 
	{
		_x addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];
		if (!(isNil("BIS_BC_dragDist"))) then {[_x] execVM "\ca\Modules\BC\data\scripts\BC_addActions.sqf";};
		_x allowFleeing 0;
	
		if (_overallskill!=-1) then { _x setSkill _overallskill;};
		if (_aimingskill!=-1) then 
		{
			_x setSkill ["aimingAccuracy",_aimingskill];
		};
		if (_spotskill!=-1) then 
		{
			_x setSkill ["spotDistance",_spotskill];
	
		};
	};
	
}ForEach units _group;

if (DAP_BF_AI_UNLIMITEDAMMO==1) then {{[_x] execVM "Scripts\AI\UNLIMITEDAMMO.sqf";}ForEach units _group;};

{
	if (!(alive _x)) then {[_x] execVM "Scripts\ClearBattlefield.sqf";};
	sleep 1;

}ForEach _unitsarray; 

[_group, _CP] execVM "Scripts\AI\AIDefensiveStrategy.sqf";