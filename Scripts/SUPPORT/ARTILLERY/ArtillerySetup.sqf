if ((isServer)or (isDedicated)) then {
sleep 1;

_eastbattery=DAP_BF_EASTARTILLERY;
_westbattery=DAP_BF_WESTARTILLERY;

_eastcrewtype = DAP_BF_ARTILLERYEASTCREW;
_westcrewtype = DAP_BF_ARTILLERYWESTCREW;


if ((!(isNil("_eastbattery")))and(count(_eastbattery)>0))then
{
{
	_eastartygroup=createGroup createCenter EAST;
	_crew = _eastartygroup createUnit [_eastcrewtype, getPos _x, [], 0, "NONE"];
	_crew setVehicleInit "this allowDamage false;";
	processInitCommands;
	clearVehicleInit _crew;
	_crew setCombatMode "BLUE";
	_crew setDir (getDir _x);
	
	_crew disableAI "MOVE";
	_crew disableAI "TARGET";
	_crew disableAI "AUTOTARGET";
	_crew setCaptive true;
	_crew moveINGunner _x;
	_crew hcsetgroup [group _crew,""];
	_crew doWatch [(getPos _x select 0)+5*sin(getDir _x), (getPos _x select 1)+5*cos(getDir _x),1.25];
			
	_x addEventHandler ["fired", {deleteVehicle (_this select 6);}];
}ForEach DAP_BF_EASTARTILLERY;
};

if ((!(isNil("_westbattery")))and(count(_westbattery)>0))then
{
{
	_westartygroup=createGroup createCenter WEST;
	_crew = _westartygroup createUnit [_westcrewtype, getPos _x, [], 0, "NONE"];
	_crew setVehicleInit "this allowDamage false;";
	processInitCommands;
	clearVehicleInit _crew;
	_crew setCombatMode "BLUE";
	_crew setDir (getDir _x);
	
	_crew disableAI "MOVE";
	_crew disableAI "TARGET";
	_crew disableAI "AUTOTARGET";
	_crew setCaptive true;
	_crew moveINGunner _x;
	_crew hcsetgroup [group _crew,""];
	_crew doWatch [(getPos _x select 0)+5*sin(getDir _x), (getPos _x select 1)+5*cos(getDir _x),1.25];
	
	_x addEventHandler ["fired", {deleteVehicle (_this select 6);}];
}ForEach DAP_BF_WESTARTILLERY;
};

};