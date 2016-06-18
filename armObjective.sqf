objTempA = _this select 0;
armA = _this select 1;
_terminateArmA = false;
removeAllActions objTempA;

armTimeA = time + 5;

while {((time < armTimeA)AND(!_terminateArmA))} do {
	hint format["%1",time];
	if ((player distance objTempA)>=5) then {
		_terminateArmA = true;
	};
};

if (!_terminateArmA) then {
	armA = true;
	playSound "AlarmCar";
	objTempA addAction [("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmObjectiveA.sqf",[objTempA,armA],6,true,true,"","((side player == west)AND((player distance objTempA) < 5))"];
	detTimeA = time + 60;
	
	while {time <= detTimeA} do {
		scopeName "countDownLoop";
		if (!armA) then {
			objTempA addAction [("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObjectiveA.sqf",[objTempA,armA],6,true,true,"","((side player == west)AND((player distance objTempA) < 5))"];
			breakOut "countDownLoop";
		};
	};
	if (armA) then {
		objTempA setDamage 1;
	};
}
else {
	objTempA addAction [("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObjectiveA.sqf",[objTempA,armA],6,true,true,"","((side player == west)AND((player distance objTempA) < 5))"];
};