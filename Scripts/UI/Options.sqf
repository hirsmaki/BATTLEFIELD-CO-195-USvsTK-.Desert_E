private ["_ViewDistance","_SelectedGrid"];

_ViewDistance = ViewDistance;
_dialog = createDialog "DAP_BF_OPTIONS";

ctrlSetText [51016,str(_ViewDistance)];

sliderSetRange [51018, 500, 10000];
sliderSetPosition [51018, _ViewDistance];

lbClear 51019;

lbAdd [51019,localize "STR_DAP_BF_OPTIONS_TQ_VLOW"];
lbAdd [51019,localize "STR_DAP_BF_OPTIONS_TQ_LOW"];
lbAdd [51019,localize "STR_DAP_BF_OPTIONS_TQ_MED"];
lbAdd [51019,localize "STR_DAP_BF_OPTIONS_TQ_HIGH"];
lbAdd [51019,localize "STR_DAP_BF_OPTIONS_TQ_VHIGH"];

While {dialog} do 
{
	_ViewDistance = sliderPosition 51018;
	_SelectedGrid =lbCurSel 51019;

	SetViewDistance _ViewDistance;
	ctrlSetText [51016,str(floor(_ViewDistance))];
	sleep 1;
};
	SetViewDistance _ViewDistance;
	switch (_SelectedGrid) do 
	{
	case 0: {setTerrainGrid 50;};
	case 1: {setTerrainGrid 25};
	case 2: {setTerrainGrid 12.5};
	case 3: {setTerrainGrid 6.25};
	case 4: {setTerrainGrid 3.125};
	};