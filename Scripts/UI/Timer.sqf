_duration = _this select 0;

_counter = _duration;
	
while {((_counter >=0)and(DAP_BF_MISSIONEND==0))} do
{
		
		_h = (floor (_counter / 3600));
		_m = (floor ((_counter / 60) - (_h * 60)));
		_s = (floor (_counter - (_m * 60) - (_h * 3600)));
		
		DAP_BF_TIMER_HOURS = _h;
		PublicVariable "DAP_BF_TIMER_HOURS";
		DAP_BF_TIMER_MINUTES = _m;
		PublicVariable "DAP_BF_TIMER_MINUTES";
		DAP_BF_TIMER_SECONDS = _s;
		PublicVariable "DAP_BF_TIMER_SECONDS";
		
		_counter= _duration-time;
		sleep 1;
};

if (DAP_BF_MISSIONEND==0) then 
{
DAP_BF_MISSIONEND=1;
PublicVariable "DAP_BF_MISSIONEND";
};