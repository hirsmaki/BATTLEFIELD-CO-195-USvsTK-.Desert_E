_attached = _this select 0;
_attacher = _this select 1;
_pos = _this select 2;
_dir = _this select 3;

[nil, nil, rSPAWN, [_attached,_attacher,_pos, _dir],
{
	_objecta = _this select 0;
	_objectb = _this select 1;
	_offset = _this select 2;
	_direction = _this select 3;
	
	if (local _objecta) then 
	{
		_objecta attachTo [_objectb,_offset];
	};
		
	_objecta setDir _direction;

}] call RE;
