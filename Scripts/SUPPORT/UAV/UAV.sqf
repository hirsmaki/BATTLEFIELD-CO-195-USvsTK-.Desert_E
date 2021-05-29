private ["_state","_UAVAREA","_UAVTARGETS"];

_targetpos = _this select 0;
_side = _this select 1;
_uavtime=180;
_n=0;

_state = 1;

sleep 5;

if (_side ==0) then {DAP_BF_EAST_UAV_REQUESTSTATE=2;publicVariable "DAP_BF_EAST_UAV_REQUESTSTATE";};
if (_side ==1) then {DAP_BF_WEST_UAV_REQUESTSTATE=2;publicVariable "DAP_BF_WEST_UAV_REQUESTSTATE";};

if ((_side ==0) and (DAP_BF_EAST_UAV==0)) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"UAVDENIED_EAST"] call RE; _state = 0;};
if ((_side ==1) and (DAP_BF_WEST_UAV==0)) then {[[WEST, "Airbase"], nil, rSIDERADIO, "UAVDENIED_WEST"] call RE; _state = 0;};
if ((_side ==0) and (DAP_BF_EAST_UAV==2)) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"UAVDENIED_EAST"] call RE; _state = 0;};
if ((_side ==1) and (DAP_BF_WEST_UAV==2)) then {[[WEST, "Airbase"], nil, rSIDERADIO, "UAVDENIED_ALT_WEST"] call RE; _state = 0;};

if (_state==1) then 
{
	if (_side == 0) then 
	{
		[[EAST,"Papa_Bear"], nil, rSIDERADIO, "UAV_EAST"] call RE;
		DAP_BF_EAST_UAV=2;
		publicVariable "DAP_BF_EAST_UAV";
		
		[2,_side,_targetpos] execVM "Scripts\UI\SupportMarkerManager.sqf";
		sleep 3;
		[[EAST,"Papa_Bear"], nil, rSIDERADIO,"UAVSTART_EAST"] call RE;
	
	};
	
	if (_side == 1) then 
	{
		[[WEST, "Airbase"], nil, rSIDERADIO, "UAVSTART_WEST"] call RE;
		DAP_BF_WEST_UAV=2;
		publicVariable "DAP_BF_WEST_UAV";
		
		[2,_side,_targetpos] execVM "Scripts\UI\SupportMarkerManager.sqf";
		sleep 3;
		[[WEST, "Airbase"], nil, rSIDERADIO, "UAV_WEST"] call RE;
	};
		 
	_UAVAREA = createTrigger ["EmptyDetector", _targetpos];
	_UAVAREA setTriggerActivation ["ANY", "present", true];
	_UAVAREA setTriggerArea [500,500, 0, false];
	_UAVAREA setTriggerStatements ["true", "", ""];
	_UAVAREA setTriggerTimeout [0, 0, 0, false];
	_UAVAREA setTriggerType "NONE";

	if (_side==0) then 
	{
		_COM=DAP_BF_EAST_COMMANDER;
		DAP_BF_EAST_UAV_POS=_targetpos;
		publicVariable "DAP_BF_EAST_UAV_POS";
		DAP_BF_EAST_UAV_ID= _side;
		publicVariable "DAP_BF_EAST_UAV_ID";
	};
	
	if (_side==1) then 
	{
		_COM=DAP_BF_WEST_COMMANDER;
		DAP_BF_WEST_UAV_POS=_targetpos;
		publicVariable "DAP_BF_WEST_UAV_POS";
		DAP_BF_WEST_UAV_ID= _side;
		publicVariable "DAP_BF_WEST_UAV_ID";
	};

	sleep 1;

	While {(_n< _uavtime)} do 
	{
		_UAVTARGETS = list _UAVAREA;

		{
			if (!(_x IsKindOf "MAN") and !(_x IsKindOf "LandVehicle") and !(_x IsKindOf "Air")) then 
			{
				_UAVTARGETS=_UAVTARGETS-[_x];};
			
			}ForEach _UAVTARGETS;

		if (_side==0) then {DAP_BF_EAST_UAV_TARGETS_ARRAY=_UAVTARGETS;publicVariable "DAP_BF_EAST_UAV_TARGETS_ARRAY";};
		if (_side==1) then {DAP_BF_WEST_UAV_TARGETS_ARRAY=_UAVTARGETS;publicVariable "DAP_BF_WEST_UAV_TARGETS_ARRAY";};

		[_side] execVM "Scripts\SUPPORT\UAV\UAVWORK.sqf";

		_n=_n+1;

		sleep 1;
	};

	deleteVehicle _UAVAREA;
	
	if (_side == 0) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"UAVEND_EAST"] call RE; DAP_BF_EAST_UAV=0;publicVariable "DAP_BF_EAST_UAV";};
	if (_side == 1) then {[[WEST, "Airbase"], nil, rSIDERADIO, "UAVEND_WEST"] call RE; DAP_BF_WEST_UAV=0;publicVariable "DAP_BF_WEST_UAV";};

	if (_side == 0) then {DAP_BF_EAST_UAV_TARGETS_ARRAY=[];publicVariable "DAP_BF_EAST_UAV_TARGETS_ARRAY";};
	if (_side == 1) then {DAP_BF_WEST_UAV_TARGETS_ARRAY=[];publicVariable "DAP_BF_WEST_UAV_TARGETS_ARRAY";};

	_uavdelay = DAP_BF_UAVDELAY;

	sleep _uavdelay;

	if (_side ==0) then {DAP_BF_EAST_UAV=1;publicVariable "DAP_BF_EAST_UAV";[[EAST,"Papa_Bear"], nil, rSIDERADIO,"UAVREADY_EAST"] call RE;};
	if (_side ==1) then {DAP_BF_WEST_UAV=1;publicVariable "DAP_BF_WEST_UAV";[[WEST, "Airbase"], nil, rSIDERADIO, "UAVREADY_WEST"] call RE;};
};
