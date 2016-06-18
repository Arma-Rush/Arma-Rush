objTempA = _this select 0;
if (alive objTempA) then {
	armA = _this select 1;
	_terminateArmA = false;
	removeAllActions objTempA;

	_armTimeA = time + 5;

	hint "Arming objective...";
	while {((time < _armTimeA)AND(!_terminateArmA))} do {
		if ((player distance objTempA)>=5) then {
			_terminateArmA = true;
		};
		sleep 0.1;
	};

	if (!_terminateArmA) then {
		armA = true;
		hint "Objective A armed";
		objTempA addAction [("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmObjectiveA.sqf",[],6,true,true,"","((side player == east)AND((player distance objTempA) < 5))"];
		
		_detTimeA = time + 30;
		_playSoundTime = time + .868;
		objTempA say3D ["bombAlarm",30,1];
		
		while {time <= _detTimeA} do {
			_timeLeft = _detTimeA - time;
			scopeName "countDownLoop";
			if (!armA) then {
				objTempA addAction [("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObjectiveA.sqf",[objTempA,armA],6,true,true,"","((side player == west)AND((player distance objTempA) < 5))"];
				objTempA say3d "";
				breakOut "countDownLoop";
			};
			if ((time >= _playSoundTime)AND (_timeLeft > 10)) then {
				objTempA say3D ["bombAlarm",30,1];
				_playSoundTime = time + .868;
			};
			if ((time >= _playSoundTime) AND (_timeLeft <= 10)) then {
				objTempA say3D ["bombAlarm2",30,1];
				_playSoundTime = time + 3.864;
			};
			
			sleep 0.1;
		};
		if (armA) then {
			objTempA setDamage 1;
		};
	}
	else {
		objTempA addAction [("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObjectiveA.sqf",[objTempA,armA],6,true,true,"","((side player == west)AND((player distance objTempA) < 5))"];
	};
};