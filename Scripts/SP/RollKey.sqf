private['_handled'];
_handled = false;
_dikCode = (_this select 1);
if ((_dikCode in (ActionKeys "ForceCommandingMode"))or(_dikCode in (ActionKeys "TacticalView"))) then
	{
		[player] execVM "Scripts\SP\EVM.sqf";
		_handled = true;
	};
_handled;

