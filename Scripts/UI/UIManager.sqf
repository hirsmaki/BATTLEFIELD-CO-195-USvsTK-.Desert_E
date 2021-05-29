

		//WaitUntil {(visibleMap);};
		DAP_BF_MAPSTATE=1;
		
		CutRsc ["DAP_BF_UI","PLAIN",0.01];
		
		if (MAXTIME==0) then
   		{
			((HUDDisplay select 0) displayCtrl 51006) ctrlShow false;
			((HUDDisplay select 0) displayCtrl 51007) ctrlShow false;
		}
		else
		{
			((HUDDisplay select 0) displayCtrl 51006) ctrlShow true;
			((HUDDisplay select 0) displayCtrl 51007) ctrlShow true;
		};
	
		((HUDDisplay select 0) displayCtrl 51001) ctrlShow true;
		((HUDDisplay select 0) displayCtrl 51002) ctrlShow true;
		((HUDDisplay select 0) displayCtrl 51003) ctrlShow true;
		((HUDDisplay select 0) displayCtrl 51004) ctrlShow true; 
		
		_Wscore =str(Wscore);
		_Escore =str(Escore);
		((HUDDisplay select 0) displayCtrl 51003) ctrlSetText _Wscore;
		((HUDDisplay select 0) displayCtrl 51004) ctrlSetText _Escore;  
		
		//WaitUntil {(!(visibleMap));};

		/*
		DAP_BF_MAPSTATE=0;
		((HUDDisplay select 0) displayCtrl 51001) ctrlShow false;
		((HUDDisplay select 0) displayCtrl 51002) ctrlShow false;
		((HUDDisplay select 0) displayCtrl 51003) ctrlShow false;
		((HUDDisplay select 0) displayCtrl 51004) ctrlShow false; 
		((HUDDisplay select 0) displayCtrl 51006) ctrlShow false;
		((HUDDisplay select 0) displayCtrl 51007) ctrlShow false; 
		*/
