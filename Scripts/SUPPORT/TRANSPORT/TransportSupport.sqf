private ["_side","_state","_targetpos","_ALLTRANSPORT","_ACTIVETRANSPORT","_TRANSPORT"];

_targetpos = _this select 0;
_unit = _this select 1;
_state =0;

if ((side (group _unit))==EAST) then {_side=0;};
if ((side (group _unit))==WEST) then {_side=1;};

if (_side ==0) then 
	{
		_ALLTRANSPORT  = DAP_BF_EAST_TRANSPORT;
	
	};
if (_side ==1) then 
	{
		_ALLTRANSPORT  = DAP_BF_WEST_TRANSPORT;
	};

_ACTIVETRANSPORT  = _ALLTRANSPORT ;
if (count(_ACTIVETRANSPORT )>0) then 
{
	{if  (((_x getVariable "DAP_BF_TRANSPORTREADY")==0) or (isPlayer(driver _x))) then {_ACTIVETRANSPORT =_ACTIVETRANSPORT -[_x];};}ForEach _ACTIVETRANSPORT ;

	if (count(_ACTIVETRANSPORT )==0) then 
	{
	_state=1;
	}
	else
	{
	
	_TRANSPORT = _ACTIVETRANSPORT  select 0;
	
	if ((_unit distance _targetpos)>DAP_BF_TRANSPORT_MINDISTANCE) then
		{	
			
			if ((_TRANSPORT distance _targetpos)>DAP_BF_TRANSPORT_MINDISTANCE) then
			{ 
			
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTREADY",0,true];
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",0,true];
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTTARGETPOS",_targetpos,true];
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTTARGETUNIT",_unit,true];
			}
			else
			{
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTREADY",0,true];
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTMISSIONTYPE",1,true];
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTTARGETPOS",(getPos _unit),true];
				_TRANSPORT setVariable ["DAP_BF_TRANSPORTTARGETUNIT",_unit,true];
			};
			
			
		}
		else
		{
			_state=1;
		};
	};
}
else
{
	_state=1;
};

sleep 5;

if (_side ==0 and _state==1) then {[[EAST,"Papa_Bear"], nil, rSIDERADIO,"TRANSPORTDENIED_EAST"] call RE;};
if (_side ==1 and _state==1) then {[[WEST,"Airbase"], nil, rSIDERADIO,"TRANSPORTDENIED_WEST"] call RE;};

if (_state==0) then 
{

if (_side ==0) then 
	{
	[[EAST,"Papa_Bear"], nil, rSIDERADIO,"TRANSPORT_EAST"] call RE;
	
	};

if (_side ==1) then
	{
	[[WEST,"Airbase"], nil, rSIDERADIO,"TRANSPORT_WEST"] call RE;
	
	};
};

