findClosestPlayer = {
	_currDistance = 0;
	_closestDistance = 10000000000000;
	_closestPlayer = nil;
		
	{
		_currDistance = (_x distance natoMrap1);
			
		if (_currDistance < _closestDistance) then {
			_closestDistance = _currDistance;
			_closestPlayer = _x;
		};
		hint format["%1",_closestDistance];
	} forEach allPlayers;
};