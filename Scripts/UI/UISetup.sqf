if (!(isMultiplayer)) then 
{
OnTeamSwitch 
	{
		if (!(visibleMap)) then 
		{
			((HUDDisplay select 0) displayCtrl 51001) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51002) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51003) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51004) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51006) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51007) ctrlShow false;
		};
		
		_Westscorenow=Wscore;
		_Eastscorenow=Escore;
		_Wscore =str(Wscore);
		_Escore = str(Escore);
		
		((HUDDisplay select 0) displayCtrl 51003) ctrlSetText _Wscore;
		((HUDDisplay select 0) displayCtrl 51004) ctrlSetText _Escore;
		
		if (player == leader group player) then 
		{
		
			_playeriscom = player getVariable "DAP_BF_COMMANDER";
			_playerissl = player getVariable "DAP_BF_SQUADLEADER";
		
			if (!(isNil("_playeriscom"))) then
			{
				if (DAP_BF_AI_ENABLED==1) then 
				{
					BIS_Menu_GroupCommunication = 
					[
					[localize "STR_BF_SUPPORTMENU",false],
					[localize "STR_COM_ART", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Artillery\ArtillerySupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_COM_UAV", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\UAV\UAVSupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_COM_SUP", [4], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Supplies\SuppliesSupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_COM_TRN", [5], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\TransportSupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_COM_EVAC", [6], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacSupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
					];
				}
				else
				{
					BIS_Menu_GroupCommunication = 
					[
					[localize "STR_BF_SUPPORTMENU",false],
					[localize "STR_COM_ART", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Artillery\ArtillerySupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_COM_UAV", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\UAV\UAVSupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_COM_SUP", [4], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Supplies\SuppliesSupport.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
					];
				};
			};
			
			if (!(isNil("_playerissl"))) then
			{
			
				if (DAP_BF_AI_ENABLED==1) then 
				{
					BIS_Menu_GroupCommunication = 
					[
					[localize "STR_BF_SUPPORTMENU",false],
					[localize "STR_SL_ART", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Artillery\ArtilleryRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_SL_UAV", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\UAV\UAVRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_SL_SUP", [4], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Supplies\SuppliesRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_SL_TRN", [5], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\TransportRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_BF_EVAC", [6], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
					];
				}
				else
				{
					BIS_Menu_GroupCommunication = 
					[
					[localize "STR_BF_SUPPORTMENU",false],
					[localize "STR_SL_ART", [2], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Artillery\ArtilleryRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_SL_UAV", [3], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\UAV\UAVRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"],
					[localize "STR_SL_SUP", [4], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Supplies\SuppliesRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
					];
				};
			};
	 
			if (commandingmenu == "#USER:BIS_MENU_GroupCommunication") then {showCommandingMenu "#USER:BIS_MENU_GroupCommunication";};
		}
		else
		{
			if (DAP_BF_AI_ENABLED==1) then 
			{			
				BIS_Menu_GroupCommunication = 
				[
				[localize "STR_BF_SUPPORTMENU",false],
				[localize "STR_BF_EVAC", [6], "", -5, [ ["expression", "[_pos, player] execVM ""Scripts\Support\Transport\EvacRequest.sqf"""] ], "1", "CursorOnGround", "\ca\ui\data\cursor_support_ca"]
				];
			};
		
			if (commandingmenu == "#USER:BIS_MENU_GroupCommunication") then {showCommandingMenu "#USER:BIS_MENU_GroupCommunication";};	 
		};
		
		{if(_x!=player) then {_x stop false;};}ForEach switchableUnits;
		
		{_x setPos [0,0,-1000]; deleteVehicle _x;}ForEach DAP_BF_PLAYERSQUAD;
		
		DAP_BF_PLAYERSQUAD = [];
	};
};

if (local player) then 
{
	[] execVM "Scripts\UI\UIManager.sqf";
	[] execVM "Scripts\UI\ScoreCounter.sqf";
	[] execVM "Scripts\UI\PlayersMarkers.sqf";
	
	[player] execVM "Scripts\UI\COMMMenu.sqf";
	[player] execVM "Scripts\UI\OptionsManager.sqf";
	
	if (isMultiplayer) then 
	{
		player addEventHandler ["Respawn",
		{ 
			if (local (_this select 0)) then 
			{
				[(_this select 0)] execVM "Scripts\UI\OptionsManager.sqf";
			};
		}];
	};
};


