_unit = _this select 0;

if (local _unit) then 
{
	if ((_unit isKindOf "RUS_SOLDIER_BASE")or(_unit isKindOf "RU_SOLDIER_SNIPER")or(_unit isKindOf "TK_Special_Forces_EP1")or(_unit isKindOF "TK_Soldier_Sniper_EP1")or(_unit isKindOF "TK_Soldier_Spotter_EP1")or(_unit isKindOF "USMC_SoldierS_Sniper")or(_unit isKindOF "USMC_SoldierS_Spotter")or(_unit isKindOF "US_Soldier_Sniper_EP1")or(_unit isKindOF "US_Soldier_Spotter_EP1")or(_unit isKindOF "BAF_Soldier_Sniper_MTP")or(_unit isKindOF "BAF_Soldier_spotter_MTP")) then 
	{
		_maincondition = "((((damage (_this))>0)and((damage (_this))<0.5))or(((damage (cursortarget))>0)and((damage (cursortarget))<0.5)and(cursortarget isKindOf 'CAManBase')and(cursortarget distance _this <=2)and(alive cursortarget)))";
		_unit addAction [localize "STR_ACT_BANDAGE", "Scripts\Support\Common\Bandage.sqf", [0],0,false,true,"",format ["((alive _this)and(_this==player)and(%1))",_maincondition]];	
	};
};