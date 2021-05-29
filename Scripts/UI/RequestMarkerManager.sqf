private ["_side","_position","_markertype","_markersize","_markercolor","_markertext","_type","_vehicleinit"];

_side = _this select 0;
_position = _this select 1;
_markertype = _this select 2;
_markersize = _this select 3;
_markername = _this select 4;
_markercolor = _this select 5;
_markertext = _this select 6;
_type = _this select 7;

if (_side==0) then 
{
	{
		
		if ((side(group _x)) == EAST) then 
			{
				if (_x == (vehicle _x)) then 
				{
				_vehicleinit = format ["null=[%1,%2,""%3"",%4,""%5"",""%6"",""%7"",%8] execVM ""Scripts\UI\RequestMarker.sqf"";",_side,_position,_markertype,_markersize,_markername,_markercolor,_markertext,_type];
					_x setVehicleInit _vehicleinit;
					processInitCommands;
					clearVehicleInit _x;
				}
				Else
				{
					_vehicleinit = format ["null=[%1,%2,""%3"",%4,""%5"",""%6"",""%7"",%8] execVM ""Scripts\UI\RequestMarker.sqf"";",_side,_position,_markertype,_markersize,_markername,_markercolor,_markertext,_type];
					{
						
						_x setVehicleInit _vehicleinit;
						processInitCommands;
						clearVehicleInit _x;
						
					}ForEach crew _x;
				};
			};
		
	}ForEach AllUnits;
};

if (_side==1) then 
{
	{
		
		if ((side(group _x)) == WEST) then 
			{
				if (_x == (vehicle _x)) then 
				{
				_vehicleinit = format ["null=[%1,%2,""%3"",%4,""%5"",""%6"",""%7"",%8] execVM ""Scripts\UI\RequestMarker.sqf"";",_side,_position,_markertype,_markersize,_markername,_markercolor,_markertext,_type];
					_x setVehicleInit _vehicleinit;
					processInitCommands;
					clearVehicleInit _x;
				}
				Else
				{
				_vehicleinit = format ["null=[%1,%2,""%3"",%4,""%5"",""%6"",""%7"",%8] execVM ""Scripts\UI\RequestMarker.sqf"";",_side,_position,_markertype,_markersize,_markername,_markercolor,_markertext,_type];
				{
						
						_x setVehicleInit _vehicleinit;
						processInitCommands;
						clearVehicleInit _x;
						
					}ForEach crew _x;
				};
			};
		
	}ForEach AllUnits;
};