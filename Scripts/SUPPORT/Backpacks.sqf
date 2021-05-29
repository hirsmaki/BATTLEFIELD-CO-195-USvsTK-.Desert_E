_heap = _this select 0;
_side = _this select 1;

if (_side==0) then 
{
	_heap addAction [localize "STR_TAKE_ALICE", "Scripts\Support\BP.sqf", ["TK_ALICE_Pack_EP1"]];
	_heap addAction [localize "STR_TAKE_ASSAULT", "Scripts\Support\BP.sqf", ["TK_Assault_Pack_EP1"]];
	_heap addAction [localize "STR_TAKE_PATROL", "Scripts\Support\BP.sqf", ["US_Patrol_Pack_EP1"]];
	_heap addAction [localize "STR_TAKE_CZBP", "Scripts\Support\BP.sqf", ["CZ_Backpack_EP1"]];

	_heap addAction [localize "STR_TAKE_RPG", "Scripts\Support\BP.sqf", ["TK_RPG_Backpack_EP1"]];

	_heap addAction [localize "STR_REMOVE_BACKPACK", "Scripts\Support\BP.sqf", [""]];
};

if (_side==1) then 
{
	_heap addAction [localize "STR_TAKE_ACU", "Scripts\Support\BP.sqf", ["US_Assault_Pack_EP1"]];
	_heap addAction [localize "STR_TAKE_COYOTE", "Scripts\Support\BP.sqf", ["US_Backpack_EP1"]];
	_heap addAction [localize "STR_TAKE_PATROL", "Scripts\Support\BP.sqf", ["US_Patrol_Pack_EP1"]];
	_heap addAction [localize "STR_TAKE_CZBP", "Scripts\Support\BP.sqf", ["CZ_Backpack_EP1"]];

	_heap addAction [localize "STR_TAKE_UAV", "Scripts\Support\BP.sqf", ["US_UAV_Pack_EP1"]];
		
	_heap addAction [localize "STR_REMOVE_BACKPACK", "Scripts\Support\BP.sqf", [""]];
};
