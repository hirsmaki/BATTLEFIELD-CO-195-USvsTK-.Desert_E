private ["_state"];
_unitsarray = _this select 0;

sleep 1;

If (isNil "RE") then
{
	[] execVM "\ca\Modules\MP\data\scripts\MPframework.sqf";
};	

waitUntil{!(isNil "BIS_MPF_InitDone")};

if (!(isClass(configFile>>"CfgPatches">>"SLX_Wounds"))) then 
{

	DAP_WOUNDED_SCREAMSOUND=["DAP_SCREAMA","DAP_SCREAMB","DAP_SCREAMC","DAP_SCREAMD","DAP_SCREAME","DAP_SCREAMF","DAP_SCREAMG","DAP_SCREAMH","DAP_SCREAMI","DAP_SCREAMJ"];
	PublicVariable "DAP_WOUNDED_SCREAMSOUND";
	
	DAP_WOUNDED_MOVES = ["GestureSpasm1","GestureSpasm2","GestureSpasm4","GestureSpasm5","GestureSpasm6"];  
	PublicVariable "DAP_WOUNDED_MOVES";
	
	if ((count(_unitsarray))>0) then 
	{
		if ((isServer) or (isDedicated)) then
		{
			DAP_AIFAS=1;
			PublicVariable "DAP_AIFAS";
	
			{
				if (_x isKindOf "CAManBase") then 
				{
			
					_state = _x getVariable "DAP_AIFAS_ASSIGNED";
	
					if (isNil("_state")) then 
					{
						if (!(isMultiplayer)) then {_x addEventHandler ["hit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];};
						if (isMultiplayer) then 
						{
							_x addMPEventHandler ["MPhit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];
							_x addMPEventHandler ["MPRespawn", 
							{
								(_this select 0) setCaptive false;
								(_this select 0) setVariable ["DAP_DRAGGED_STATE",false,true];
								(_this select 0) setVariable ["DAP_DRAGGER_STATE",false,true];
								
								[nil,(_this select 0),"per",rSPAWN, [(_this select 0)],
								{
									_man = _this select 0;
									_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
									_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","(((!(alive _target))or((lifeState _target)== 'UNCONSCIOUS'))and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];				
								
								}] call RE;
							}];
						};
						_x setVariable ["DAP_Drag",0,true];
						
						_x setVariable ["DAP_DRAGGED_STATE",false,true];
						_x setVariable ["DAP_DRAGGER_STATE",false,true];
						
						[nil, _x,"per",rSPAWN, [_x],
						{
							_man = _this select 0;
							_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
							_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","(((!(alive _target))or((lifeState _target)== 'UNCONSCIOUS'))and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];				
						
						}] call RE;				
						
						_x setVariable ["DAP_AIFAS_ASSIGNED",1,true];
					};
				};
		
				if (_x != vehicle _x) then 
				{
					_crew = crew vehicle _x;
					{ if (_x isKindOf "CAManBase") then 
						{
							_state = _x getVariable "DAP_AIFAS_ASSIGNED";
							if (isNil("_state")) then 
							{
								if (!(isMultiplayer)) then {_x addEventHandler ["hit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];};
								if (isMultiplayer) then 
								{
									_x addMPEventHandler ["MPhit", {_this execVM "DAPMAN\Scripts\Wounded\Wounded.sqf"}];
									_x addMPEventHandler ["MPRespawn", 
									{
										(_this select 0) setCaptive false;
										(_this select 0) setVariable ["DAP_DRAGGED_STATE",false,true];
										(_this select 0) setVariable ["DAP_DRAGGER_STATE",false,true];
										
										[nil,(_this select 0),"per",rSPAWN, [(_this select 0)],
										{
											_man = _this select 0;
											_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
											_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","(((!(alive _target))or((lifeState _target)== 'UNCONSCIOUS'))and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];
															
										}] call RE;
									}];
								};
								_x setVariable ["DAP_Drag",0,true];
								
								_x setVariable ["DAP_DRAGGED_STATE",false,true];
								_x setVariable ["DAP_DRAGGER_STATE",false,true];
							
								[nil, _x,"per",rSPAWN, [_x],
								{
									_man = _this select 0;
									_man addAction [localize "dragger.sqf0", "DAPMAN\Scripts\Wounded\Drop.sqf", [0],0,false,true,"","((_this getVariable 'DAP_DRAGGER_STATE')and(_target != player))"];
									_man addAction [localize "BC_addActions.sqf13", "DAPMAN\Scripts\Wounded\Drag.sqf", [0],0,false,true,"","(((!(alive _target))or((lifeState _target)== 'UNCONSCIOUS'))and((_this distance _target)<=2.5)and(!(_target getVariable 'DAP_DRAGGED_STATE')))"];				
								
								}] call RE;
									
								_x setVariable ["DAP_AIFAS_ASSIGNED",1,true];
							};
						};
						
					}ForEach _crew;
				};
	
			} forEach _unitsarray;	

		};

	};
};