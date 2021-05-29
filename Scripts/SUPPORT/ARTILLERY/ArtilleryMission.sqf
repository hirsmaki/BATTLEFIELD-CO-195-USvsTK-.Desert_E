private ["_state","_round"];

_targetpos = _this select 0;
_battery = _this select 1;
_side = _this select 2;

_MINRANGE = DAP_BF_ARTYMINRANGE;
_MAXRANGE = DAP_BF_ARTYMAXRANGE;

_n=0;
_state = 1;
_maxshots=DAP_BF_ARTILLERYSHOTCOUNT;

sleep 5;

if (_side ==0)then {DAP_BF_EAST_ARTY_REQUESTSTATE=2;publicVariable "DAP_BF_EAST_ARTY_REQUESTSTATE";};
if (_side ==1)then {DAP_BF_WEST_ARTY_REQUESTSTATE=2;publicVariable "DAP_BF_WEST_ARTY_REQUESTSTATE";};

if ((_side ==0) and (DAP_BF_EAST_ART==0)) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"DENIED_EAST"] call RE; _state=0;};
if ((_side ==1) and (DAP_BF_WEST_ART==0)) then {[[WEST,"Airbase"], nil, rSIDERADIO,"DENIED_WEST"] call RE; _state=0;};

if ((_side ==0) and (((_battery select 0) distance _targetpos > _MAXRANGE) or ((_battery select 0) distance _targetpos < _MINRANGE))) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"DENIED_EAST"] call RE; _state=0;};
if ((_side ==1) and (((_battery select 0) distance _targetpos > _MAXRANGE) or ((_battery select 0) distance _targetpos < _MINRANGE))) then {[[WEST,"Airbase"], nil, rSIDERADIO,"DENIED_WEST"] call RE; _state=0;};

if (_state == 1) then 
{
	if (_side ==0) then {DAP_BF_EAST_ART=0;publicVariable "DAP_BF_EAST_ART";DAP_BF_EAST_ARTY_MARKERSTATE=1;publicVariable "DAP_BF_EAST_ARTY_MARKERSTATE";};
	if (_side ==1) then {DAP_BF_WEST_ART=0;publicVariable "DAP_BF_WEST_ART";DAP_BF_WEST_ARTY_MARKERSTATE=1;publicVariable "DAP_BF_WEST_ARTY_MARKERSTATE";};
	
	{_x doWatch [_targetpos select 0, _targetpos select 1, 5000];} ForEach _battery;
	
	if (_side ==0) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"STANDBY_EAST"] call RE;};
	if (_side ==1) then {[[WEST,"Airbase"], nil, rSIDERADIO,"STANDBY_WEST"] call RE;};
	
	[1,_side,_targetpos] execVM "Scripts\UI\SupportMarkerManager.sqf";
	
	sleep 5;
	
	if (_side ==0) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"FIRE_EAST"] call RE;};
	if (_side ==1) then {[[WEST,"Airbase"], nil, rSIDERADIO,"FIRE_WEST"] call RE;};
	
	While {(_n< _maxshots)} do 
	{
	
		{_x fire currentweapon _x;} forEach _battery;
		{_x setVehicleAmmo 1} forEach _battery;

		sleep 5;
		
		_n=_n+1;
	};
	
	sleep 5;
	
	if (_side ==0) then {_round = DAP_BF_EASTARTILLERYROUND;};
	if (_side ==1) then {_round = DAP_BF_WESTARTILLERYROUND;};
	
	_n=0;
	
	While {(_n< ((_maxshots)*(count _battery)))} do 
	{
	
		_shell= _round createVehicle [(_targetpos select 0)+(-50+random 100), (_targetpos select 1)+(-50+random 100), 1000];
		_shell setVelocity [0,0,-500];
		_n=_n+1;
		sleep 3;
	};

	if (_side ==0) then {DAP_BF_EAST_ARTY_MARKERSTATE=0;publicVariable "DAP_BF_EAST_ARTY_MARKERSTATE";};
	if (_side ==1) then {DAP_BF_WEST_ARTY_MARKERSTATE=0;publicVariable "DAP_BF_WEST_ARTY_MARKERSTATE";};

	_artdelay = DAP_BF_ARTDELAY;

	sleep _artdelay; 

	if (_side ==0) then {DAP_BF_EAST_ART=1;publicVariable "DAP_BF_EAST_ART"; [[EAST,"Papa_Bear"], nil, rSIDERADIO,"READY_EAST"] call RE;};
	if (_side ==1) then {DAP_BF_WEST_ART=1;publicVariable "DAP_BF_WEST_ART"; [[WEST,"Airbase"], nil, rSIDERADIO,"READY_WEST"] call RE;};
};