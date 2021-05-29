private ["_cargodata","_data","_jumppos","_n"];

_vehicle = _this select 0;
_unit = _this select 1;

_cargodata = _vehicle  getVariable "DAP_CARGO_POSITIONS";
_data = [];

if ((typeOF _vehicle) == "BTR90") then 
{
	_data =[[330,[-0.8,-0.5,-0.1],"aav_cargo01"], [340,[-0.85,-1.8,-0.05],"aav_cargo01"],[270,[-0.95,-3.3,-0.05],"aav_cargo01"],[150,[0.8,-0.5,-0.1],"aav_cargo01"],[90,[0.95,-1.8,0.05],"stryker_cargo01"], [180,[0.85,-3.4,-0.1],"aav_cargo01"]]; 
	_jumppos=[[-2.5,0,-2.2],[-2.5,-2,-2.2],[-2.5,-4,-2.2],[2.5,0,-2.2],[2.5,-2,-2.2],[2.5,-4,-2.2]];
};
if ((typeOF _vehicle) == "BTR90_HQ") then 
{
	_data =[[330,[-0.5,-0.5,-0.5],"aav_cargo01"],[340,[-0.85,-1.8,-0.8],"aav_cargo01"],[270, [-0.95,-3.1,-0.8],"aav_cargo01"],[150,[0.5,-0.5,-0.5],"aav_cargo01"],[90,[0.95,-1.8,-0.7],"stryker_cargo01"],[180,[0.95,-3.1,-0.8],"aav_cargo01"]];
	_jumppos=[[-2.5,0,-2.2],[-2.5,-2,-2.2],[-2.5,-4,-2.2],[2.5,0,-2.2],[2.5,-2,-2.2],[2.5,-4,-2.2]];
};
if ((typeOF _vehicle) == "BMP3") then 
{
	_data =[[330,[-1.35,0,-0.5],"aav_cargo01"], [270,[-1.4,-1.75,-0.5],"stryker_cargo01"],[270,[-1.3,-2.85,-0.5],"aav_cargo01"],[150,[1,0,-0.5],"aav_cargo01"],[90,[1.13,-2.1,-0.5],"stryker_cargo01"], [180,[0.9,-3,-0.5],"aav_cargo01"]]; 
	_jumppos=[[-2.5,0,-2.2],[-2.5,-2,-2.2],[-2.5,-4,-2.2],[2.5,0,-2.2],[2.5,-2,-2.2],[2.5,-4,-2.2]];
};
if (_vehicle isKindOf "BMP2_Base") then 
{
	_data =[[245,[-0.85,0.375,-0.35],"aav_cargo03"],[270,[-0.9,-1.385,-0.35],"stryker_cargo01"],[200,[-0.8,-2.35,-0.4],"aav_cargo03"],[150,[0.95,0.35,-0.425],"aav_cargo01"],[90,[0.9,-1.385,-0.35],"stryker_cargo01"],[185,[0.7,-2.45,-0.4],"aav_cargo01"]];
	_jumppos=[[-3,0,-5],[-3,-2,-5],[-3,-4,-5],[3,0,-5],[3,-2,-5],[3,-4,-5]];
};
if (_vehicle isKindOf "BMP2_HQ_Base") then 
{
	_data =[[245,[-0.85,-0.25,-3.9],"aav_cargo03"],[270,[-1,-1.8,-3.9],"stryker_cargo01"],[270,[-0.7,-3.1,-3.65],"aav_cargo01"],[150,[1,0.3,-3.9],"aav_cargo01"],[90,[1,-1.8,-3.9],"stryker_cargo01"],[185,[0.7,-3.15,-3.65],"aav_cargo01"]];
	_jumppos=[[-3,0,-5],[-3,-2,-5],[-3,-4,-5],[3,0,-5],[3,-2,-5],[3,-4,-5]];
};

if ((count _data) > 0) then 
{
	_unit setVariable ["DAP_WOUNDED_STATE",1,true];

	if ((count _cargodata) > 0) then 
	{
		{
			if ((isNil ("_x"))or(isNull _x)or(!(alive _x))) then 
			{
				_cargodata = _cargodata - [_x];
			};
	
		}ForEach _cargodata;
	};
};

if ((count _cargodata) == 6) exitWith {if (isPlayer _unit) then {HintSilent (localize "DAP_CARGO_INF_NOPOS")};};

_cargodata = _cargodata + [_unit];
_vehicle setVariable ["DAP_CARGO_POSITIONS", _cargodata, true];
_n = (_cargodata find _unit);

_posdata = _data select _n;
_unit attachTo [_vehicle, _posdata select 1];

_unit setVehicleInit format ["this switchMove '%1'; this setDir %2",(_posdata select 2),(_posdata select 0)];
processInitCommands;
clearVehicleInit _unit;

sleep  1;

[nil,nil, rSPAWN,[_vehicle,_unit],
{
	if ((isServer)or(isDedicated)) then 
	{
		private ["_cstate","_cdata"];
		_cstate = 0;
		
		While {((alive (_this select 1))and(_cstate==0))} do 
		{
			_cdata = (_this select 0) getVariable "DAP_CARGO_POSITIONS";
			if (!((_this select 1) in _cdata)) then {_cstate=1;};
			sleep 1;
		};
		
		if ((!(alive (_this select 1)))and(_cstate==0)) then 
		{
			_cdata = _cdata - [(_this select 1)];
			(_this select 0) setVariable ["DAP_CARGO_POSITIONS", _cdata, true];
		};
	};
	
}] call RE;

if (isPlayer _unit) then 
{
	WaitUntil {((!(alive _unit))or((inputAction "MoveForward") == 1))};
	10 cuttext ["","BLACK IN", 2];
	_unit attachto [_vehicle,_jumppos select _n];
	_unit setDir (_posdata select 0);
	sleep 0.25;
	detach _unit;
	_unit setVehicleInit format ["this switchMove ''; this setDir %1",(getDir _vehicle)];
	processInitCommands;
	clearVehicleInit _unit;
	
	_unit setVariable ["DAP_WOUNDED_STATE",nil,true];

	unassignVehicle _unit;

	_cargodata = _cargodata - [_unit];
	_vehicle setVariable ["DAP_CARGO_POSITIONS", _cargodata, true];
}
else
{
	WaitUntil {((!(alive _unit))or(currentCommand _unit != ""))};
	_unit attachto [_vehicle,_jumppos select _n];
	_unit setDir (_posdata select 0);
	sleep 0.25;
	detach _unit;
	_unit setVehicleInit format ["this switchMove ''; this setDir %1",(getDir _vehicle)];
	processInitCommands;
	clearVehicleInit _unit;
		
	_unit setVariable ["DAP_WOUNDED_STATE",nil,true];

	unassignVehicle _unit;

	_cargodata = _cargodata - [_unit];
	_vehicle setVariable ["DAP_CARGO_POSITIONS", _cargodata, true];
};