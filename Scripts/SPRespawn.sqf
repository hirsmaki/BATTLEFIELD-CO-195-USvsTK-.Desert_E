private ["_unitRank","_groupID","_geardata","_group","_squad","_unitsquad","_side","_spawnpos","_fakepos","_offset","_fakespawnpos","_respawntime","_issuqadleader"];

_unit = _this select 0;
_unitRank = rank _unit;
_groupID= _unit getVariable "DAP_BF_GROUPID";

_issuqadleader= _unit getVariable "DAP_BF_SQUADLEADER";
_unitsquad = _unit getVariable "DAP_BF_SP_SQUAD";

_geardata = _unit getVariable "DAP_BF_PLAYERLOADOUT";

if (isNil("_issuqadleader")) then {_issuqadleader=0;};

_startpos = _unit getVariable "DAP_BF_PLAYER_RESPAWNPOS";
_dir = _unit getVariable "DAP_BF_PLAYER_RESPAWNDIR";

_unitDir = getDir vehicle _unit;

enableTeamSwitch false; 

_type = typeOf _unit;
_side = getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side");

_fakepos = vehicle _unit modelToWorld [0,-3,0];
_offset = [0,-3,0];
_fakespawnpos = vehicle _unit modelToWorld [0,-100000,10000];

if (_unit != (vehicle _unit)) then 
	{
		_fakepos = vehicle _unit modelToWorld [0,-15,1];
		_offset = [0,-15,1];
		_fakespawnpos = vehicle _unit modelToWorld [0,-100000,10000];
	};

_fakeunit = createAgent ["Rabbit", _fakespawnpos, [], 0, "FORM"];

hideObject  _fakeunit;

_fakeunit allowDamage false;
_fakeunit enableSimulation false;

_fakeunit setPos _fakepos;
_fakeunit setDir _unitDir;

if ((vehicle _unit) == _unit) then 
{
	_fakeunit attachTo [_unit,_offset,"neck"];
}
else
{
	if ((vehicle _unit)isKindOf "LandVehicle") then 
	{
		_fakeunit attachTo [(vehicle _unit),_offset];
	};
};

addSwitchableUnit _fakeunit;
selectPlayer _fakeunit;
removeSwitchableUnit _fakeunit;

[_unit] execVM "Scripts\ClearBattlefield.sqf";

_respawntime = SP_RESPAWN_TIME;

if (isNil("_respawntime")) then {_respawntime=15;};

sleep _respawntime;

_sides = [east, west, resistance, civilian, nil, enemy, friendly, nil];
_group = createGroup (_sides select _side);

_newunit = _group createUnit [_type, _startpos, [], 0, "FORM"];
_newunit setDir _dir;

_group setGroupID _groupID;
_newunit setVariable ["DAP_BF_GROUPID", _groupID,true];

_newunit setVariable ["DAP_BF_PLAYER_RESPAWNPOS",_startpos,true];
_newunit setVariable ["DAP_BF_PLAYER_RESPAWNDIR",_dir,true];

if (DAP_BF_CUSTOMLOADOUT==1) then 
	{
		[_newunit] execVM "Scripts\SP\CustomLoadout.sqf";
	};

addSwitchableUnit _newunit;
selectPlayer _newunit;

_newunit setUnitRank _unitRank;

if (DAP_AIFAS==1) then {_newunit addEventHandler ["hit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];};

if (!(isNil("BIS_BC_dragDist"))) then {[group _newunit] execVM "ca\Modules\BC\data\scripts\BC.sqf";};

[_newunit, _startpos, _dir] execVM "Scripts\SP\PlayerSlot.sqf";

if (_issuqadleader==1) then {_unit setVariable ["DAP_BF_SQUADLEADER",1,true];};

deleteVehicle _fakeunit;

if (!(isNil("_unitsquad"))) then 
{
	_newunit setVariable ["DAP_BF_SP_SQUAD", _unitsquad, true];
};

if (!(isNil("_geardata"))) then 
{
	_newunit setVariable ["DAP_BF_PLAYERLOADOUT",_geardata];
};

if ((count DAP_BF_PLAYERSQUAD)>0) then 
{
	{
		if (!(alive _x)) then
		{
			DAP_BF_PLAYERSQUAD = DAP_BF_PLAYERSQUAD - [_x];
			_x setPos [0,0,-1000];
			deleteVehicle _x;
		}
		else
		{
			[_x] JoinSilent group player;
		};
	}ForEach DAP_BF_PLAYERSQUAD;
};

[_newunit] execVM "Scripts\Support\Common\Soldier.sqf";
[_newunit] execVM "Scripts\UI\OptionsManager.sqf";

enableTeamSwitch true;