private ["_vehicleType", "_position", "_group","_oldgroup","_unit", "_crewType", "_vehicle","_COM","_crewspawnpos","_countx","_stack"];

_vehicleclass= _this select 0;
_spawnpos = _this select 1;
_spawnedcrewtype = _this select 2;
_vehicleDir = _this select 3;
_strategytype  = _this select 4;

_sides = [east, west, resistance, civilian, nil, enemy, friendly, nil];
_countx=0;

_turretsArray = [ [0],[1],[2],[3],[4],[5],[0,1],[0,2],[0,3],[0,4],[0,5],[1,1],[1,2],[1,3],[1,4],[1,5],[2,1],[2,2],[2,3],[2,4],[2,5] ];

if ((isServer)or(isDedicated)) then 
{
	_vehicleType = _vehicleclass;
	_position = _spawnpos;
	_vehicle = createVehicle [_vehicleType, [_position select 0, _position select 1, 100000],[],0, "FORM"];
	
	if (_vehicle isKindOf "Su25_TK_EP1") then 
	{
		_weapons=["GSh301","Ch29Launcher","R73Launcher_2","S8Launcher","CMFlareLauncher"];
		_magazines = ["180Rnd_30mm_GSh301","4Rnd_Ch29","2Rnd_R73","80Rnd_S8T","120Rnd_CMFlareMagazine"];

		{_vehicle removeMagazine _x;}ForEach magazines _vehicle;
		{_vehicle removeWeapon _x;}ForEach weapons _vehicle;

		{_vehicle addMagazine _x;}ForEach _magazines;
		{_vehicle addWeapon _x;}ForEach _weapons;
	};
	
	if (_vehicle isKindOf "AH1Z") then 
	{
		_vehicle removeWeapon "SidewinderLaucher_AH1Z";
		_vehicle removeMagazine "2rnd_Sidewinder_AH1Z";
	};
		
	_vehicle setVariable ["DAP_VEHICLE_NOLIFT",1,true];
	
	_vehicle  setDir _vehicleDir;
	_vehicle setvelocity [0,0,0];
	_vehicle  setPos [_position select 0, _position select 1, 0.15];
     
	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
     
	_siden= getNumber (configFile >> "CfgVehicles" >> _vehicleType >> "side");
	_group = createGroup (_sides select _siden);
	_crewType = _spawnedcrewtype;
		
	_crewspawnpos = _vehicle ModelToWorld [0,0,100000];
 	
 	if (_strategytype==2) then 
 	{
		_vehicle lock true;
		_vehicle  setPosATL [_position select 0, _position select 1, 0];
		_vehicle  setDir _vehicleDir;
	}
 	else
 	{
		_vehicle lock true;
	};
	
	sleep 5;     

	if (damage _vehicle <0.25) then 
	{

		While {_countx < 3} do
		{
			_unit = _group createUnit [_crewType,[(_position select 0)-100*sin(getDir _vehicle), (_position select 1)-100*cos(getDir _vehicle),1000],[],50,"NONE"];
			_unit setVariable ["DAP_BF_CREW",1,true];
			
			if (isMultiplayer) then 
			{
				_xunit= _unit;
				[nil, _xunit, rSPAWN, [_xunit], 
				{
					_man = _this select 0;
					_man HideObject true;
					
				}] call RE;
			}
			else
			{
				_unit HideObject true;
			};
			
			_unit setPos _crewspawnpos;
			_group setFormDir _vehicleDir;
			_unit setDir _vehicleDir;

			_unit addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];
			
			_stack = 0;
			if (((_vehicle EmptyPositions "Commander") >0)and(_stack==0)) then 
			{
				_unit MoveInCommander _vehicle;				
				_unit setUnitRank "LIEUTENANT";
				_stack =1;
			};
			
			if (((_vehicle EmptyPositions "Driver") >0)and(_stack==0)) then 
			{
				_unit MoveInDriver _vehicle;
				_unit setUnitRank "CORPORAL";
				_stack =1;
			};
			
			if (((_vehicle EmptyPositions "Gunner") >0)and(_stack==0)) then 
			{
				_unit MoveInGunner _vehicle;
				_unit setUnitRank "SERGEANT";
				_stack =1;
			};
			
			if(_unit == (vehicle _unit)) then {deleteVehicle _unit;};		
			
			_countx = _countx+1;
		};
		  
		{
			_unit = _group createUnit [_crewType,[(_position select 0)-100*sin(getDir _vehicle), (_position select 1)-100*cos(getDir _vehicle),1000],[],50,"NONE"];
			_unit setVariable ["DAP_BF_CREW",1,true];
			
			_unit setPos _crewspawnpos;
			_group setFormDir _vehicleDir;
			_unit setDir _vehicleDir;
	
			_unit addEventHandler ["killed", {_this execVM "Scripts\ClearBattlefield.sqf"}];
			_unit moveInTurret [_vehicle,_x];
			
			if(_unit == (vehicle _unit)) then {deleteVehicle _unit;};
					
		}ForEach _turretsArray;
		
		{
			if(_x == (vehicle _x)) then {deleteVehicle _x;};
			
		}ForEach units _group;
		
		if (DAP_BF_CUSTOMLOADOUT==1) then 
		{
			{
				[_x] execVM "Scripts\SP\CustomLoadout.sqf";
			
			}ForEach units _group;
		};

		_vehicle lock false;
		
		{
			if (isMultiplayer) then 
			{
				_xunit= _x;
				[nil, _xunit, rSPAWN, [_xunit], 
				{
					_man = _this select 0;
					_man HideObject false;
				
				}] call RE;
			}
			else
			{
				_unit HideObject false;
			};
			
		}ForEach units _group;
			
		[_vehicle, (crew _vehicle),_spawnpos,_vehicleDir,_group,_spawnedcrewtype,_strategytype] execVM "Scripts\AI\VehicleManager.sqf";
	}
	else
	{
		_vehicletype = typeOf _vehicle;
		[_vehicle,_vehicletype,_spawnpos,_spawnedcrewtype,_vehicleDir,_strategytype] execVM "Scripts\DeleteVehicles.sqf";
	};
};