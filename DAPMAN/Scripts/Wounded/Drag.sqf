_unit = _this select 0;
_dragger = _this select 1;

[nil,nil, rSPAWN,[_unit,_dragger],
{
	
if (isServer) then 
{
	if (alive (_this select 1)) then 
	{
		(_this select 0) setVariable ["DAP_DRAGGED_STATE",true,true];
		(_this select 1) setVariable ["DAP_DRAGGER_STATE",true,true];
		
		(_this select 1) setVariable ["DAP_WOUNDED_STATE",1,true];

		[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWrflDnon"] call RE;
		[nil,(_this select 1), rPLAYMOVENOW,"AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2"] call RE;
		
		waitUntil {(((animationState (_this select 1)) != "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2")or(!(alive (_this select 1))))};
	
		sleep 0.5;
						
		(_this select 0) setVariable ["BIS_BC_dragged",true,true];
		(_this select 0) setVariable ["BIS_BC_carried",true,true];
		
		[nil,(_this select 1),"loc",rSPAWN,[(_this select 1)],
		{		
			DAP_AIFAS_DRAG_KeyBlock = compile preprocessFile "DAPMAN\Scripts\Wounded\BlockKP.sqf";
			DONBKP = (findDisplay 46) displayAddEventHandler ["keyDown","_this call DAP_AIFAS_DRAG_KeyBlock"];
			
		}] call RE;
		
		[nil,(_this select 0), rPLAYACTIONNOW,"GestureNod"] call RE;
		[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWrflDnon"] call RE;
		[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWnonDb_grab"] call RE;
		[(_this select 0), (_this select 1), [0.175,0.97,0],180] execVM "DAPMAN\Scripts\Wounded\Attach.sqf";
		
		waitUntil {(((animationState (_this select 1)) == "acinpknlmstpsraswrfldnon")or((animationState (_this select 1)) == "acinpknlmwlksraswrfldb")or(!(alive (_this select 1)))or(isNull(_this select 0)))};
		waitUntil {((((animationState (_this select 1)) != "acinpknlmstpsraswrfldnon")and((animationState (_this select 1)) != "acinpknlmwlksraswrfldb"))or(!(alive (_this select 1)))or(isNull(_this select 0)))};
		
		detach (_this select 0);
		
		if (!(isNull(_this select 0))) then 
		{
			[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWnonDb_release"] call RE;
		
			(_this select 0) setVariable ["BIS_BC_dragged",false,true];
			(_this select 0) setVariable ["BIS_BC_carried",false,true];
		
			(_this select 0) setVariable ["DAP_DRAGGED_STATE",false,true];
		};
		
		(_this select 1) setVariable ["DAP_DRAGGER_STATE",false,true];			
		(_this select 1) setVariable ["DAP_WOUNDED_STATE",nil,true];
		
		sleep 1.5;
		
		if (!(isNull(_this select 0))) then 
		{
			[nil,(_this select 0), rSWITCHMOVE,"AinjPpneMstpSnonWrflDnon"] call RE;
		};
		
		[nil,(_this select 1),"loc",rSPAWN,[(_this select 1)],
		{		
			(findDisplay 46) displayRemoveEventHandler ["keyDown",DONBKP];
			
		}] call RE;
	};
};

}] call RE;
