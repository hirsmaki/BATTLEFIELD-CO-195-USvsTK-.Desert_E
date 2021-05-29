_side = _this select 0;

_AllPlayers = AllUnits;

private ["_AllPlayers"];

{if (!(isPlayer _x)) then {_AllPlayers = _AllPlayers-[_x];};}ForEach AllUnits;

if (_side==0) then 
{
	{
		
		if ((side(group _x)) == EAST) then 
			{
				if (_x == (vehicle _x)) then 
				{
					_vehicleinit = format ["null=[%1, this] execVM ""Scripts\UI\UAV.sqf"";",_side];
					_x setVehicleInit _vehicleinit ;
					processInitCommands;
					clearVehicleInit _x;
				}
				Else
				{
					_vehicleinit = format ["null=[%1, this] execVM ""Scripts\UI\UAV.sqf"";",_side];
					{
						
						_x setVehicleInit _vehicleinit ;
						processInitCommands;
						clearVehicleInit _x;
						
					}ForEach crew _x;
				};
			};
		
	}ForEach _AllPlayers;
};

if (_side==1) then 
{
	{
		
		if ((side(group _x)) == WEST) then 
			{
				if (_x == (vehicle _x)) then 
				{
					_vehicleinit = format ["null=[%1, this] execVM ""Scripts\UI\UAV.sqf"";",_side];
					_x setVehicleInit _vehicleinit ;
					processInitCommands;
					clearVehicleInit _x;
				}
				Else
				{
					_vehicleinit = format ["null=[%1, this] execVM ""Scripts\UI\UAV.sqf"";",_side];
					{
						
						_x setVehicleInit _vehicleinit ;
						processInitCommands;
						clearVehicleInit _x;
						
					}ForEach crew _x;
				};
			};
		
	}ForEach _AllPlayers;
};