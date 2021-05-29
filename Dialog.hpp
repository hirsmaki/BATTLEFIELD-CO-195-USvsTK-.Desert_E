class DAP_BF_OPTIONS 
{
  	idd=51010;
  	movingEnable=1;
  	duration=900000;
  	fadein=1;
  	name="OPTIONS";
	OnLoad = "OptionsDisplay = _this";
	controlsBackground[] = {"DAP_BF_VO_BG","DAP_BF_VO_BG_TITTLE"};
  	controls[] = {"DAP_BF_VO_BG_TITTLETEXT", "DAP_BF_VO_CLOSE", "DAP_BF_VO_VDLABEL", "DAP_BF_VO_VDVALUE","DAP_BF_VO_TQLABEL","DAP_BF_VO_VIEWDISTANCESLIDER","DAP_BF_VO_TERRAINQUALITYCOMBOBOX"};

class DAP_BF_VO_BG: DAP_OPTIONS_UI_PICTURE
{
	idc = 51011;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.565625 * safezoneW + safezoneX;
	y = 0.204623 * safezoneH + safezoneY;
	w = 0.2625 * safezoneW;
	h = 0.590754 * safezoneH;
	colorText[] = {-1,-1,-1,0.5};
};
class DAP_BF_VO_BG_TITTLE: DAP_OPTIONS_UI_PICTURE
{
	idc = 51012;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.565625 * safezoneW + safezoneX;
	y = 0.204623 * safezoneH + safezoneY;
	w = 0.2625 * safezoneW;
	h = 0.0656393 * safezoneH;
	colorText[] = {0.2,0.2,0.1,0.5};
};
class DAP_BF_VO_BG_TITTLETEXT: DAP_OPTIONS_UI_TEXT
{
	idc = 51013;
	text = "$STR_DAP_BF_OPTIONS";
	x = 0.575 * safezoneW + safezoneX;
	y = 0.214937 * safezoneH + safezoneY;
	w = 0.0875 * safezoneW;
	h = 0.0492295 * safezoneH;
};
class DAP_BF_VO_CLOSE: DAP_OPTIONS_UI_BUTTON
{
	idc = 51014;
	style=0x02;
	text = "$STR_DAP_BF_OPTIONS_CLOSE";
	x = 0.58375 * safezoneW + safezoneX;
	y = 0.733328 * safezoneH + safezoneY;
	w = 0.218437 * safezoneW;
	h = 0.03 * safezoneH;
	action="CloseDialog 0;";
};
class DAP_BF_VO_VDLABEL: DAP_OPTIONS_UI_TEXT
{
	idc = 51015;
	text = "$STR_DAP_BF_OPTIONS_VDLABEL";
	x = 0.576563 * safezoneW + safezoneX;
	y = 0.303082 * safezoneH + safezoneY;
	w = 0.142187 * safezoneW;
	h = 0.0328197 * safezoneH;
};
class DAP_BF_VO_VDVALUE: DAP_OPTIONS_UI_TEXT
{
	idc = 51016;
	text = "0";
	x = 0.75000 * safezoneW + safezoneX;
	y = 0.303082 * safezoneH + safezoneY;
	w = 0.0984375 * safezoneW;
	h = 0.0328197 * safezoneH;
};
class DAP_BF_VO_TQLABEL: DAP_OPTIONS_UI_TEXT
{
	idc = 51017;
	text = "$STR_DAP_BF_OPTIONS_TQLABEL";
	x = 0.576563 * safezoneW + safezoneX;
	y = 0.401541 * safezoneH + safezoneY;
	w = 0.240625 * safezoneW;
	h = 0.0328197 * safezoneH;
};
class DAP_BF_VO_VIEWDISTANCESLIDER: DAP_OPTIONS_UI_SLIDER
{
	idc = 51018;
	type = 43;
	style = "0x400 + 0x10";
	x = 0.58375 * safezoneW + safezoneX;
	y = 0.352312 * safezoneH + safezoneY;
	w = 0.218437 * safezoneW;
	h = 0.026412 * safezoneH;
	default = false;
	color[] = {1, 1, 1, 0.5};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.2};
	arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
	border = "\ca\ui\data\ui_border_frame_ca.paa";
	thumb = "\ca\ui\data\ui_slider_bar_ca.paa";
	colorBackground[] = {-1,-1,-1,0.25};
	colorBackgroundActive[] = {-1,-1,-1,0.25};
};
class DAP_BF_VO_TERRAINQUALITYCOMBOBOX: DAP_OPTIONS_UI_COMBO
{
	idc = 51019;
	x = 0.58375 * safezoneW + safezoneX;
	y = 0.454105 * safezoneH + safezoneY;
	w = 0.218437 * safezoneW;
	h = 0.026412 * safezoneH;
	colorBackground[] = {-1,-1,-1,0.5};
	colorBackgroundActive[] = {-1,-1,-1,0.25};
	color[] = {1,1,1,1};
	colorText[] = {1,1,1,0.75};
	colorSelect[] = {1,1,1,1};
	colorSelectBackground[] = {0.05,0.05,0.05,0.75};
};

};





