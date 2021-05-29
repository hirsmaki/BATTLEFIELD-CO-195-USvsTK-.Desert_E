_man = _this select 0;

[nil,_man,"loc", rSPAWN,[_man],
{
	_unit = _this select 0;
	
	private ["_delay","_soundvolume"];

	250 cutRsc ["DAP_WOUNDED_HITSPLASH","PLAIN",0];

	_ColorCorrections = ppEffectCreate ["colorCorrections", 1555];
	_DynamicBlur = ppEffectCreate ["dynamicBlur", 455];
	
	_ColorCorrections ppEffectAdjust [1, 1, 0, [1,0,0,0.25], [1,0,0,1], [1,0,0,1]]; 
	_ColorCorrections ppEffectCommit 0.01;
	
	_DynamicBlur ppEffectAdjust [3];
	_DynamicBlur ppEffectCommit 0.01;
	_DynamicBlur ppEffectEnable true;
	sleep 0.5;
	_DynamicBlur ppEffectAdjust [0];
	_DynamicBlur ppEffectCommit 1.5;
	_DynamicBlur ppEffectEnable true;
	sleep 1.5;

	ppEffectDestroy _ColorCorrections;
	ppEffectDestroy _DynamicBlur;
	
}] call RE;



