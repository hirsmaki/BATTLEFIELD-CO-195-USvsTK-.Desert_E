private ["_duration","_counter"];

if (local player) then 
{
	_duration = _this select 0;

	_fixnumber =
	{
		if (_this < 10) then
		{
			format["0%1", _this];
		}
		else
		{
			str _this;
		};
	};

	while {true} do
	{
		
		_h = DAP_BF_TIMER_HOURS;
		_m = DAP_BF_TIMER_MINUTES;
		_s = DAP_BF_TIMER_SECONDS;

		if (DAP_BF_MAPSTATE==1) then 
		{
			((HUDDisplay select 0) displayCtrl 51007) ctrlSetText format["%1:%2:%3", _h call _fixnumber, _m call _fixnumber, _s call _fixnumber];
		};
		sleep 1;
	};
};