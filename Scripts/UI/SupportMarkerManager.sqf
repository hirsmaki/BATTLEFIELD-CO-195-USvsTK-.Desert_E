private ["_type","_side","_position","_vehicleinit"];

_type = _this select 0;
_side = _this select 1;
_position = _this select 2;

if (_side==0) then 
{
	{
		
		if ((side(group _x)) == EAST) then 
			{
				if (_x == (vehicle _x)) then 
				{
					_vehicleinit = format ["null=[%1,%2,%3] execVM ""Scripts\UI\SupportMarker.sqf"";",_type,_side,_position];
					_x setVehicleInit _vehicleinit ;
					processInitCommands;
					clearVehicleInit _x;
				}
				Else
				{
					_vehicleinit = format ["null=[%1,%2,%3] execVM ""Scripts\UI\SupportMarker.sqf"";",_type,_side,_position];
					{
						
						_x setVehicleInit _vehicleinit ;
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
					_vehicleinit = format ["null=[%1,%2,%3] execVM ""Scripts\UI\SupportMarker.sqf"";",_type,_side,_position];
					_x setVehicleInit _vehicleinit ;
					processInitCommands;
					clearVehicleInit _x;
				}
				Else
				{
					_vehicleinit = format ["null=[%1,%2,%3] execVM ""Scripts\UI\SupportMarker.sqf"";",_type,_side,_position];
					{
						
						_x setVehicleInit _vehicleinit ;
						processInitCommands;
						clearVehicleInit _x;
						
					}ForEach crew _x;
				};
			};
		
	}ForEach AllUnits;
};