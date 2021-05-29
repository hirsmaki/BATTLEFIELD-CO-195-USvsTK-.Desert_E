private ["_range","_nearunits","_countenemy","_unitarms"];

_unit = _this select 0;
_enemyside = _this select 1;
_range=50;
_unitarms=0;

sleep 5;

_nearunits = _unit nearEntities _range;
_countenemy = _enemyside countSide _nearunits;

if (!(isPlayer _unit)) then
{
	
	if (skill _unit > 0.65) then {_range=75;};
	if (skill _unit > 0.85) then {_range=100;};

	_unit setVariable ["DAP_AIFAS_CANBEINTERROGATED",1,true];
	
	While {_countenemy>0} do

	{
		_nearunits = _unit nearEntities _range;
		_countenemy = _enemyside countSide _nearunits;
		if (isPlayer _unit) then {_countenemy=-1;};
		
		if (!(alive _unit)) then {_countenemy=-1;};
		sleep 5;
	};
	
	_unit setVariable ["DAP_AIFAS_CANBEINTERROGATED",0,true];
};

if (isPlayer _unit) then
{
	
	_nearunits = _unit nearEntities _range;
	_countenemy = _enemyside countSide _nearunits;
	
	While {_countenemy>0} do
	{
		_nearunits = _unit nearEntities 15;
		_countenemy = _enemyside countSide _nearunits;
		if ((currentWeapon _unit)!="") then {_countenemy=-1;};
		
		if (!(alive _unit)) then {_countenemy=-1;};
		sleep 1;
	};
	
	if(!(isMultiplayer))then {_unit setCaptive false;};
	if(isMultiplayerthen) then {_unit setVehicleInit "this setCaptive false";processInitCommands;clearVehicleInit _unit;};
		
	_nearunits = _unit nearEntities 50;
	{if (side _x == _enemyside) then {_x doFire _unit;};}ForEach _nearunits;
	
};

if(!(isMultiplayer)) then {_unit setCaptive false;};
if(isMultiplayerthen) then  {_unit setVehicleInit "this setCaptive false";processInitCommands;clearVehicleInit _unit;};
	
_unit setVehicleInit "this enableAI ""ANIM""";processInitCommands;clearVehicleInit _unit;
_unit setVehicleInit "this enableAI ""MOVE""";processInitCommands;clearVehicleInit _unit;
_unit setVehicleInit "this enableAI ""TARGET""";processInitCommands;clearVehicleInit _unit;
_unit setVehicleInit "this enableAI ""AUTOTARGET""";processInitCommands;clearVehicleInit _unit;
_unit setVehicleInit "this disableConversation false";processInitCommands;clearVehicleInit _unit;

_unit setVariable ["BIS_BC_dragger",false,true];
_unit setVariable ["BIS_BC_dragged",false,true];
_unit setVariable ["BIS_BC_carried",false,true];
_unit setVariable ["DAP_Drag",0,true];
_unit setVariable ["DAP_PFA",2,true];

_unit setVariable ["DAP_WOUNDED_STATE",0,true];

_unit setVehicleInit "this setUnitPos ""AUTO""";processInitCommands;clearVehicleInit _unit;
_unit setVehicleInit "this setSpeedMode ""FULL""";processInitCommands;clearVehicleInit _unit;

if (!(isMultiplayer)) then {_unit addEventHandler ["hit", {_this exec "DAPMAN\Scripts\Wounded\Wounded.sqs"}];};
if (isMultiplayer)then {_unit addMPEventHandler ["MPhit", {_this exec "DAPMAN\Scripts\Wounded\Wounded.sqs"}];};