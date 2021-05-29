private ["_hours","_minutes"];

if (local player) then 
{
	waitUntil{!(isNil "BIS_fnc_init")};
	sleep 3;

	_hours = str(date select 3);
	_minutes = str(date select 4);
	
	if ((date select 4)<10) then {_minutes="0"+(str(date select 4));};
	
	[localize "STR_MISSION_NAME", localize "STR_MISSION_LOCATION",_hours + ":" + _minutes] spawn BIS_fnc_infoText;
};