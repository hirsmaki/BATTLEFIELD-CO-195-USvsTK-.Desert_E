_vehicle  = _this select 0;
_id = _this select 2;

_cargo = _this select 3;

_vehicle setVariable ["DAP_VEHICLE_ATTACHEDCARGO", nil,true];
_cargo setVariable ["DAP_VEHICLE_ATTACHED", nil,true];

detach _cargo;

