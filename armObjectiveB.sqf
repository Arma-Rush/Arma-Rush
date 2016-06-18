objTempB = _this select 0;
["Hello World","hint",true] call BIS_fnc_MP;
if (alive objTempB) then {
	armB = _this select 1;
	_terminatearmB = false;
	removeAllActions objTempB;

	_armTimeB = time + 5;

	hint "Arming objective...";
	while {((time < _armTimeB)AND(!_terminatearmB))} do {
		if ((player distance objTempB)>=5) then {
			_terminatearmB = true;
		};
		sleep 0.1;
	};

	if (!_terminatearmB) then {
		armB = true;
		hint "Objective B armed";
		objTempB addAction [("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmObjectiveB.sqf",[],6,true,true,"","((side player == east)AND((player distance objTempB) < 5))"];
		
		_detTimeB = time + 30;
		_playSoundTime = time + .868;
		objTempB say3D ["bombAlarm",30,1];
		
		while {time <= _detTimeB} do {
			_timeLeft = _detTimeB - time;
			scopeName "countDownLoop";
			if (!armB) then {
				objTempB addAction [("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObjectiveB.sqf",[objTempB,armB],6,true,true,"","((side player == west)AND((player distance objTempB) < 5))"];
				objTempB say3d "";
				breakOut "countDownLoop";
			};
			if ((time >= _playSoundTime)AND (_timeLeft > 10)) then {
				objTempB say3D ["bombAlarm",30,1];
				_playSoundTime = time + .868;
			};
			if ((time >= _playSoundTime) AND (_timeLeft <= 10)) then {
				objTempB say3D ["bombAlarm2",30,1];
				_playSoundTime = time + 3.864;
			};
			sleep 0.1;
		};
		if (armB) then {
			objTempB setDamage 1;
		};
	}
	else {
		objTempB addAction [("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObjectiveB.sqf",[objTempB,armB],6,true,true,"","((side player == west)AND((player distance objTempB) < 5))"];
	};
};