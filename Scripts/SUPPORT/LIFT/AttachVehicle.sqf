_vehicle  = _this select 0;
_id = _this select 2;

_cargo = _this select 3;

_vehicle setVariable ["DAP_VEHICLE_ATTACHEDCARGO", _cargo,true];
_cargo setVariable ["DAP_VEHICLE_ATTACHED", 1,true];

_cargo attachTo [_vehicle, [0,2,-4.5]];