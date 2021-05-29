DAP_BF_EAST_ART=0;
publicVariable "DAP_BF_EAST_ART";
DAP_BF_EAST_UAV=0;
publicVariable "DAP_BF_EAST_UAV";
DAP_BF_EAST_SUP=0;
publicVariable "DAP_BF_EAST_SUP";
DAP_BF_WEST_ART=0;
publicVariable "DAP_BF_WEST_ART";
DAP_BF_WEST_UAV=0;
publicVariable "DAP_BF_WEST_UAV";
DAP_BF_WEST_SUP=0;
publicVariable "DAP_BF_WEST_SUP"; 

[EASTCOM,0] execVM "Scripts\Commander.sqf";
[WESTCOM,1] execVM "Scripts\Commander.sqf";

[] execVM "Scripts\SUPPORT\UAV\UAVDelay.sqf";
[] execVM "Scripts\SUPPORT\SUPPLIES\SUPDelay.sqf";
[] execVM "Scripts\SUPPORT\ARTILLERY\ARTDelay.sqf";