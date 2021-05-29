private['_handled'];
_handled = false;
_dikCode = (_this select 1);
if (_dikCode in (ActionKeys "moveForward")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "turnLeft")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "turnRight")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "evasiveLeft")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "evasiveRight")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "moveFastForward")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "stand")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "crouch")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "moveUp")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "moveDown")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "Salute")) then
	{
		_handled = true;
	};
if (_dikCode in (ActionKeys "sitDown")) then
	{
		_handled = true;
	};
_handled;

