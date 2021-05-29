private ["_winner"];

	DAP_BF_MISSIONEND=1;
	PublicVariable "DAP_BF_MISSIONEND";
	
	if(Escore>Wscore) then {_winner = "EAST";};
	if(Escore<Wscore) then {_winner = "WEST";};
	if(Escore==Wscore) then {_winner = "DRAW";};
	
	if (_winner == "EAST") then 
	{
	if (side group player == EAST) then 
		{
			titleText [localize "STR_MISSION_VICTORY", "PLAIN",5];
			PlayMusic "VICTORY_EAST";
		
		}
		Else
		{
			titleText [localize "STR_MISSION_DEFEAT", "PLAIN",5];
			PlayMusic "DEFEAT_WEST";
		};
	};
	if (_winner == "WEST") then 
	{
	if (side group player == WEST) then 
		{
			titleText [localize "STR_MISSION_VICTORY", "PLAIN",5];
			PlayMusic "VICTORY_WEST";
		
		}
		Else
		{
			titleText [localize "STR_MISSION_DEFEAT", "PLAIN",5];
			PlayMusic "DEFEAT_EAST";
		
		};
	};
	
	if (_winner == "DRAW") then 
	{
	if (side group player == EAST) then 
		{
			titleText [localize "STR_MISSION_DRAW", "PLAIN",5];
			PlayMusic "DEFEAT_EAST";
		
		}
		Else
		{
			titleText [localize "STR_MISSION_DRAW", "PLAIN",5];
			PlayMusic "DEFEAT_WEST";
		
		};
	};
	
	sleep 5;
	
	if ((isServer)or(isDedicated)) then 
	{
	if (_winner == "EAST") then {EASTWIN=1;publicVariable "EASTWIN";};
	if (_winner == "WEST") then {WESTWIN=1;publicVariable "WESTWIN";};
	if (_winner == "DRAW") then {MISSIONDRAW=1;publicVariable "MISSIONDRAW";};
	};

