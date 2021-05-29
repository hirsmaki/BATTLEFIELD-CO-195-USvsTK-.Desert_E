_man = _this select 0;

[nil,_man,"loc", rSPAWN,[_man],
{
	private ["_delay","_soundvolume","_ColorCorrections","_DynamicBlur"];
	
	_unit = _this select 0;	

	_state = _unit getVariable "DAP_BLOODFX_STATE";

	if (isNil("_state")) then 
	{
		_unit setVariable ["DAP_BLOODFX_STATE",1,true];

		DAP_FirstAid_KeyCheck = compile preprocessFile "DAPMAN\Scripts\Wounded\BlockKP.sqf";
		_BKP = (findDisplay 46) displayAddEventHandler ["keyDown","_this call DAP_FirstAid_KeyCheck"];

		_soundvolume = soundVolume;
		_radiovolume = radioVolume;


		while {(player getVariable "DAP_Wound"==1 and (alive player) and (_unit == player))} do 
		{
			1 fadeSound 0.025;
			1 fadeRadio 0.25;
			251 cutRsc ["DAP_WOUNDED_BLOODSPLASH","PLAIN",0];
		
			_ColorCorrections = ppEffectCreate ["colorCorrections", 1554];
			_DynamicBlur = ppEffectCreate ["dynamicBlur", 454];
	
			_ColorCorrections ppEffectEnable true;
			_DynamicBlur ppEffectEnable true;
		
			_ColorCorrections ppEffectAdjust [1, 1, 0, [1,0,0,0.25], [1,0,0,1], [1,0,0,1]]; 
			_ColorCorrections ppEffectCommit 0.01;
	
			_DynamicBlur ppEffectAdjust [3];
			_DynamicBlur ppEffectCommit 0.01;
				
			sleep 1;
			PlaySound ["DAP_HEARTBEAT",true];
		};
	
		if (_unit == player) then 
		{
			5 fadeSound _soundvolume;
			5 fadeRadio _radiovolume;
		
			if (alive player) then 
			{
				256 cutText [" ","BLACK OUT",5];
				_delay = (4 + random 1) * acctime;  
				sleep _delay;
			
				ppEffectDestroy _ColorCorrections;
				ppEffectDestroy _DynamicBlur;
			
				256 cutText [" ","BLACK IN",5];
			}
			else
			{
				ppEffectDestroy _ColorCorrections;
				ppEffectDestroy _DynamicBlur;
			};
		}
		else
		{
			0 fadeSound _soundvolume;
			0 fadeRadio _radiovolume;
		
			ppEffectDestroy _ColorCorrections;
			ppEffectDestroy _DynamicBlur;
			
		};
		(findDisplay 46) displayRemoveEventHandler ["keyDown",_BKP];

		_unit setVariable ["DAP_BLOODFX_STATE",nil,true];
	};
}] call RE;