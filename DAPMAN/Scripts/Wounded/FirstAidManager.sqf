_unit = _this select 0;
_healer = _this select 1;
_healermedic = _this select 2;

private ["_dragstate","_carriedstate","_targetobject"];

if (((damage _healer) <0.5)and(canStand _healer))then 
{
	if (alive _healer) then 
	{
		
		_dragstate =str(_unit GetVariable "BIS_BC_dragged");
		_carriedstate = str(_unit GetVariable "BIS_BC_carried");

		if (isNil("_dragstate")) then {_dragstate = "false";};
		if (isNil("_carriedstate")) then {_carriedstate = "false";};

		if ((_dragstate == "false") and (_carriedstate== "false")) then 
		{
			if (isPlayer _healer) then 
			{
				[nil, _unit, rSPAWN, [_unit,_healer],
				{		
					if ((isServer)or(isDedicated)) then 
					{
						_man = _this select 0;
						_medic = _this select 1;
						[_man,_medic] exec "DAPMAN\Scripts\Wounded\FirstAid.sqs";
					};
	
				}] call RE;
			} 
			else 
			{
				[nil, _unit, rSPAWN, [_unit,_healer],
				{		
					if ((isServer)or(isDedicated)) then 
					{
						_man = _this select 0;
						_medic = _this select 1;
						[_man,_medic] exec "DAPMAN\Scripts\Wounded\FirstAidAI.sqs";
					};
	
				}] call RE;
			};

		}
		else
		{
			
			if (!(isPlayer _healer)) then 
			{
				_targetobject = _healer getVariable "BIS_BC_injured";
				if ((_healermedic) and (_healer==player)) then {_healer playActionNow "released";};
				if (isNil("_targetobject") and (!(_healermedic))) then 
				{
					if (_healer != leader group _healer) then 
					{
						doStop _healer;
						[_healer] JoinSilent (group _healer);
					};
				
					AISFinishHeal [_unit,_healer,true,true];
			
					_unit setVariable ["DAP_FORCEFINDHEALER",1,true];
					_unit setVariable ["DAP_DRAG_RANGE",5,true];
				};
			};
		};

	};
}
else
{
	if (_healer != leader group _healer) then 
	{
		doStop _healer;
		[_healer] JoinSilent (group _healer);
	};
	
	AISFinishHeal [_unit,_healer,true,true];
	_unit setVariable ["DAP_FORCEFINDHEALER",1,true];
	_unit setVariable ["DAP_DRAG_RANGE",5,true];
};