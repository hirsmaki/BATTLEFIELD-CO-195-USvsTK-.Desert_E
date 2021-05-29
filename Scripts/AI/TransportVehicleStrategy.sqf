 private ["_COM","_ALLCP","_WPPOS","_side","_vpl","_vehwp","_x","_n","_group","_assignedgroup","_unitdestination","_randomdir","_position","_clearposition","_taskstate","_nearestUnits","_n","_unit","_cargospace","_targetunit","_evactimer","_checkpoint","_checpointclearposition","_vehiclecargo","_vehiclecrew","_LZ","_LZC","_aistartduration"];

_vehicle = _this select 0;
_crew = _this select 1;
_respawnpos = _this select 2;
_dir = _this select 3;
_group =_this select 4;
_crewtype = _this select 5;
_strategytype = _this select 6;

_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];

if ((!(isPlayer (driver _vehicle)))and(count(units _group)==1)) then {_vehicle lockDriver true;};

_side= getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "side");

if (!(isPlayer driver _vehicle)) then 
{
	if (_side==0) then 
	{ 
		DAP_BF_EAST_TRANSPORT=DAP_BF_EAST_TRANSPORT+[_vehicle];
		PublicVariable "DAP_BF_EAST_TRANSPORT";
	};
	
	if (_side==1) then 
	{ 
		DAP_BF_WEST_TRANSPORT=DAP_BF_WEST_TRANSPORT+[_vehicle];
		PublicVariable "DAP_BF_WEST_TRANSPORT";
	};


_aistartduration = _vehicle getVariable "DAP_VEHICLE_STARTDURATION";
if (isNil("_aistartduration")) then {_aistartduration=0;};

sleep _aistartduration;

sleep 5;

_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];
};

_vehicletype = typeOf _vehicle;

_vpl=0;
_taskstate=1;

_ALLCP = ACP;
_WPPOS = AINFWP;

if (_side==0) then {_COM=DAP_BF_EAST_COMMANDER;};
if (_side==1) then {_COM=DAP_BF_WEST_COMMANDER;};

