_COM = _this select 0;
_side= _this select 1;

_dir = getDir _COM;
_startpos = _COM modelToWorld [0,0,0];
_safepos = _COM modelToWorld [0,0,0];

DAP_BF_EAST_COMMSTATE = "AI";
publicVariable  "DAP_BF_EAST_COMMSTATE";
DAP_BF_WEST_COMMSTATE = "AI";
publicVariable  "DAP_BF_WEST_COMMSTATE";

_COM setVariable ["DAP_BF_COMMANDER",1,true];

if (_side == 0) then {DAP_BF_EAST_COMMANDER = _COM; publicVariable  "DAP_BF_EAST_COMMANDER";};
if (_side == 1) then {DAP_BF_WEST_COMMANDER = _COM; publicVariable  "DAP_BF_WEST_COMMANDER";};

removeallWeapons _COM;
_COM switchMove "";
_COM setDamage 0;
_COM setHit ["hands",0];
_COM setHit ["legs",0];
_COM switchMove "";

_COM disableAI "ANIM";
_COM disableAI "MOVE";

_COM setVehicleInit "this allowDamage false; this hideObject true;";
processInitCommands;
clearVehicleInit _COM;

_COM setPos _safepos;
_COM setDir _dir;

While {true} do
{

	WaitUntil {(isPlayer _COM);};

	_COM setPos _startpos;
	_COM setDir _dir;

	if (isMultiplayer) then
	{
		_COM setVehicleInit "this allowDamage true; this hideObject false;";
		processInitCommands;
		clearVehicleInit _COM;
	};
	
	_COM allowDamage true;

	if (isplayer _COM and (_side == 0)) then 
	{
		
		DAP_BF_EAST_COMMSTATE = "HUMAN";
		publicVariable  "DAP_BF_EAST_COMMSTATE";
		DAP_BF_EAST_COMMANDER = _COM;
		publicVariable  "DAP_BF_EAST_COMMANDER";
	};
	if (isplayer _COM and (_side == 1)) then 
	{
		DAP_BF_WEST_COMMSTATE = "HUMAN";
		publicVariable  "DAP_BF_WEST_COMMSTATE";
		DAP_BF_WEST_COMMANDER = _COM;
		publicVariable  "DAP_BF_WEST_COMMANDER";
	};
	
	WaitUntil {(!(isPlayer _COM));};

	removeallWeapons _COM;
	_COM switchMove "";

	_COM setDamage 0;
	_COM setHit ["hands",0];
	_COM setHit ["legs",0];
	_COM switchMove "";

	_COM disableAI "ANIM";
	_COM disableAI "MOVE";

	_COM setVehicleInit "this allowDamage false; this hideObject true;";
	processInitCommands;
	clearVehicleInit _COM;

	_COM setPos _safepos;
	_COM setDir _dir;
	
	if (!(isplayer _COM) and (_side == 0)) then 
	{
		DAP_BF_EAST_COMMSTATE = "AI";
		publicVariable  "DAP_BF_EAST_COMMSTATE";
		DAP_BF_EAST_COMMANDER = _COM;
		publicVariable  "DAP_BF_EAST_COMMANDER";
	};
	
	if (!(isplayer _COM) and (_side == 1)) then 
	{
		DAP_BF_WEST_COMMSTATE = "AI";
		publicVariable  "DAP_BF_WEST_COMMSTATE";
		DAP_BF_WEST_COMMANDER = _COM;
		publicVariable  "DAP_BF_WEST_COMMANDER";
	};

};