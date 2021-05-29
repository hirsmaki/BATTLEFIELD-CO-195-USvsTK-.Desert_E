
_UAVDelay =DAP_BF_UAVDELAY;

sleep _UAVDelay;

DAP_BF_EAST_UAV=1;
publicVariable "DAP_BF_EAST_UAV";
DAP_BF_WEST_UAV=1;
publicVariable "DAP_BF_WEST_UAV";
[[EAST,"Papa_Bear"], nil, rSIDERADIO,"UAVREADY_EAST"] call RE;
[[WEST,"Airbase"], nil, rSIDERADIO,"UAVREADY_WEST"] call RE;