private ["_state","_nearestVehicle","_attachedVehicle"];

_vehicle = _this select 0;

_state = 0;

while {(alive _vehicle)} do
{
	if ((driver _vehicle) == player) then 
	{
		_attachedVehicle = _vehicle getVariable "DAP_VEHICLE_ATTACHEDCARGO";
	
		if (isNil ("_attachedVehicle")) then 
		{	
			if (_state==2) then
			{
				_vehicle removeAction DropAction;
				_state = 0;
			};
			
			_nearestVehicle = nearestObject [_vehicle,"Car"];
			
			if (!(isNull _nearestVehicle)) then 
			{
				if (((speed _vehicle) <8) and ((speed _vehicle) >-8) and (((getPos _vehicle)select 2)<=10) and (((getPos _vehicle)select 2)>5)) then 
				{
					_npos = getPos _nearestVehicle;
					_pos = getPos _vehicle;
				
					_nx = _npos select 0;
					_ny = _npos select 1;
					_vx = _pos select 0;
					_vy = _pos select 1;
				
					if ((_vx <= _nx + 5 && _vx >= _nx - 5) && (_vy <= _ny + 5 && _vy >= _ny - 5)) then
					{
						_targettype = _nearestVehicle getVariable "DAP_VEHICLE_NOLIFT";
			
						if (isNil("_targettype")) then 
						{
							 _targetstate = _nearestVehicle getVariable "DAP_VEHICLE_ATTACHED";
							 
							if (isNil("_targetstate")) then 
							{
								if (_state ==0) then 
								{
									LiftAction = _vehicle addAction [localize "STR_DAP_LIFTVEHICLE", "Scripts\Support\Lift\AttachVehicle.sqf", _nearestVehicle,0,false,true];
									_state=1;
								};
							};
						};
					}
					else
					{
						if (_state ==1) then 
						{
							_vehicle removeAction LiftAction;
							_state=0;
						};
					};
				}
				else
				{
					if (_state ==1) then 
					{
						_vehicle removeAction LiftAction;
						_state=0;
					};
				};
			};
		}
		else
		{
			if (_state ==1) then 
			{
				_vehicle removeAction LiftAction;
		
				DropAction = _vehicle addAction [localize "STR_DAP_DROPVEHICLE", "Scripts\Support\Lift\DetachVehicle.sqf", _attachedVehicle,0,false,true];
		
				_state=2;
				
			};
		
			if (_state==2) then
			{
				_attachedVehicle = _vehicle getVariable "DAP_VEHICLE_ATTACHEDCARGO";
	
				if (!(isNil ("_attachedVehicle"))) then 
				{
					if (!(isNull _attachedVehicle)) then 
					{
						if (((getPos _attachedVehicle)select 2)<1) then 
						{
							_vehicle setVariable ["DAP_VEHICLE_ATTACHEDCARGO", nil,true];
							_vehicle removeAction DropAction;
											
							_attachedVehicle setVariable ["DAP_VEHICLE_ATTACHED", nil,true];
							detach _attachedVehicle;
						
							_state = 0;
						};
					}
					else
					{
						_vehicle setVariable ["DAP_VEHICLE_ATTACHEDCARGO", nil,true];
						_vehicle removeAction DropAction;
						
						_state = 0;
					};
				};
			}; 
				
		};
	}
	else
	{
		sleep 5;
	};
			
	sleep 1; 
	
};

_attachedVehicle = _vehicle getVariable "DAP_VEHICLE_ATTACHEDCARGO";
	
if (!(isNil ("_attachedVehicle"))) then 
{
	if (!(isNull _attachedVehicle)) then 
	{
		_attachedVehicle setVariable ["DAP_VEHICLE_ATTACHED", nil,true];
		detach _attachedVehicle;
	};
}; 
