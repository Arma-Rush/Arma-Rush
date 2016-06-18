if (isServer ) then {
    // The game is over! Bluefor has won!
    end = true;

	_tmp = [east] call BIS_fnc_respawnTickets;
	_tmp = 0 - _tmp;
    [east, _tmp] call BIS_fnc_respawnTickets;
    "" call BIS_fnc_endMission;
};