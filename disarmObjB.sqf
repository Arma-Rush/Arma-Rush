if (!isServer) exitWith {exit};
if (isServer) then {	
	_obj = _this select 1;
	
	if (alive _obj) then {
		_player = _this select 0;
		_terminateDisarm = false;
		_armTime = serverTime + 3;

		"Disarming objective..." remoteExec ["hint",_player,false];
		
		_helipad = "Land_HelipadEmpty_F" createVehicle [0,0,0];
		_helipad attachTo [player, [0,0,0]];
		
		[_helipad,["bombDisarming",30,1]] remoteExec ["say3D",0,false];
		playerBDisarming = _player;
		publicVariable "playerBDisarming";
		objBDisarming = true;
		publicVariable "objBDisarming";
		
		while {((serverTime < _armTime)AND(!_terminateDisarm))} do {
			if (((_player distance _obj)>=5)OR(!(alive _player))) then {
				_terminateDisarm = true;
				deleteVehicle _helipad;
				objBDisarming = false;
				publicVariable "objBDisarming";
			};
			sleep 0.1;
		};

		if (!_terminateDisarm) then {
			if (alive _obj) then {
				"Objective B disarmed" remoteExec ["hint"];
				objBArmed = false;
				publicVariable "objBArmed";
				objBDisarming = false;
				publicVariable "objBDisarming";
			};
		};
		deleteVehicle _helipad;
	};
};