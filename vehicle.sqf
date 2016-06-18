//while {true} do {_var = (vehicle player); hint format["%1",_var]; sleep 1;};

if (isServer) then {
	natoVehicleActual = [natoQuad1Actual,natoQuad2Actual,natoTransportActual,natoMrapActual,natoLavActual,natoTankActual];
	
	
	{
		_x removeMPEventHandler ["mpkilled",0];
		_x addMPEventHandler ["mpkilled", {[_this] spawn{
															if (isServer) then {
															
																_veh = _this select 0 select 0;
																
																if (objACurr == obj1) then {
																	if (_veh == natoMrapActual) then {
																		hint "HELLO";
																		sleep 10.2;
																		natoMrapActual setPos (getPos natoMrap1);
																		natoMrapActual setDir (getDir natoMrap1);
																	}; 
																};
															};
														};
													}];
	} forEach natoVehicleActual;
};