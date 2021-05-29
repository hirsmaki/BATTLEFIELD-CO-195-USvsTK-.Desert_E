_unit = _this select 1;

if (damage _unit >0) then 
{
	_unit setHit ["hands",0];
	_unit setHit ["legs",0];
	_unit setdamage 0;
	_unit playMoveNow "AinvPknlMstpSlayWrflDnon_medic";
};