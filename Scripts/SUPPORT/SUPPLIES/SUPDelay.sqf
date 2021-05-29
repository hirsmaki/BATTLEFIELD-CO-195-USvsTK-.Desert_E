
_SUPDelay =DAP_BF_SUPDELAY; 

sleep _SUPDelay;

DAP_BF_EAST_SUP=1;
publicVariable "DAP_BF_EAST_SUP";
DAP_BF_WEST_SUP=1;
publicVariable "DAP_BF_WEST_SUP";
[[EAST,"Papa_Bear"], nil, rSIDERADIO,"SUPREADY_EAST"] call RE;
[[WEST,"Airbase"], nil, rSIDERADIO,"SUPREADY_WEST"] call RE;
