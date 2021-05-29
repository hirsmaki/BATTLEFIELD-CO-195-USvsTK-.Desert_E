private ["_markers","_type","_markername","_position","_markercolor","_marker"];

_markers=[];
_type = DAP_BF_PLAYERSMARKERS;

if (local player) then 
{

	if (_type == 1) then 
	{
		While {true} do 
		{
		
			_markername = (name player);
			_position = getPos player;
		
			if (alive player) then 
			{
				_marker = createMarkerLocal [_markername, _position];
				_marker setMarkerShapeLocal "ICON";
				_markername setMarkerTypeLocal "mil_triangle";
				_markername setMarkerSizeLocal [0.75,0.75];
				_markername setMarkerDirLocal 180;
				_markername setMarkerColorLocal "colorGREEN";
				_markername setMarkerTextLocal (name player);
				_markers = _markers +[_markername];
			};
			
			sleep 3;
		
			{
				deleteMarkerLocal _x;
		
			}ForEach _markers;
			
			_markers=[];
		
		};
	};
		
	if (_type == 2) then 
	{	
		
		While {true} do 
		{
			{
				if ((group _x)==(group player)) then 
				{
					_markername = (name _x);
					_position = getPos _x;
				
					if (isPlayer _x) then 
					{
						if (alive _x) then 
						{
							_marker = createMarkerLocal [_markername, _position];
							_marker setMarkerShapeLocal "ICON";
							_markername setMarkerTypeLocal "mil_triangle";
							_markername setMarkerSizeLocal [0.75,0.75];
							_markername setMarkerDirLocal 180;
							_markername setMarkerColorLocal "colorGREEN";
							_markername setMarkerTextLocal (name _x);
							_markers = _markers +[_markername];
						};
					};
				};
			
			}ForEach units group player;
			
			sleep 3;
			
			{
				deleteMarkerLocal _x;
		
			}ForEach _markers;
			
			_markers=[];
		};
	};
		
	if (_type == 3) then 
	{
		While {true} do 
		{
			{
				if ((side (group _x))==(side (group player))) then 
				{
					_markername = (name _x);
					_position = getPos _x;
			
					if (isPlayer _x) then 
					{
						if (alive _x) then 
						{
							_marker = createMarkerLocal [_markername, _position];
							_marker setMarkerShapeLocal "ICON";
							_markername setMarkerTypeLocal "mil_triangle";
							_markername setMarkerSizeLocal [0.75,0.75];
							_markername setMarkerDirLocal 180;
								
							if (_x in (units(group player))) then 
							{
								_markercolor="colorGREEN";
							}
							else
							{
								_markercolor="colorBLUE";
							};
								
							_markername setMarkerColorLocal _markercolor;
							_markername setMarkerTextLocal (name _x);
							_markers = _markers +[_markername];
						};
					};
				};
			
			}ForEach AllUnits;
			
			sleep 3;
			
			{
				deleteMarkerLocal _x;
		
			}ForEach _markers;
			
			_markers=[];
		};
	};
};	
	
