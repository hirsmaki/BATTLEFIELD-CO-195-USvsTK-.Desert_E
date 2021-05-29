private ["_ce","_cw","_ls","_state","_counter","_capturecounter"];

if ((isServer)or (isDedicated)) then 
{
	
_CP =_this select 0;
_CPL= _this select 1;
_CPLM = _this select 2;
_RANGE = _this select 3;

_state=0;
_counter=0;
_capturecounter=0;

Escore =2000;
PublicVariable "Escore";
Wscore =2000;
PublicVariable "Wscore";

_CPL setVariable ["DAP_BF_CPAREA",_RANGE,true];

_ps = _CP modelToWorld [0,0,0];

While {true} do 
{
	_ls = _ps nearEntities [["CAManBase","LandVehicle"],_RANGE];
	_ce = EAST countSide _ls;
	_cw = WEST countSide _ls;
	if ((Escore>0) and (Wscore>0) and (MAXSCORE>0)) then 
	{
		if ((_ce > 0) and (_cw == 0) and ((_CPL getVariable "DAP_BF_PTOWNER")!=0)) then 
   		{
	     	 _capturecounter = _capturecounter +1;
   	  		if (_capturecounter == DAP_BF_CAPTURETIME) then 
   			{
	   			_capturecounter =0;
	   			if ((_ce > 0) and (_cw == 0) and ((_CPL getVariable "DAP_BF_PTOWNER")!=0)) then 
   	   			{
	   				_CPL setVariable ["DAP_BF_PTOWNER",0,true];
	   				_CP setFlagTexture DAP_BF_EASTFLAG;
	   				_CPLM setMarkerColor "ColorRED";
	   				if (_state!=1) then 
	   				{
		   				if (DAP_BF_SPAWNDEFENCESQUAD==1) then 
		   				{
		   					[_CP,_CPL,_RANGE] execVM "Scripts\AI\CPDefense.sqf";
		   				};
		   				[[EAST,"Papa_Bear"], nil, rSIDERADIO,"CAPTURECP_EAST"] call RE;
		   				[[WEST,"Airbase"], nil, rSIDERADIO,"LOSTCP_WEST"] call RE;
						[EAST,_state] call bleedBias;
		   				_state =1;
		   			};
	   			};
	   		};
   		};
   		if ((_ce == 0) and (_cw > 0)and ((_CPL getVariable "DAP_BF_PTOWNER")!=1)) then 
   		{
	 		_capturecounter = _capturecounter +1;
   	  		if (_capturecounter == DAP_BF_CAPTURETIME) then 
   			{
	   			_capturecounter =0;
	  			 if ((_ce == 0) and (_cw > 0) and ((_CPL getVariable "DAP_BF_PTOWNER")!=1)) then 
   	  			{
	   				_CPL setVariable ["DAP_BF_PTOWNER",1,true];
	   				_CP setFlagTexture DAP_BF_WESTFLAG;
	   				_CPLM setMarkerColor "ColorBlue";
	   				if (_state!=2)then 
	   				{
		   				if (DAP_BF_SPAWNDEFENCESQUAD==1) then 
		   				{
		   					[_CP,_CPL,_RANGE] execVM "Scripts\AI\CPDefense.sqf";
		   				};
		   				[[WEST,"Airbase"], nil, rSIDERADIO,"CAPTURECP_WEST"] call RE;
		   				[[EAST,"Papa_Bear"], nil, rSIDERADIO,"LOSTCP_EAST"] call RE;
						[WEST,_state] call bleedBias;
		   				_state =2;
		   			};
   	   			};
   			};
   		};
    	// 	_counter = _counter +1;
   		// if (_counter == DAP_BF_SCORESRATIOTIME) then 
   		// {
   			// _counter = 0;
   		// 	if (((_CPL getVariable "DAP_BF_PTOWNER")==0) and (Escore<MAXSCORE)) then {Escore = Escore + 1;publicVariable "Escore";};
   		// 	if (((_CPL getVariable "DAP_BF_PTOWNER")==1) and (Wscore<MAXSCORE)) then {Wscore = Wscore + 1;publicVariable "Wscore";};
   		// // };
	};
   
	if ((_CPL getVariable "DAP_BF_PTOWNER") == 0) then {_CPLM setMarkerColor "ColorRED";};
	if ((_CPL getVariable "DAP_BF_PTOWNER") == 1) then {_CPLM setMarkerColor "ColorBLUE";};
   
	sleep 1;
};

	};