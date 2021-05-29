private ["_side","_state","_targetpos","_vehicletype","_dropPosX","_dropPosY","_dropPosZ","_vehicletype","_crew","_spawn","_destination","_plane","_pilot","_group","_cargochute","_crate"];

_targetpos = _this select 0;
_side = _this select 1;
_cratetime=180;
_x=0;
_state=0;

sleep 5;

if (_side ==0) then {DAP_BF_EAST_SUP_REQUESTSTATE=2;publicVariable "DAP_BF_EAST_SUP_REQUESTSTATE";};
if (_side ==1) then {DAP_BF_WEST_SUP_REQUESTSTATE=2;publicVariable "DAP_BF_WEST_SUP_REQUESTSTATE";};

if (_side ==0 and DAP_BF_EAST_SUP==0) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"SUPDENIED_EAST"] call RE;_state=1;};
if (_side ==1 and DAP_BF_WEST_SUP==0) then {[[WEST,"Airbase"], nil, rSIDERADIO,"SUPDENIED_WEST"] call RE;_state=1;};

if (_state==0) then 
{

	[3,_side,_targetpos] execVM "Scripts\UI\SupportMarkerManager.sqf";

	if (_side ==0) then 
	{
	[[EAST,"Papa_Bear"], nil, rSIDERADIO,"SUPDROP_EAST"] call RE;
	DAP_BF_EAST_SUP=0;
	publicVariable "DAP_BF_EAST_SUP";
	
	DAP_BF_EAST_SUP_MARKERSTATE=1;
	publicVariable "DAP_BF_EAST_SUP_MARKERSTATE";
		
	_dropPosX = _targetpos select 0;
	_dropPosY = _targetpos select 1;
	_dropPosZ = _targetpos select 2;

	_vehicletype = DAP_BF_SUPPLIESDROPSOURCEEAST;
	_crew = DAP_BF_SUPPLIESTRANSPORTEASTCREW;

	_spawn = [_dropPosX, _dropPosY -5000, DAP_BF_SUPPLIESDROPHEIGHT];
	_destination = [_dropPosX, _dropPosY +5000, DAP_BF_SUPPLIESDROPHEIGHT];

	_plane = createVehicle [_vehicletype, _spawn, [], 0, "FLY"];

	_group = createGroup EAST;
	_pilot = _group createUnit [_crew, _spawn, [], 0, "NONE"];

	_pilot setBehaviour "CARELESS";
	_pilot disableAI "AUTOTARGET";
	_pilot disableAI "TARGET";
	_pilot disableAI "MOVE";
	
	_pilot setCaptive true;
	
	_pilot assignAsDriver _plane;
	_pilot moveindriver _plane;
	_unit = driver(_plane);
	_unit action ["gear_up", _plane];

	_plane FlyInHeight DAP_BF_SUPPLIESDROPHEIGHT;

	_vehwpA = _group addWaypoint [_destination,0];
	[_group, 1] setWaypointType "MOVE";
	[_group, 1] setWaypointBehaviour "CARELESS";
	};


	if (_side ==1) then
	{
	[[WEST,"Airbase"], nil, rSIDERADIO,"SUPDROP_WEST"] call RE;
	DAP_BF_WEST_SUP=0;
	publicVariable "DAP_BF_WEST_SUP";
	
	DAP_BF_WEST_SUP_MARKERSTATE=1;
	publicVariable "DAP_BF_WEST_SUP_MARKERSTATE";

	_dropPosX = _targetpos select 0;
	_dropPosY = _targetpos select 1;
	_dropPosZ = _targetpos select 2;
	
	_vehicletype = DAP_BF_SUPPLIESDROPSOURCEWEST;
	_crew = DAP_BF_SUPPLIESTRANSPORTWESTCREW;

	_spawn = [_dropPosX, _dropPosY -5000, DAP_BF_SUPPLIESDROPHEIGHT];
	_destination = [_dropPosX, _dropPosY +5000, DAP_BF_SUPPLIESDROPHEIGHT];

	_plane = createVehicle [_vehicletype, _spawn, [], 0, "FLY"];

	_group = createGroup WEST;
	_pilot = _group createUnit [_crew, _spawn, [], 0, "NONE"];

	_pilot setBehaviour "CARELESS";
	_pilot disableAI "AUTOTARGET";
	_pilot disableAI "TARGET";
	_pilot disableAI "MOVE";
	
	_pilot setCaptive true;
	
	_pilot assignAsDriver _plane;
	_pilot moveindriver _plane;
	_unit = driver(_plane);
	_unit action ["gear_up", _plane];

	_plane FlyInHeight DAP_BF_SUPPLIESDROPHEIGHT;

	_vehwpA = _group addWaypoint [_destination,0];
	[_group, 1] setWaypointType "MOVE";
	[_group, 1] setWaypointBehaviour "CARELESS";
	};

	_velocity = velocity _plane;
	
	[_plane,_pilot,_group,_velocity] execVM "Scripts\Support\Supplies\TransportManager.sqf";
	
	While {((_dropPosY > (getPos _plane select 1)) and (alive _plane))} do 
	{	
		sleep 0.25;
	};
	
	_plane setVariable ["DAP_SUPPLIESTRANSPORT_DROP",1,true];
	
	if ((alive _plane)and(canMove _plane)) then 
	{
		_planepos = _plane modelToWorld [0,0,0];

		if (_side ==0) then 
		{	
		_cargochute = createVehicle ["ParachuteMediumEast_EP1", [_planepos select 0, ((_planepos select 1)-15), ((_planepos select 2)-25)],[],0, "NONE"];
		_crate = createVehicle [DAP_BF_SUPPLYCRATE_EAST, [_planepos select 0, ((_planepos select 1)-15), ((_planepos select 2)-25)],[],0, "NONE"];
		_crate attachTo [_cargochute,[0,0,0.5]];
		};
		
		if (_side ==1) then 
		{
		_cargochute = createVehicle ["ParachuteMediumWest_EP1", [_planepos select 0, (_planepos select 1)-15, ((_planepos select 2)-25)],[],0, "NONE"];
		_crate = createVehicle [DAP_BF_SUPPLYCRATE_WEST, [_planepos select 0, (_planepos select 1)-15, ((_planepos select 2)-15)],[],0, "NONE"];
		_crate attachTo [_cargochute,[0,0,0.5]];
		};
		
		sleep 0.1;
		_cargochute setVelocity [0,0,-10];

		sleep 5;

		WaitUntil {(getPos _cargochute select 2 <5)};
		_targetpos = getPos _crate;

		deletevehicle _crate;

		if (_side ==0) then 
		{
			_crate = createVehicle [DAP_BF_SUPPLYCRATE_EAST, [_targetpos select 0, _targetpos select 1, 0],[],0, "NONE"]; _crate setVehicleInit "{this addWeaponCargo _x;}ForEach EASTWEAPONS; {this addMagazineCargo _x;} ForEach EASTMAGAZINES;";processInitCommands;clearVehicleInit _crate;
		};
	
		if (_side ==1) then 
		{
			_crate = createVehicle [DAP_BF_SUPPLYCRATE_WEST, [_targetpos select 0, _targetpos select 1, 0],[],0, "NONE"]; _crate setVehicleInit "{this addWeaponCargo _x;}ForEach WESTWEAPONS; {this addMagazineCargo _x;} ForEach WESTMAGAZINES;";processInitCommands;clearVehicleInit _crate;
		};

		_crate allowDamage false;

		sleep 0.5;

		_cargochute setPos [(_targetpos select 0)+2.5, (_targetpos select 1)-2.5];

		_smokedir = (random(360));
		_smokesignal = "SmokeShellGreen" createVehicle [(_targetpos select 0)+10*sin(_smokedir), (_targetpos select 1)+10*cos(_smokedir), (_targetpos select 2)];
		
		[nil,_crate,"per",rADDACTION, localize "STR_SUPHEAL", "Scripts\Support\Supplies\Heal.sqf",[0],0,false,true,"","(((damage player) >0)and((player distance cursortarget )<4.5))"] call RE;
		
		While {((alive _crate) and (_x< _cratetime))} do 
		{
			sleep 10;
			_x=_x+10;
		};
	};
	
	if (_side ==0) then {DAP_BF_EAST_SUP_MARKERSTATE=0;publicVariable "DAP_BF_EAST_SUP_MARKERSTATE";};
	if (_side ==1) then {DAP_BF_WEST_SUP_MARKERSTATE=0;publicVariable "DAP_BF_WEST_SUP_MARKERSTATE";};

	deleteVehicle _crate;

	_supdelay = DAP_BF_SUPDELAY;

	sleep _supdelay;

	if (_side ==0) then {DAP_BF_EAST_SUP=1;publicVariable "DAP_BF_EAST_SUP";[[EAST,"Papa_Bear"], nil, rSIDERADIO,"SUPREADY_EAST"] call RE;};
	if (_side ==1) then {DAP_BF_WEST_SUP=1;publicVariable "DAP_BF_WEST_SUP";[[WEST,"Airbase"], nil, rSIDERADIO,"SUPREADY_WEST"] call RE;};
};