if ((isServer)or (isDedicated)) then 
{
	_cargospace = getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "transportsoldier");
	
	if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {sleep 30;};
	if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
	if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
	
	if ((count (assignedCargo _vehicle)==0) and (!(isPlayer _COM)) and (alive _vehicle) and (canMove _vehicle)) then 
	{
		_nearestUnits = nearestObjects [_vehicle, ["CAManBase"],DAP_BF_CARGOSEARCHRANGE];

		if (count(_nearestUnits) >0) then 
		{
			{if ((side (group _x) != side _group) or (!(alive _x))) then {_nearestUnits = _nearestUnits - [_x];}; }ForEach _nearestUnits;
		};
		_n=0;

		if ((count(_nearestUnits) >0) and (alive _vehicle) and (canMove _vehicle) and (_vehicle getVariable "DAP_BF_TRANSPORTREADY"==1)) then 
		{
			While {_n<(count(_nearestUnits))} do 
			{
				_unit = _nearestUnits select _n;
				_vpl = _unit getVariable "DAP_BF_TARGETPOSITION";
				_unitiscrew = _unit getVariable "DAP_BF_CREW";
				
				sleep 1;
						
				if ((isNull(assignedVehicle _unit)) and (_vehicle getVariable "DAP_BF_TRANSPORTREADY"==1) and (!(isNil("_vpl"))) and (isNil("_unitiscrew")) and (count(units (group _unit))<=(_vehicle emptyPositions "CARGO")) and (alive _unit) and (alive _vehicle) and (canMove _vehicle) and (!(isPlayer (driver _vehicle))) and (count(units (group _unit)) <= _cargospace) and (count (units(group _unit)) >1) and (unitReady (leader (group _unit)))) then 
				{
					_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];
					
					if (count(units (group _unit))==(_vehicle emptyPositions "CARGO")) then {_vehicle lock true;};
				
					_n=1000000;
					
					_assignedgroup = group _unit;
							
					{_x assignAsCargo _vehicle;[_x] orderGetIn true;}ForEach units _assignedgroup;
				
					{if (alive _x) then {While {((!(_x in crew _vehicle)) and (alive _x) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))} do {sleep 1;};};}ForEach units _assignedgroup;
					
					if ((count (crew _vehicle)) > (count (units _group))) then 
					{
					
					_vpl = _unit getVariable "DAP_BF_TARGETPOSITION";
					_unitdestination = (_WPPOS select _vpl);
					_randomdir=(random 360);
					
					_position = [((_unitdestination select 0)+DAP_BF_CARGODROPRANGE*sin(_randomdir)),((_unitdestination select 1)+DAP_BF_CARGODROPRANGE*cos(_randomdir)),(_unitdestination select 2)];
				
					_clearposition = _position findEmptyPosition [30,500];
						
					if ((count _clearposition)==0) then {_clearposition=_position;};
						
					_LZ = "HeliHEmpty"  createVehicle _clearposition;
						
					_LZ setCaptive true;
					
					sleep (random 3);
					
					if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
				
					sleep 5;
				
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
					if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
				
					_vehiclecrew = [];
					
					{if((!(alive _x)) or (!(_x in (AssignedCargo _vehicle)))) then {_vehiclecrew=_vehiclecrew+[_x];};}ForEach crew _vehicle;
					
					if (_vehicle isKindOf "AIR") then  
					{
						While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
					}
					else
					{
						While {((!(unitReady _vehicle)) and ((_vehicle distance _unitdestination)>=DAP_BF_CARGODROPRANGE) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
					};
									
					_vehicle lock false;
					
					if (_vehicle isKindOf "Helicopter") then  
					{
						_vehicle land "GET OUT";	
					};
				
					While {(((count (crew _vehicle))>(count (_vehiclecrew)))and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)) and (count(crew _vehicle)>0))} do 
					{
						{
							if((!(alive _x)) and (!(_x in _vehiclecrew)))then {_vehiclecrew =_vehiclecrew+[_x];};
							if((alive _x) and (_x in assignedCargo _vehicle)) then {unassignVehicle _x; [_x] orderGetIn false;};
																
						}ForEach assignedCargo _vehicle;
						sleep 1;
					};
										
					deleteWaypoint [_group, 1];
					
					deleteVehicle _LZ;
					
					_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
										
					if (alive _vehicle) then {sleep 5;};
					
					While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
					
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
					if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
					
					if (_vehicle isKindOf "AIR") then  
					{
						if (alive _vehicle) then {sleep 5;};
					
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
						if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
										
						While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
						_vehicle land "LAND";
						
						if (alive _vehicle) then {sleep 5;};
			
					}
					else
					{
						While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
						sleep 5;
						_vehicle engineOn false;
					};
											
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
					if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
					
					
					WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
					
					_vehicle lock false;
							
					{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
					
					if (alive _vehicle) then 
					{
						sleep 30;
						
						_vehicle setDammage 0;

						_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
						_nx =  (count _cfg) - 1;

						for "_i" from 0 to _nx do 
						{
							_mn =  (_cfg select _i);
							_nm = getText (_mn >> "name");
							_vehicle setHit [_nm,  0];
						};
						
						_vehicle setFuel 100;
					};
					
					deleteWaypoint [_group, 1];
					
					};
								
					_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];
					
				};
				_n=_n+1;
			}; 
		};
	
	};

	if ((!(_vehicle isKindOf "TANK")) and (!(_vehicle isKindOf "Mi24_Base"))) then 
	{ 
		While {alive _vehicle} do 
		{
			if (_side==0) then {_COM=DAP_BF_EAST_COMMANDER;};
			if (_side==1) then {_COM=DAP_BF_WEST_COMMANDER;};

			if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {sleep 30;};
			if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
			if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};

			if ((count (assignedCargo _vehicle)==0) and (!(isPlayer _COM)) and (alive _vehicle) and (canMove _vehicle)) then 
			{
				_nearestUnits = nearestObjects [_vehicle, ["CAManBase"],DAP_BF_CARGOSEARCHRANGE];

				if (count(_nearestUnits) >0) then 
				{
					{if ((side (group _x) != side _group) or (!(alive _x))) then {_nearestUnits = _nearestUnits - [_x];}; }ForEach _nearestUnits;
				};

				_n=0;

				if ((count(_nearestUnits) >0) and (_vehicle getVariable "DAP_BF_TRANSPORTREADY"==1) and (alive _vehicle) and (canMove _vehicle)) then 
				{
					While {(_n<(count(_nearestUnits)))} do 
					{
						_unit = _nearestUnits select _n;
						_vpl = _unit getVariable "DAP_BF_TARGETPOSITION";
						_unitiscrew = _unit getVariable "DAP_BF_CREW";
			
						sleep 1;
					
						if ((isNull(assignedVehicle _unit))  and (_vehicle getVariable "DAP_BF_TRANSPORTREADY"==1) and (!(isNil("_vpl"))) and (isNil("_unitiscrew")) and (count(units (group _unit))<=(_vehicle emptyPositions "CARGO")) and (alive _unit) and (alive _vehicle) and (canMove _vehicle) and (!(isPlayer (driver _vehicle))) and (count(units (group _unit)) <= _cargospace) and (count (units(group _unit)) >1) and (unitReady (leader (group _unit)))) then 			
						{
							_vehicle setVariable ["DAP_BF_TRANSPORTREADY",0,true];	
							
							if (count(units (group _unit))==(_vehicle emptyPositions "CARGO")) then {_vehicle lock true;};
				
							_n=1000000;
							
							_assignedgroup = group _unit;
							
							{_x assignAsCargo _vehicle;[_x] orderGetIn true;}ForEach units _assignedgroup;
				
							{if (alive _x) then {While {((!(_x in crew _vehicle)) and (alive _x))} do {sleep 1;};};}ForEach units _assignedgroup;
						
							if ((count (crew _vehicle)) > (count (units _group))) then 
							{
							_vpl = _unit getVariable "DAP_BF_TARGETPOSITION";
							_unitdestination = (_WPPOS select _vpl);
							_randomdir=(random 360);
							
							_position = [((_unitdestination select 0)+DAP_BF_CARGODROPRANGE*sin(_randomdir)),((_unitdestination select 1)+DAP_BF_CARGODROPRANGE*cos(_randomdir)),(_unitdestination select 2)];				
				
							_clearposition = _position findEmptyPosition [30,500];
						
							if ((count _clearposition)==0) then {_clearposition=_position;};
						
							_LZ = "HeliHEmpty"  createVehicle _clearposition;
						
							_LZ setCaptive true;
				
							if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
				
							sleep 5;
				
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
							if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
				
							_vehiclecrew = [];
					
							{if((!(alive _x)) or (!(_x in (AssignedCargo _vehicle)))) then {_vehiclecrew=_vehiclecrew+[_x];};}ForEach crew _vehicle;
				
							if (_vehicle isKindOf "AIR") then  
							{
								While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
							}
							else
							{
								While {((!(unitReady _vehicle)) and ((_vehicle distance _unitdestination)>=DAP_BF_CARGODROPRANGE) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
							};
				
							_vehicle lock false;
							
							if (_vehicle isKindOf "Helicopter") then  
							{
								_vehicle land "GET OUT";	
							};
				
							While {(((count (crew _vehicle))>(count (_vehiclecrew)))and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)) and (count(crew _vehicle)>0))} do 
							{
								{
									if((!(alive _x)) and (!(_x in _vehiclecrew)))then {_vehiclecrew =_vehiclecrew+[_x];};
									if((alive _x) and (_x in assignedCargo _vehicle)) then {unassignVehicle _x; [_x] orderGetIn false;};
									
								}ForEach assignedCargo _vehicle;
								sleep 1;
							};
										
							deleteWaypoint [_group, 1];
					
							deleteVehicle _LZ;
					
							_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
														
							if (alive _vehicle) then {sleep 5;};
					
							While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
					
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
							if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
					
							if (_vehicle isKindOf "AIR") then  
							{
								if (alive _vehicle) then {sleep 5;};
					
								if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
								if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
										
								While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
								_vehicle land "LAND";
						
								if (alive _vehicle) then {sleep 5;};
			
							}
							else
							{
								While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
								sleep 5;
								_vehicle engineOn false;
							};
											
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
							if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
					
							WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
					
							_vehicle lock false;
							
							{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
					
							if (alive _vehicle) then 
							{
								sleep 30;
								
								_vehicle setDammage 0;

								_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
								_nx =  (count _cfg) - 1;

								for "_i" from 0 to _nx do 
								{
									_mn =  (_cfg select _i);
									_nm = getText (_mn >> "name");
									_vehicle setHit [_nm,  0];
								};
						
								_vehicle setFuel 100;
							};
					
							deleteWaypoint [_group, 1];
							};
								
							_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];
						};
						_n=_n+1;
					};
				};
				
				if ((_vehicle getVariable "DAP_BF_TRANSPORTREADY"==0) and (_vehicle getVariable "DAP_BF_TRANSPORTMISSIONTYPE"==0) and (alive _vehicle) and (canMove _vehicle)) then 
				{
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};

					_position = _vehicle getVariable  "DAP_BF_TRANSPORTTARGETPOS";
					_targetunit = _vehicle getVariable "DAP_BF_TRANSPORTTARGETUNIT";
					_checkpoint = getPos _targetunit;
					
					if (((_targetunit distance _vehicle)>DAP_BF_CARGOSEARCHRANGE) and ((_position distance _targetunit)>DAP_BF_TRANSPORT_MINDISTANCE)) then
					{		
						_evactimer = DAP_BF_TRANSPORT_TIME;
						
						_clearcheckpointposition = _checkpoint findEmptyPosition [30,500];
						
						if ((count _clearcheckpointposition)==0) then {_clearcheckpointposition=_checkpoint;};
						
						_LZC = "HeliHEmpty"  createVehicle _clearcheckpointposition;
						
						_LZC setCaptive true;
				
						if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_checkpoint,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
						
						[nil, _targetunit, "loc" + "per", rSPAWN, [_vehicle, _targetunit], 
						{
							_transport = _this select 0;
  							_targetedunit = _this select 1;
  							[_transport,_targetedunit] execVM "Scripts\UI\TransportMarker.sqf";

						}] call RE; 
						
						sleep 5;
				
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
				
						While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
				
						_vehicle lock false;								
						
						if (_vehicle isKindOf "Helicopter") then  
						{
							_vehicle land "GET IN";	
						};
			
						_evactimer = DAP_BF_TRANSPORT_TIME;
				
						if((isNil("_evactimer")) or (_evactimer<180)) then {_evactimer=180;};
				
						While {(!(_targetunit in crew _vehicle) and (alive _vehicle) and (_evactimer>0))} do 
						{
							_evactimer = _evactimer-1;
							sleep 1;
						};
					
						deleteVehicle _LZC;
							
						deleteWaypoint [_group, 1];
						
						_clearposition = _position findEmptyPosition [30,500];
							
						if ((count _clearposition)==0) then {_clearposition=_position;};
						
						_LZ = "HeliHEmpty"  createVehicle _clearposition;
							
						_LZ setCaptive true;
				
						if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
				
						sleep 5;
				
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
						if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
						
						While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
				
						_vehicle lock false;
												
						_vehiclecrew = [];
					
						{if((!(alive _x)) or (!(_x in (AssignedCargo _vehicle)))) then {_vehiclecrew=_vehiclecrew+[_x];};}ForEach crew _vehicle;
						
						if (_vehicle isKindOf "Helicopter") then  
						{
							_vehicle land "GET OUT";	
						};
						
						if ((count(AssignedCargo _vehicle))== 0) then 
						{
							
							WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
							sleep 30;								
						}
						else
						{
							WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
							sleep 5;
							While {(((count (crew _vehicle))>(count (_vehiclecrew)))and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)) and (count(crew _vehicle)>0))} do 
							{
								{
									if((!(alive _x)) and (_x in (AssignedCargo _vehicle))) then 
									{
										_vehiclecrew =_vehiclecrew+[_x];
									};
									if((alive _x) and (_x in (AssignedCargo _vehicle))) then
									{
										unassignVehicle _x;
										[_x] orderGetIn false;
									};
								
								}ForEach AssignedCargo _vehicle;
								sleep 1;
							};
						};
						
						deleteWaypoint [_group, 1];
				
						deleteVehicle _LZ;
						
						_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
											
						if (_vehicle isKindOf "AIR") then  
						{

							if (alive _vehicle) then {sleep 5;};
					
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
							if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};			
							
							While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
							_vehicle land "LAND";
					
							if (alive _vehicle) then {sleep 5;};
			
						}
						else
						{
							While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
							sleep 5;
							_vehicle engineOn false;
						};
				
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
						if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
						
						WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
						
						_vehicle lock false;
							
						{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
							
						if (alive _vehicle) then 
						{
							sleep 30;
							
							_vehicle setDammage 0;

							_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
							_nx =  (count _cfg) - 1;

							for "_i" from 0 to _nx do 
							{
								_mn =  (_cfg select _i);
								_nm = getText (_mn >> "name");
								_vehicle setHit [_nm,  0];
							};
						
							_vehicle setFuel 100;
						};
					
						deleteWaypoint [_group, 1];
						
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];		
					}
					else
					{
						_evactimer = DAP_BF_TRANSPORT_TIME;
						
						if (alive driver _vehicle) then {_vehicle engineOn true;};
						
						[nil, _targetunit, "loc" + "per", rSPAWN, [_vehicle, _targetunit], 
						{
							_transport = _this select 0;
  							_targetedunit = _this select 1;
  							[_transport,_targetedunit] execVM "Scripts\UI\TransportMarker.sqf";
					
						}] call RE;
						
						While {((!(_targetunit in crew _vehicle)) and (alive _vehicle) and (_evactimer>0))} do 
						{
							_evactimer = _evactimer-1;
							sleep 1;
						};
						
						_vehiclecargo = crew _vehicle;
						
						{if (!(_x in (units _group)) and (alive _x)) then {_vehiclecargo=_vehiclecargo-[_x];};}ForEach crew _vehicle;
						
						if ((count(_vehiclecargo))>0) then 
						{
							
							_clearposition = _position findEmptyPosition [30,500];
							
							if ((count _clearposition)==0) then {_clearposition=_position;};
						
							_LZ = "HeliHEmpty"  createVehicle _clearposition;
							
							_LZ setCaptive true;
				
							if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
				
							sleep 5;
				
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
							if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
							
							While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
				
							_vehicle lock false;
							
							_vehiclecrew = [];
					
							{if((!(alive _x)) or (!(_x in (AssignedCargo _vehicle)))) then {_vehiclecrew=_vehiclecrew+[_x];};}ForEach crew _vehicle;
							
							if (_vehicle isKindOf "Helicopter") then  
							{
								_vehicle land "GET OUT";	
							};
							
							if ((count(AssignedCargo _vehicle))== 0) then 
							{
							
								WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
								sleep 30;								
							}
							else
							{
								WaitUntil {sleep 1;((getPos _vehicle select 2)<3)};
								sleep 5;
								While {(((count (crew _vehicle))>(count (_vehiclecrew)))and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)) and (count(crew _vehicle)>0))} do 
								{
									{
										
										if((!(alive _x)) and (_x in (AssignedCargo _vehicle))) then 
										{
											_vehiclecrew =_vehiclecrew+[_x];
										};
										if((alive _x) and (_x in (AssignedCargo _vehicle))) then
										{
											unassignVehicle _x;
											[_x] orderGetIn false;
										};
								
									}ForEach AssignedCargo _vehicle;
									sleep 1;
								};
							};
								
							deleteVehicle _LZ;
							
							deleteWaypoint [_group, 1];
							
							_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
													
							if (_vehicle isKindOf "AIR") then  
							{

								if (alive _vehicle) then {sleep 5;};
					
								if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
								if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};		
								
								While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
								_vehicle land "LAND";
					
								if (alive _vehicle) then {sleep 5;};
			
							}
							else
							{
								While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
								sleep 5;
								_vehicle engineOn false;
							};
				
							if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
							if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
							
							WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
							
							_vehicle lock false;
							
							{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
							
							if (alive _vehicle) then 
							{
								sleep 30;
								
								_vehicle setDammage 0;

								_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
								_nx =  (count _cfg) - 1;

								for "_i" from 0 to _nx do 
								{
									_mn =  (_cfg select _i);
									_nm = getText (_mn >> "name");
									_vehicle setHit [_nm,  0];
								};
						
								_vehicle setFuel 100;
							};
					
							deleteWaypoint [_group, 1];
				
						};
						_vehicle engineOn false;
						
						_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];
					};

				};
	
				if ((_vehicle getVariable "DAP_BF_TRANSPORTREADY"==0) and (_vehicle getVariable "DAP_BF_TRANSPORTMISSIONTYPE"==1) and (alive _vehicle)) then 
				{
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					_position = _vehicle getVariable  "DAP_BF_TRANSPORTTARGETPOS";
					_targetunit = _vehicle getVariable "DAP_BF_TRANSPORTTARGETUNIT";
		
					_clearposition = _position findEmptyPosition [30,500];
							
					if ((count _clearposition)==0) then {_clearposition=_position;};
						
					_LZ = "HeliHEmpty"  createVehicle _clearposition;
							
					_LZ setCaptive true;
				
					if ((alive _vehicle) and (canMove _vehicle)) then {_vehwp = _group addWaypoint [_position,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";};
					
					[nil, _targetunit, "loc" + "per", rSPAWN, [_vehicle, _targetunit], 
					{
						_transport = _this select 0;
  						_targetedunit = _this select 1;
  						[_transport,_targetedunit] execVM "Scripts\UI\TransportMarker.sqf";
					
					}] call RE; 
					
					sleep 5;
				
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
				
					_vehicle lock false;
													
					if (_vehicle isKindOf "Helicopter") then  
					{
						_vehicle land "GET IN";	
					};
			
					_evactimer = DAP_BF_TRANSPORT_TIME;
				
					if((isNil("_evactimer")) or (_evactimer<180)) then {_evactimer=180;};
				
					While {(!(_targetunit in crew _vehicle) and (alive _vehicle) and (_evactimer>0))} do 
					{
						_evactimer = _evactimer-1;
						sleep 1;
					};
					
					deleteVehicle _LZ;
							
					deleteWaypoint [_group, 1];
										
					_vehwp = _group addWaypoint [_respawnpos,0]; [_group, 1] setWaypointType "MOVE"; [_group, 1] setWaypointBehaviour "CARELESS";
										
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					sleep 5;
										
					if (_vehicle isKindOf "AIR") then  
					{
						if (alive _vehicle) then {sleep 5;};
					
						if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
						if  (!(alive _vehicle)) then {{_x setDammage 1;}ForEach units _group;};
										
						While {((!(unitReady _vehicle)) and (!(isNull(assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
						_vehicle land "LAND";
						
						if (alive _vehicle) then {sleep 5;};
			
					}
					else
					{
						While {((!(unitReady _vehicle)) and (!(isNull (assignedDriver _vehicle))) and (count(crew _vehicle)!=0) and (alive _vehicle) and (canMove _vehicle) and (alive (driver _vehicle)))}do{sleep 1;};
						sleep 5;
						_vehicle engineOn false;
					};
					
					if (alive _vehicle) then {sleep 5;};
					
					if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
					if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
					
					WaitUntil {((!(isEngineOn _vehicle)) or (isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)) or (!(alive _vehicle)))};
					
					_vehicle lock false;
							
					{if(!(_x in (units _group))) then {unassignVehicle _x;};}ForEach crew _vehicle;
					
					sleep 5;
					
					{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false; _x action ["eject",_vehicle];};}ForEach crew _vehicle;
					
					{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
					
					if (alive _vehicle) then 
					{
						sleep 25;
					
						_vehicle setDammage 0;

						_cfg = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";
						_nx =  (count _cfg) - 1;

						for "_i" from 0 to _nx do 
						{
							_mn =  (_cfg select _i);
							_nm = getText (_mn >> "name");
							_vehicle setHit [_nm,  0];
						};
						
						_vehicle setFuel 100;
					
					};
					
					_vehicle setVariable ["DAP_BF_TRANSPORTREADY",1,true];

				};

			};
			sleep (3+(random 2));
			
			if (alive _vehicle) then
			{ 
				{if (!(_x in(units _group))) then {unassignVehicle _x;[_x] orderGetIn false;};}ForEach assignedCargo _vehicle;
				
				if (isNull(assignedDriver _vehicle)) then 
				{
					sleep 30;
					if (isNull(assignedDriver _vehicle)) then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
				};
			};
			if  ((isNull(assignedDriver _vehicle)) or (count(crew _vehicle)==0) or (!(canMove _vehicle)))then {{unassignVehicle _x; [_x] orderGetIn false;}ForEach crew _vehicle; sleep 30; _vehicle setDammage 1;};
			if (!(alive(_vehicle))) then {{_x setDammage 1;}ForEach units _group;};
			
			{unassignVehicle _x;}ForEach AssignedCargo _vehicle;
		};
	
		if (!(alive _vehicle)) then 
		{
	
			{
			
			if (!(isPlayer _x)) then {_x setDammage 1;};
		
			}ForEach units _group;
	
		};
		
		if (_side==0) then 
		{ 
			DAP_BF_EAST_TRANSPORT=DAP_BF_EAST_TRANSPORT-[_vehicle];
			PublicVariable "DAP_BF_EAST_TRANSPORT";
		};
	
		if (_side==1) then 
		{ 
			DAP_BF_WEST_TRANSPORT=DAP_BF_WEST_TRANSPORT-[_vehicle];
			PublicVariable "DAP_BF_WEST_TRANSPORT";
		};

		WaitUntil {sleep 1;(count(units _group)==0)};
		
		deleteGroup _group;
		
		[_vehicle,_vehicletype,_respawnpos,_crewtype,_dir,_strategytype] execVM "Scripts\DeleteVehicles.sqf";

	}
	else
	{
		
	if (_side==0) then 
	{ 
		DAP_BF_EAST_TRANSPORT=DAP_BF_EAST_TRANSPORT-[_vehicle];
		PublicVariable "DAP_BF_EAST_TRANSPORT";
	};
	
	if (_side==1) then 
	{ 
		DAP_BF_WEST_TRANSPORT=DAP_BF_WEST_TRANSPORT-[_vehicle];
		PublicVariable "DAP_BF_WEST_TRANSPORT";
	};
		
	[_vehicle, _crew,_respawnpos,_dir,_group,_crewtype,_strategytype] execVM "Scripts\AI\AssaultVehicleStrategy.sqf";
	};
	
};

