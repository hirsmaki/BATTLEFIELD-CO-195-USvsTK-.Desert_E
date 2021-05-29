private ["_transport","_caller","_state","_marker","_markername","_markertype","_markersize","_markercolor"];

_transport = _this select 0;
_caller = _this select 1;

_state = _transport getVariable "DAP_BF_TRANSPORTREADY";

if (_caller == player) then 
{
	_markername = str(_transport);
	_position = (getPos _transport);
		
	if (side (group _caller)==EAST) then {_markercolor="colorRED";};
	if (side (group _caller)==WEST) then {_markercolor="colorBLUE";};
				
	_marker = createMarkerLocal [_markername, _position];
	_marker setMarkerShapeLocal "ICON";
	_markername setMarkerTypeLocal "mil_dot";
	_markername setMarkerSizeLocal [1,1];
	_markername setMarkerColorLocal _markercolor;
	_markername setMarkerTextLocal (localize "STR_COM_TRN");
		
	While {((alive _transport) and (_state==0))} do 
	{
		_state = _transport getVariable "DAP_BF_TRANSPORTREADY";
		_markername setMarkerPosLocal (getPos _transport);
		sleep 3;
	};
	
	deleteMarkerLocal _markername;
};