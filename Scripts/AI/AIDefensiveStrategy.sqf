_group = _this select 0;
_cp = _this select 1;
_position = getPos _cp;

if (count(units _group)>0) then 
{
	[_group, _position, 50] call bis_fnc_taskPatrol;
	sleep 5;
	
	{
		_x setBehaviour "AWARE";
		_x setSpeedMode "LIMITED";
	} ForEach units _group;
	
	_group setFormation "DIAMOND";
};