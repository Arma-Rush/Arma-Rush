//if(!isServer) then {
	_unit = _this select 0;
	_create = _this select 1;
	_trigger = _this select 2;
	
	{
		if (player inArea _x) then {
			_trigger = _x;
		};
	}forEach activeRestrictions;

	private ["_pp1","_pp2"];

	//if (_create) then {
	
		_pp1 = ppEffectCreate["colorCorrections", 10];
		_pp1 ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
		_pp1 ppEffectCommit 1;
		_pp1 ppEffectEnable TRUE;

		_pp2 = ppEffectCreate["filmGrain", 10];
		_pp2 ppEffectAdjust [0.04, 1, 1, 0, 1];
		_pp2 ppEffectCommit 1;
		_pp2 ppEffectEnable TRUE;
	//};

	while {player inArea _trigger;} do { 
		scopeName "loop";
		if (!alive player) then {
			breakOut "loop";
		};
		sleep .5;
	};
	
	ppEffectDestroy [_pp1, _pp2];
	exit;
//};