private ["_leader", "_groupID", "_squad", "_unitsquad"];

_leader =_this select 0;
_groupID = _this select 1;
_squad = units group _leader;

if (!(isNil("_groupID"))) then {(group _leader) setGroupID _groupID;};

_leader setVariable ["DAP_BF_SQUADLEADER",1,true];

if ((isServer) or (isDedicated)) then 
{
	{
		_playable = _x getVariable "DAP_BF_PLAYABLEUNIT";
	
		if (!(isMultiplayer)) then 
		{
		
			if (DAP_BF_CUSTOMLOADOUT==1) then 
			{
				[_x] execVM "Scripts\SP\CustomLoadout.sqf";
			};
		
			if (!(isNil("_groupID"))) then {_x setVariable ["DAP_BF_GROUPID", _groupID, true];};
		
			if (_x == (leader (group _x))) then 
			{
				_unitsquad = [];
				{
				
					if (_x != (leader (group _x))) then {_unitsquad = _unitsquad + [typeOf _x];};
				 
				}ForEach units (group _x);
				_x setVariable ["DAP_BF_SP_SQUAD",_unitsquad, true];
			};	
		
			if (!(isPlayer _x) and (isNil("_playable"))) then
			{
				deleteVehicle _x;
			};
			if ((isPlayer _x) or (!(isNil("_playable")))) then
			{
				
				if (!(_x in switchableUnits)) then {addSwitchableUnit _x;};
					
				_startpos = _x modelToWorld [0,0,0];

				_dir = getDir _x;
			
				_x setVariable ["DAP_BF_PLAYER_RESPAWNPOS",_startpos,true];
				_x setVariable ["DAP_BF_PLAYER_RESPAWNDIR",_dir,true];
				
				[_x] execVM "Scripts\SP\PlayerSlot.sqf";
			};
		};
		
	}ForEach _squad;
};

{deleteVehicle _x;}ForEach switchableUnits;