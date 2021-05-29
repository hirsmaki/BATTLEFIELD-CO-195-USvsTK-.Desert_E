_side = _this select 0;
_unit = _this select 1;

private ["_targets","_markers","_markerlcolor"];

_markers = [];

if (_unit==player) then 

{

if (_side==0) then {_targets= DAP_BF_EAST_UAV_TARGETS_ARRAY;};
if (_side==1) then {_targets= DAP_BF_WEST_UAV_TARGETS_ARRAY;};

if (count(_targets)>0) then 
{

{
	if (side group _x == east) then  {_markerlcolor="ColorRed";};
	if (side group _x == west) then  {_markerlcolor="ColorBlue";};
		
	if (_x isKindOf "Man") then 
			{
				_markername=str(_x);
				_marker = createMarkerLocal [_markername, (getPos _x)];
				_marker setMarkerShapeLocal "ICON";
				_markername setMarkerTypeLocal "Man";
				_markername setMarkerSizeLocal [0.8,0.8];
				_markername setMarkerColorLocal _markerlcolor;
				_markers = _markers + [_markername];
			};
	
	if (_x isKindOf "Car") then 
			{
				_markername=str(_x);
				_marker = createMarkerLocal [_markername, (getPos _x)];
				_marker setMarkerShapeLocal "ICON";
				_markername setMarkerTypeLocal "Car";
				_markername setMarkerSizeLocal [0.8,0.8];
				_markername setMarkerColorLocal _markerlcolor;
				_markers = _markers + [_markername];
			};
	
	if (_x isKindOf "Tank") then 			
			{
				_markername=str(_x);
				_marker = createMarkerLocal [_markername, (getPos _x)];
				_marker setMarkerShapeLocal "ICON";
				_markername setMarkerTypeLocal "Tank";
				_markername setMarkerSizeLocal [0.8,0.8];
				_markername setMarkerColorLocal _markerlcolor;
				_markers = _markers + [_markername];
			};
	
	if (_x isKindOf "Air") then 
			{
				_markername=str(_x);
				_marker = createMarkerLocal [_markername, (getPos _x)];
				_marker setMarkerShapeLocal "ICON";
				_markername setMarkerTypeLocal "Air";
				_markername setMarkerSizeLocal [0.8,0.8];
				_markername setMarkerColorLocal _markerlcolor;
				_markers = _markers + [_markername];
			};

}ForEach _targets;

};

sleep 3.5;

if (count(_markers)>0) then 
{
	{deleteMarkerLocal _x;}ForEach _markers;
};

};