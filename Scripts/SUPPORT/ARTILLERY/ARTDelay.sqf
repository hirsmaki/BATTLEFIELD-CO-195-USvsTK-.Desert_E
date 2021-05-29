 
_ARTDelay =DAP_BF_ARTDELAY; 

sleep _ARTDelay;

DAP_BF_EAST_ART=1;
publicVariable "DAP_BF_EAST_ART";
DAP_BF_WEST_ART=1;
publicVariable "DAP_BF_WEST_ART";
[[EAST,"Papa_Bear"], nil, rSIDERADIO,"READY_EAST"] call RE;
[[WEST,"Airbase"], nil, rSIDERADIO,"READY_WEST"] call RE;