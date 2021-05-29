private ["_items","_medicaments","_n","_typesarray","_valuesarray","_value"];

_hospital = _this select 0;

_hospital allowDamage false;

if ((isServer) or (isDedicated)) then 
{
	_items = getWeaponCargo _hospital;
	_medicaments = getMagazineCargo _hospital;
	
	if (((count _items) >0) or ((count _medicaments) >0)) then 
	{
		While {true} do 
		{
			if ((count _items) >0) then 
			{
				_n=0;
				clearWeaponCargoGlobal _hospital;
				
				_typesarray = (_items select 0);
				_valuesarray = (_items select 1);
				
				{
					_value = (_valuesarray select _n);
					_hospital addWeaponCargoGlobal [_x,_value];
					_n=_n+1;
			
				}ForEach _typesarray;
			};
			
			if ((count _medicaments) >0) then 
			{
				_n=0;
				clearMagazineCargoGlobal _hospital;
				
				_typesarray = (_medicaments select 0);
				_valuesarray = (_medicaments select 1);

				{
					_value = (_valuesarray select _n);
					_hospital addMagazineCargoGlobal [_x,_value];
					_n=_n+1;
									
				}ForEach _typesarray;
			};
			
			sleep 600;
		};
	};
};