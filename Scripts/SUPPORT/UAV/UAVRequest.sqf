private ["_side"];

_position = _this select 0;
_unit = _this select 1;

if((side group(_unit))==EAST) then {_side=0;};
if((side group(_unit))==WEST) then {_side=1;};

if(_side == 0) then {[player, nil, rSIDERADIO,"UAVREQUEST_EAST"] call RE;};
if(_side == 1) then {[player, nil, rSIDERADIO,"UAVREQUEST_WEST"] call RE;};

_markertype = "mil_warning";
_markersize=[0.75,0.75];
_markername=format["%1_UAV_REQ",player];
_markercolor = "ColorBlue";
_markertext = "STR_MARK_UAV_RQ";

if(_side ==0)then {DAP_BF_EAST_UAV_REQUESTSTATE=1;publicVariable "DAP_BF_EAST_UAV_REQUESTSTATE";};
if(_side ==1)then {DAP_BF_WEST_UAV_REQUESTSTATE=1;publicVariable "DAP_BF_WEST_UAV_REQUESTSTATE";};

[_side,_position,_markertype,_markersize,_markername,_markercolor,_markertext,2] execVM "Scripts\UI\RequestMarkerManager.sqf";

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
			if((DAP_BF_EAST_COMMSTATE == "AI") and (_team == 0)) then 
			{
				[_pos,0]execVM "Scripts\SUPPORT\UAV\UAV.sqf";
			};
			if((DAP_BF_WEST_COMMSTATE == "AI") and (_team == 1)) then 
			{
				[_pos,1]execVM "Scripts\SUPPORT\UAV\UAV.sqf";
			};
		};
					
	}] call RE;
}
else
{
	if((DAP_BF_EAST_COMMSTATE == "AI") and (_side == 0)) then 
	{
		[_position,0]execVM "Scripts\SUPPORT\UAV\UAV.sqf";
	};
	if((DAP_BF_WEST_COMMSTATE == "AI") and (_side == 1)) then 
	{
		[_position,1]execVM "Scripts\SUPPORT\UAV\UAV.sqf";
	};
};