private ["_COM","_ALLCP","_WPPOS","_FIRSTCP","_UNCAPTUREDCP","_CP","_side","_squadtype","_pos","_dist","_pl","_grpwp","_x","_group","_leader","_actionstate","_position","_aliveunits","_overallskill","_aimingskill","_spotskill"];

_squadleader = _this select 0;
_side = _this select 1;
_squadtype = _this select 2;
_pos = _this select 3;
_squad =  _this select 4;

if (isNil("_squadtype")) then {_squadtype=0;};

_group = group _squadleader;

_taskstate=1;
_actionstate=0;

_baseunits = 0;
_aliveunits = [];
_aliveunits = units _group;

_count = count _squad;

_ALLCP = ACP;
_WPPOS = AINFWP;

if (_squadtype==1) then 
	{
	if (_side==0) then {_WPPOS=EASTSNPWP;};
	if (_side==1) then {_WPPOS=WESTSNPWP;};
	};

if ((isServer) or (isDedicated)) then {

_overallskill = DAP_BF_AI_OVERALLSKILL;
_aimingskill = DAP_BF_AI_AIMINGSKILL;
_spotskill = DAP_BF_AI_SPOTSKILL;

if (isNil("_overallskill")) then {_overallskill=-1;};
if (isNil("_aimingskill")) then {_aimingskill=-1;};
if (isNil("_spotskill")) then {_spotskill=-1;};

if (_squadtype==1) then {_aimingskill=1;};

{
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

}ForEach units _group;

if (_side==0) then 
	{
	_FIRSTCP = EASTFCP;
	};

if (_side==1) then	
	{
	_FIRSTCP = WESTFCP;
	};

_pl = floor(random(count _FIRSTCP));
_CP = (_FIRSTCP select _pl); 
_pl = _ALLCP find _CP;
_position = (_WPPOS select _pl);

if (_CP getVariable "DAP_BF_PTOWNER"==_side) then
{
_UNCAPTUREDCP = _ALLCP;

{
	if (_x getVariable "DAP_BF_PTOWNER"==_side) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_x];};
	
}ForEach _ALLCP;

if (count(_UNCAPTUREDCP)==0) then {_UNCAPTUREDCP = _ALLCP;};

_CP = (_UNCAPTUREDCP select 0);
_dist = (leader _group) distance (getPos _CP);

{
	if (((leader _group) distance _x)<_dist) then {_dist = ((leader _group) distance _x);_CP = _x;};

}ForEach _UNCAPTUREDCP;

_pl = _ALLCP find _CP;
_position = (_WPPOS select (_pl));
};

{_x setVariable ["DAP_BF_TARGETPOSITION",_pl,true];}ForEach units _group;

sleep (15+(random 5));

if (_side==0) then {_COM=DAP_BF_EAST_COMMANDER;};
if (_side==1) then {_COM=DAP_BF_WEST_COMMANDER;};

WaitUntil {sleep 1;((((leader _group) distance _CP)<DAP_BF_MAXFOOTRANGE)or(!(isNull(assignedVehicle (leader _group))))or(({alive _x} count (units _group))==0))};

WaitUntil {sleep 1;((isNull(assignedVehicle (leader _group)))or(!(alive (assignedVehicle (leader _group))))or(({alive _x} count (units _group))==0))};

if (!(isPlayer _COM) and (!(isPlayer (leader _group)))) then {_group move _position;};

While {(count (units _group)>0)} do 
{

	_COM hcsetgroup [_group,""];

	if (_side==0) then {_COM=DAP_BF_EAST_COMMANDER;};
	if (_side==1) then {_COM=DAP_BF_WEST_COMMANDER;};

	sleep (10+(random 5));

	if ((_CP getVariable "DAP_BF_PTOWNER"==_side)and(_taskstate==1)) then 
	{

		_UNCAPTUREDCP = _ALLCP;

		{
			if (_x getVariable "DAP_BF_PTOWNER"==_side) then {_UNCAPTUREDCP = _UNCAPTUREDCP - [_x];};
			sleep 1;
			
		}ForEach _ALLCP;

		if (count(_UNCAPTUREDCP)==0) then {_UNCAPTUREDCP = _ALLCP;};

		_CP = (_UNCAPTUREDCP select 0);
		_dist = (leader _group) distance (getPos _CP);

		{
			if (((leader _group) distance _x)<_dist) then {_dist = (leader _group) distance _x;_CP = _x;};
			sleep 1;

		}ForEach _UNCAPTUREDCP;

		_pl = _ALLCP find _CP;
		_position = (_WPPOS select (_pl));

		{_x setVariable ["DAP_BF_TARGETPOSITION",_pl,true];}ForEach units _group;
		_taskstate =0;
	};

	if (((leader _group) distance BLD <=50) and (_squadtype==0) and (_pl == 0) and (_taskstate ==1)and (_actionstate==0)) then {_actionstate=1;{dostop _x;}ForEach units _group; [_group] execVM "Scripts\AI\BuildingCapturePlan.sqf";};		

	if (!(isPlayer _COM) and (_taskstate == 0) and ((UnitReady (leader _group)) or ((currentCommand (leader _group))=="STOP"))) then 
	{
		{_x setBehaviour "AWARE";[_x] JoinSilent (group _x);}ForEach units _group;
		_group move _position;
		_taskstate =1;
		_actionstate=0;
	};

	sleep (5+(random 5));

};

WaitUntil {sleep 1;(count(units _group)==0)};

deleteGroup _group;

[_pos, _squadtype, _side, _squad] execVM "Scripts\SquadRespawn.sqf";

};