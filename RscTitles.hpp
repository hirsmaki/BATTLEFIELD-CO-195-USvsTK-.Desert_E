class DAP_BF_UI 
{
	idd=51000;
  	movingEnable=0;
  	duration=900000;
  	fadein=1;
  	name="SCORES";
	OnLoad = "HUDDisplay = _this";
	controlsBackground[] = {};
  	controls[] = {"WESTSCORENAME", "EASTSCORENAME", "WESTSCOREVALUE", "EASTSCOREVALUE","TimeCounterLabel", "TimeCounterValue"};
	
	class WESTSCORENAME: HUDTEXT
	{
		idc = 51001;
		text = "US";
		x = safezoneX+0.50;
		y = safezoneY+0.033;
		w = 0.102941;
		h = 0.045621;
	};
	class EASTSCORENAME: HUDTEXT
	{
		idc = 51002;
		text = "TK";
		x = safezoneX+0.50;
		y = safezoneY+0.065;
		w = 0.102941;
		h = 0.045621;
	};
	class WESTSCOREVALUE: HUDTEXT
	{
		idc = 51003;
		text = "0";
		x = safezoneX+0.56;
		y = safezoneY+0.033;
		w = 0.102941;
		h = 0.045621;
	};
	class EASTSCOREVALUE: HUDTEXT
	{
		idc = 51004;
		text = "0";
		x = safezoneX+0.56;
		y = safezoneY+0.065;
		w = 0.102941;
		h = 0.045621;
	};
	class TimeCounterLabel: HUDTEXT
	{
		idc = 51006;
		text = "$STR_DAP_TIMER_CAPTION_NAME";
		x = safezoneX+0.028;
		y = safezoneY+0.065;
		h = 0.045621;

	};
	class TimeCounterValue: HUDTEXT
	{
		idc = 51007;
		text = "";
		x = safezoneX+0.30;
		y = safezoneY+0.065;
		h = 0.045621;
	};
};