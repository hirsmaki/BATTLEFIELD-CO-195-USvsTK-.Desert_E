_side = _this select 0;
_position = _this select 1;
_markertype = _this select 2;
_markersize = _this select 3;
_markername = _this select 4;
_markercolor = _this select 5;
_markertext = _this select 6;
_type= _this select 7;

_marker = createMarkerLocal [_markername, _position];
_marker setMarkerShapeLocal "ICON";
_markername setMarkerTypeLocal _markertype;
_markername setMarkerSizeLocal _markersize;
_markername setMarkerColorLocal _markercolor;
_markername setMarkerTextLocal (localize _markertext);

if (_type==1) then 
{
	if (_side ==0) then 
	{
		WaitUntil {((DAP_BF_EAST_ARTY_REQUESTSTATE==2)or(str(side player)!="EAST"));};
	}
	Else
	{
		WaitUntil {((DAP_BF_WEST_ARTY_REQUESTSTATE==2)or(str(side player)!="WEST"));};
	};
};
if (_type==2) then 
{
	if (_side ==0) then 
	{
		WaitUntil {((DAP_BF_EAST_UAV_REQUESTSTATE==2)or(str(side player)!="EAST"));};
	}
	Else
	{
		WaitUntil {((DAP_BF_WEST_UAV_REQUESTSTATE==2)or(str(side player)!="WEST"));};
	};
};
if (_type==3) then 
{ 
	if (_side ==0) then 
	{
		WaitUntil {((DAP_BF_EAST_SUP_REQUESTSTATE==2)or(str(side player)!="EAST"));};
	}
	Else
	{
		WaitUntil {((DAP_BF_WEST_SUP_REQUESTSTATE==2)or(str(side player)!="WEST"));};
	};
};

deleteMarkerLocal _markername;