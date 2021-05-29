_unit = _this select 0;

if ((local _unit)and((vehicle _unit) == _unit)and(alive _unit)) then 
{
	if ((currentWeapon _unit) == (primaryWeapon _unit)) then 
	{

		if (((animationState _unit) == "AmovPercMrunSlowWrflDf") or ((animationState _unit) == "AmovPercMrunSrasWrflDf") or ((animationState _unit) =="AmovPercMevaSlowWrflDf") or((animationState _unit) =="AmovPercMevaSrasWrflDf")) then 
		{
			[nil, _unit, rSWITCHMOVE, "ActsPercMrunSlowWrflDf_FlipFlopPara"]call RE;
		};
	};
};


