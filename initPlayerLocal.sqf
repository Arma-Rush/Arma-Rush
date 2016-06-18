player enableStamina false;

if ((side player)==WEST) then {
	player addMPEventHandler["mprespawn",{player enableStamina false;}];
	
	[] spawn {
		sleep 3;
		["TaskAssigned",["","Destroy both objectives"]] call bis_fnc_showNotification;
	};
} else {
	player addMPEventHandler ["mpkilled", {[east, 1] call BIS_fnc_respawnTickets;}];
	player addMPEventHandler ["mprespawn", {player enableStamina false;}];
	
	[] spawn {
		sleep 3;
		["TaskAssigned",["","Defend both objectives"]] call bis_fnc_showNotification;
	};
};