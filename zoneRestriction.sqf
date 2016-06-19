// this script runs locally on each client checking if they are out of bounds.
_side = format["%1",(side player)];

while {true} do {
	{
		_triggerActivation = triggerActivation _x;
		_triggerActivation = _triggerActivation select 0;
		
		if(_triggerActivation == "ANY") then {
			_triggerActivation = _side;
		};
		
		if ((player inArea _x)AND(_triggerActivation == _side)) then {
		
			hint  format["RETURN TO THE BATTLEFIELD!"];
			
			[player,true,_x] execVM "blackandwhite.sqf";  
			
			_killTime = serverTime + 10;
			
			while {(player inArea _x)} do {
				scopeName "killLoop";
				
				if (serverTime >= _killTime) then {
					player setDamage 1;
				};
				
				if (!(player inArea _x)) then {
					breakOut "killLoop";
				};
				sleep .5;
			};
		};
	} forEach activeRestrictions;

	sleep .5;
};