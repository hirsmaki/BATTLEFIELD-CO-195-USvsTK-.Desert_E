private ["_pos","_possf","_x","_n","_alreadyused"];
_group = _this select 0;
_buildingPos = [9,12,19,21,22,26,28,43,44,46,53,54,57,59];
_buildingPosSF = [57,54,59];
_alreadyused = [];

_x=0;

leader _group setBehaviour "AWARE";

if ((count (units _group))>=3) then 
{				
		for "_i" from 1 to 3 do
		{
			_unit = units _group select _x;
			_possf =(BLD buildingPos (_buildingPosSF select _x));
			if (!(isPlayer _unit)) then 
			{  
				doStop _unit;
				_unit doMove _possf;
				[_unit,_possf] execVM "Scripts\AI\CaptureBuildingPos.sqf";
				_buildingPos= _buildingPos - [(_buildingPosSF select _x)];
			};
			_x=_x+1;
		};

};
While {((count (units _group))>_x)} do
{
	
_unit = units _group select _x;
if (!(isplayer _unit)) then 
	{
		if ((count _buildingPos)>0) then 
		{
			_n= (floor(random (count _buildingPos)));
		
			if ( _unit == (leader (group _unit))) then 
				{
					_pos = (BLD buildingPos 57);
					doStop _unit;
					_unit doMove _pos;
					[_unit,_pos] execVM "Scripts\AI\CaptureBuildingPos.sqf";
				}
				else  
				{
					_pos =(BLD buildingPos (_buildingPos select _n));
					doStop _unit;
					_unit doMove _pos;
					[_unit,_pos] execVM "Scripts\AI\CaptureBuildingPos.sqf";
					_buildingPos= _buildingPos - [(_buildingPos select _n)];
						
					
				};
		};
	};
_x=_x+1;
sleep 1;
};
