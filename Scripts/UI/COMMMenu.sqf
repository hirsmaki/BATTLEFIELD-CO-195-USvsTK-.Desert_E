_unit = _this select 0;

if (local player) then 
{
	if (player == leader (group player)) then 
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
	};
	 
	_playeriscom = player getVariable "DAP_BF_COMMANDER";
		
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

	if (commandingmenu == "#USER:BIS_MENU_GroupCommunication") then {showCommandingMenu "#USER:BIS_MENU_GroupCommunication";};
			
	While {true} do 
	{
		WaitUntil {sleep 1;(player == leader (group player));};
		
		if (player == leader (group player)) then 
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
		};
	 
		_playeriscom = player getVariable "DAP_BF_COMMANDER";
		
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

		if (commandingmenu == "#USER:BIS_MENU_GroupCommunication") then {showCommandingMenu "#USER:BIS_MENU_GroupCommunication";};
	
		WaitUntil {sleep 1;(player != leader (group player));};
			
		if (player == leader (group player)) then 
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
		};
	 
		_playeriscom = player getVariable "DAP_BF_COMMANDER";
		
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

		if (commandingmenu == "#USER:BIS_MENU_GroupCommunication") then {showCommandingMenu "#USER:BIS_MENU_GroupCommunication";};
	
	};
};