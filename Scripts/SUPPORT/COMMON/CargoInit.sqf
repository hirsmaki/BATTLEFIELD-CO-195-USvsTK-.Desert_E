_vehicle = _this select 0;

if (((typeOf _vehicle) == "BTR90") or ((typeOf _vehicle) == "BTR90_HQ") or ((typeOf _vehicle) == "BMP3") or (_vehicle isKindOf "BMP2_Base")) then 
{
	if ((isServer)or(isDedicated)) then 
	{
		_vehicle setVariable ["DAP_CARGO_POSITIONS", [], true];
	};

	_vehicle addAction [localize "DAP_CARGO_ACT_GETON", "Scripts\Support\Common\CargoManager.sqf",0,5, false,true,"","vehicle player == player"];
};