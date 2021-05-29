private ["_side"];

_position = _this select 0;
_unit = _this select 1;

if((side group(_unit))==EAST) then {_side=0;};
if((side group(_unit))==WEST) then {_side=1;};

if(_side == 0) then {[player, nil, rSIDERADIO,"REQUEST_EAST"] call RE;};
if(_side == 1) then {[player, nil, rSIDERADIO,"REQUEST_WEST"] call RE;};

_markertype = "mil_warning";
_markersize=[0.75,0.75];
_markername=format["%1_ARTY_REQ",player];
_markercolor = "ColorRed";
_markertext = "STR_MARK_ART_RQ";

if(_side ==0)then {DAP_BF_EAST_ARTY_REQUESTSTATE=1;publicVariable "DAP_BF_EAST_ARTY_REQUESTSTATE";};
if(_side ==1)then {DAP_BF_WEST_ARTY_REQUESTSTATE=1;publicVariable "DAP_BF_WEST_ARTY_REQUESTSTATE";};

[_side,_position,_markertype,_markersize,_markername,_markercolor,_markertext,1] execVM "Scripts\UI\RequestMarkerManager.sqf";

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
				[_pos]execVM "Scripts\SUPPORT\ARTILLERY\EASTArtilleryHQ.sqf";
			};
			if((DAP_BF_WEST_COMMSTATE == "AI") and (_team == 1)) then 
			{
				[_pos]execVM "Scripts\SUPPORT\ARTILLERY\WESTArtilleryHQ.sqf";
			};
		};
					
	}] call RE;
}
else
{
	if((DAP_BF_EAST_COMMSTATE == "AI") and (_side == 0)) then 
	{
		[_position]execVM "Scripts\SUPPORT\ARTILLERY\EASTArtilleryHQ.sqf";
	};
	if((DAP_BF_WEST_COMMSTATE == "AI") and (_side == 1)) then 
	{
		[_position]execVM "Scripts\SUPPORT\ARTILLERY\WESTArtilleryHQ.sqf";
	};
};