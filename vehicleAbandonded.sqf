	// script to determine when to respawn a vehicle after it is abandonded
	// Runs locally on each client when they climb into a vehicle

_findClosestPlayer = {

	_veh = _this;
	_currDistance = 0;
	_closestDistance = 10000000000000;
		
	{
		_currDistance = _x distance _veh;
			
		if (_currDistance < _closestDistance) then {
			_closestDistance = _currDistance;
		};
		
	} forEach allPlayers;
	
	_closestDistance;
};
	
	_veh = _this select 0 select 2;
	_player = _this select 0 select 0;
	_timeOut = 10;
	_playerDistanceToVeh = 100;
	
	// Continue script if player exits vehicle or they are killed
	waitUntil{(((vehicle _player) == _player) OR (!alive _player))};
	
	
	
	if ({alive _x} count crew _veh == 0) then { // exit script if there are still living players in the vehicle
		
		_waitTime = serverTime + _timeOut;
		
		while {(((_waitTime >=  serverTime) OR ((_veh call _findClosestPlayer) <= _playerDistanceToVeh))AND(alive _player))} do {
			hint format["%1",(_veh call _findClosestPlayer)];
			if (({alive _x} count crew _veh > 0) OR (!alive _veh)) exitWith {};
			
			sleep .3;
		};
		
		waitUntil{((_waitTime <=  serverTime)AND((_veh call _findClosestPlayer) > _playerDistanceToVeh))};
		
		if (({alive _x} count crew _veh == 0) AND (alive _veh)) then {
			_veh setPos [0,0,0];
			forceRespawn _veh;
		};
	};