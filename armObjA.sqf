if (!isServer) exitWith {exit};
if (isServer) then {
	
	_obj = _this select 1;
	_objCharge = _this select 2;
	
	if (alive _obj) then {
		_player = _this select 0;
		_terminateArmed = false;
		_armTime = serverTime + 3;
		
		"Arming objective..." remoteExec ["hint",_player,false];
		
		_helipad = "Land_HelipadEmpty_F" createVehicle [0,0,0];
		_helipad attachTo [_player, [0,0,0]];
		
		[_helipad,["bombArming",30,1]] remoteExec ["say3D",0,false];	
		
		// determine if player left the objective before they could arm it
		while {((serverTime < _armTime)AND(!_terminateArmed))} do {
			if ((_player distance _obj)>=5) then {
				_terminateArmed = true;
				deleteVehicle _helipad;
			};
			sleep 0.1;
		};
		
		deleteVehicle _helipad;
		
		// begin bomb detonation countdown
		if ((!_terminateArmed)AND(!objAArmed)AND(alive _player)) then {
			objAArmed = true;
			publicVariable "objAArmed";
			"Objective A armed" remoteExec ["hint",0,false];
			
			_helipad = "Land_HelipadEmpty_F" createVehicle [0,0,0];
			_helipad attachTo [_objCharge, [0,0,0]];
			_objCharge hideObjectGlobal false;
			
			_detTime = serverTime + 30;
			
			[_helipad,["bombAlarm",30,1]] remoteExec ["say3D",0,false];
			
			while {serverTime <= _detTime} do {
				scopeName "countDownLoop";
				if (!objAArmed) then {
					deleteVehicle _helipad;
					_objCharge hideObjectGlobal true;
					breakOut "countDownLoop";
				};
				sleep 0.1;
			};
			if (objAArmed) then {
				_obj enableSimulationGlobal true;
				_obj setDamage 1;
				"Bo_GBU12_LGB" createVehicle getPos _objCharge;
				deleteVehicle _helipad;
			};
			deleteVehicle _helipad;
			_objCharge hideObjectGlobal true;
		};
	};
};