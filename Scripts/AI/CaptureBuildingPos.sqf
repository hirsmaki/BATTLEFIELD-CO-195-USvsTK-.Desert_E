_unit = _this select 0;
_pos = _this select 1;
waitUntil {_unit distance _pos<=2};
doStop _unit;