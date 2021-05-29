private ["_timer","_velocity"];

_vehicle = _this select 0;
_pilot = _this select 1;
_group = _this select 2;
_velocity = _this select 3;

_timer = 0;

if (_vehicle isKindOf "Helicopter") then 
{
	_velocity = [0,60,0];
};

_vehicle setPos [((getPos _vehicle) select 0),((getPos _vehicle) select 1),DAP_BF_SUPPLIESDROPHEIGHT];
_vehicle setVelocity _velocity;

While {((_timer<60)and(canMove _vehicle)and(alive _vehicle))} do 
{
	
	if ((((getPos _vehicle) select 2)+1) < DAP_BF_SUPPLIESDROPHEIGHT) then 
	{
		_vehicle setVelocity [_velocity select 0, _velocity select 1,15];			
	}
	else
	{	
		if (((getPos _vehicle) select 2) > DAP_BF_SUPPLIESDROPHEIGHT) then 
		{
			_vehicle setVelocity [_velocity select 0, _velocity select 1,-15];
		}
		else
		{
			_vehicle setVelocity _velocity;
		};			
	};
	
	[nil, nil, rSPAWN, [_vehicle], 
	{
		(_this select 0) setVectorUp [0,0,0.01];
	
	}] call RE;

	sleep 0.02;
	
	_timer = _timer+0.02;
	
	_state = _vehicle getVariable "DAP_SUPPLIESTRANSPORT_DROP";
	if (isNil("_state")) then {_timer=0;};
};

if ((!(canMove _vehicle))or(!(alive _vehicle))) then 
{
	sleep 300;
};

_pilot setPos getPos _vehicle;
deleteVehicle _pilot;

While{(!(isNull(_vehicle)))}do
{
	deleteVehicle _vehicle;
	sleep 1;
};

deleteGroup _group;

