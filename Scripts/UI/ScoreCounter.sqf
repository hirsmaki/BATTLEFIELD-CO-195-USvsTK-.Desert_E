private ["_Escore","_Wscore"];

While {true} do 
{

		if(tBleedSide == EAST) then {Escore = Escore - 1};
		if(tBleedSide == WEST) then {Wscore = Wscore - 1};
	
	_Escore = str(Escore);
	_Wscore = str(Wscore);

	((HUDDisplay select 0) displayCtrl 51003) ctrlSetText _Wscore;
	((HUDDisplay select 0) displayCtrl 51004) ctrlSetText _Escore;
	
	sleep 2;
};
