private ["_markertype","_markersize","_markercolor","_markertext","_markername"];

_type = _this select 0;
_side = _this select 1;
_position = _this select 2;

if (_type==1) then 
{
	_markertype = "FireMission";
	_markersize=[0.75,0.75];
	if (_side ==0) then 
	{
		_markername="EASTARTYSTRIKE";
		_markercolor = "ColorRed";
		_markertext = localize "STR_MARK_ART";
	}
	Else
	{
		_markername="WESTARTYSTRIKE";
		_markercolor = "ColorRed";
		_markertext = localize "STR_MARK_ART";
	};
};
if (_type==2) then 
{
	_markertype = "FireMission";
	_markersize=[0.75,0.75];
	if (_side ==0) then 
	{
		_markername="EASTUAV";
		_markercolor = "ColorBlue";
		_markertext = localize "STR_MARK_UAV";
	}
	Else
	{
		_markername="WESTUAV";
		_markercolor = "ColorBlue";
		_markertext = localize "STR_MARK_UAV";
	};
};
if (_type==3) then 
{
	_markertype = "FireMission";
	_markersize=[0.75,0.75];
	if (_side ==0) then 
	{
		_markername="EASTSUPPLIES";
		_markercolor = "ColorGreen";
		_markertext = localize "STR_MARK_SUP";
	}
	Else
	{
		_markername="WESTSUPPLIES";
		_markercolor = "ColorGreen";
		_markertext = localize "STR_MARK_SUP";
	};
};

_marker = createMarkerLocal [_markername, _position];
_marker setMarkerShapeLocal "ICON";
_markername setMarkerTypeLocal _markertype;
_markername setMarkerSizeLocal _markersize;
_markername setMarkerColorLocal _markercolor;
_markername setMarkerTextLocal _markertext;

if (_type==1) then 
{
	if (_side ==0) then 
	{
		WaitUntil {((DAP_BF_EAST_ARTY_MARKERSTATE==0)or(str(side player)!="EAST"));};
	}
	Else
	{
		WaitUntil {((DAP_BF_WEST_ARTY_MARKERSTATE==0)or(str(side player)!="WEST"));};
	};
};
if (_type==2) then 
{
	if (_side ==0) then 
	{
		WaitUntil {((DAP_BF_EAST_UAV==0)or(str(side player)!="EAST"));};
	}
	Else
	{
		WaitUntil {((DAP_BF_WEST_UAV==0)or(str(side player)!="WEST"));};
	};
};
if (_type==3) then 
{ 
	if (_side ==0) then 
	{
		WaitUntil {((DAP_BF_EAST_SUP_MARKERSTATE==0)or(str(side player)!="EAST"));};
	}
	Else
	{
		WaitUntil {((DAP_BF_WEST_SUP_MARKERSTATE==0)or(str(side player)!="WEST"));};
	};
};

deleteMarkerLocal _markername;
