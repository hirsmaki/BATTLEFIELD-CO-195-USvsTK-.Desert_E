class DAP_WOUNDED_BLOODSPLASH 
{
	idd = -1;
	movingEnable = 0;
	duration = 0.5;
	fadein = 0;
	fadeout = 6;
	name = "DAPMAN BLOOD SPLASH";
	controls[] = {"DAPMAN_BLOODSPLASH"};

	class DAPMAN_BLOODSPLASH
	{
		idc=-1;
		type=0;
		style = 48;
		text = "DAPMAN\Textures\Blood.paa";
		colorBackground[] = { 1, 1, 1, 1 };
		colorText[] = { 1, 1, 1, 1 };
		font = Bitstream;
		sizeEx = 0.05;
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;  
	};
};
class DAP_WOUNDED_HITSPLASH 
{
	idd = -1;
	movingEnable = 0;
	duration = 0.5;
	fadein = 0;
	fadeout = 2.5;
	name = "DAPMAN HIT SPLASH";
	controls[] = {"DAPMAN_HITSPLASH"};

	class DAPMAN_HITSPLASH
	{
		Idc=-1;
		type=0;
		style = 48;
		text = "DAPMAN\Textures\Blood.paa";
		colorBackground[] = { 1, 1, 1, 1 };
		colorText[] = { 1, 1, 1, 1 };
		font = Bitstream;
		sizeEx = 0.05;
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;  
	};
};