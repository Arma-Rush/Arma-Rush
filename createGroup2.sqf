if (isServer ) then {
	
	// Process Group 2 (Airbase mike)
	_natoBase1Vehicles = [natoQuad1_1,natoQuad1_2,natoTransport1,natoMrap1,natoLav1,natoTank1];
	_csatBase1Vehicles = [csatQuad1_1,csatQuad1_2,csatTransport1,csatMrap1,csatLav1,csatTank1];
	
	_tmp = [west] call BIS_fnc_respawnTickets;
	_tmp = numBlueforTickets - _tmp;
	[west, _tmp] call BIS_fnc_respawnTickets;
	
	[east, -1] call BIS_fnc_respawnTickets;
	
	"csatOrient1" remoteExec ["deleteMarker",0,true];
	["csatOrient2",1] remoteExec ["setMarkerAlpha",0,true];
					
	// place csat hq at radio antenne
	["respawn_east",[5217.33,4986.36]] remoteExec ["setMarkerPos",0,true];
	//respawn_east setDir 150;
					
	//uiSleep 30;
	
	["TaskAssigned",["","Defend both objectives"]] remoteExec ["bis_fnc_showNotification",defenders,false];
	["TaskAssigned",["","Destroy both objectives"]] remoteExec ["bis_fnc_showNotification",attackers,false];
	
	objACurr = obj3;
	objBCurr = obj4;

	publicVariable "objACurr";
	publicVariable "objBCurr";
	
	"create3D.sqf" remoteExec ["execVM",0,true];
					
	"natoOrient1" remoteExec ["deleteMarker",0,true];
	"csatRestMk1" remoteExec ["deleteMarker",0,true];
	"natoRestMk1" remoteExec ["deleteMarker",0,true];
	
	["natoOrient2",1] remoteExec ["setMarkerAlpha",0,true];
	
	createMarker ["csatRestMk2",(getPos csatRestriction2)];
		"csatRestMk2" setMarkerShape "RECTANGLE";
		"csatRestMk2" setMarkerSize [14000,2000];
		"csatRestMk2" setMarkerColor "ColorRed";
		"csatRestMk2" setMarkerBrush "BDiagonal";
		"csatRestMk2" setMarkerDir 45;
		["csatRestMk2",0] remoteExec ["setMarkerAlphaLocal",west,true];
	
	createMarker ["natoRestMk2",(getPos natoRestriction2)];
		"natoRestMk2" setMarkerShape "RECTANGLE";
		"natoRestMk2" setMarkerSize [14000,2000];
		"natoRestMk2" setMarkerColor "ColorRed";
		"natoRestMk2" setMarkerBrush "BDiagonal";
		"natoRestMk2" setMarkerDir 45;
		["natoRestMk2",0] remoteExec ["setMarkerAlphaLocal",east,true];
	
	["csatRestMk2",1] remoteExec ["setMarkerAlpha",east,true];
	["natoRestMk2",1] remoteExec ["setMarkerAlpha",west,true];
								
	// place nato hq at camp maxwell
	["respawn_west", [3292.78,2921.84]] remoteExec ["setMarkerPos",0,true];
	//respawn_west setDir 150;
					
	_mkobj3 = createMarker ["mk2-1", (getPos obj3)];
		_mkobj3 setMarkerShape "ICON";
		_mkobj3 setMarkerType "hd_destroy";
		_mkobj3 setMarkerText "A";
						
	_mkobj4 = createMarker ["mk2-2", (getPos obj4)];
		_mkobj4 setMarkerShape "ICON";
		_mkobj4 setMarkerType "hd_destroy";
		_mkobj4 setMarkerText "B";
		
	activeRestrictions = [natoRestriction2, csatRestriction2, allRestriction1];
	publicVariable "activeRestrictions";
		
	// begins nato forEach loop
	{	
		if ((count (crew _x))==0) then {
			deleteVehicle _x;
			
			if (_x == natoQuad1_1) then {
				[natoQuad2_1,false] remoteExec ["hideObject",0,true];
			};
			if (_x == natoQuad1_2) then {
				[natoQuad2_2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == natoTransport1) then {
				[natoTransport2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == natoMrap1) then {
				[natoMrap2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == natoLav1) then {
				[natoLav2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == natoTank1) then {
				[natoTank2,false] remoteExec ["hideObject",0,true];
			};
		}
		else {
			_x addMPEventHandler ["mpkilled", {[_this] spawn{		
																if (isServer) then {
																	_veh = _this select 0 select 0;
									
																	if (_veh == natoQuad1_1) then {
																		uiSleep 59;
																		deleteVehicle natoQuad1_1;
																		[natoQuad2_1,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == natoQuad1_2) then {
																		uiSleep 59;
																		deleteVehicle natoQuad1_2;
																		[natoQuad2_2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == natoTransport1) then {
																		uiSleep 59;
																		deleteVehicle natoTransport1;
																		[natoTransport2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == natoMrap1) then {
																		uiSleep 119;
																		deleteVehicle natoMrap1;
																		[natoMrap2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == natoLav1) then {
																		uiSleep 119;
																		deleteVehicle natoLav1;
																		[natoLav2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == natoTank1) then {
																		uiSleep 119;
																		deleteVehicle natoTank1;
																		[natoTank2,false] remoteExec ["hideObject",0,true];
																	};
																};
															};
													}];
		};
	} forEAch _natoBase1Vehicles;
	
	// begins csat forEach loop
	{	
		if ((count (crew _x))==0) then {
		
			deleteVehicle _x;
			
			if (_x == csatQuad1_1) then {
				[csatQuad2_1,false] remoteExec ["hideObject",0,true];
			};
			if (_x == csatQuad1_2) then {
				[csatQuad2_2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == csatTransport1) then {
				[csatTransport2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == csatMrap1) then {
				[csatMrap2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == csatLav1) then {
				[csatLav2,false] remoteExec ["hideObject",0,true];
			};
			if (_x == csatTank1) then {
				[csatTank2,false] remoteExec ["hideObject",0,true];
			};
		}
		else {
			_x addMPEventHandler ["mpkilled", {[_this] spawn{	
																if (isServer) then {
																	_veh = _this select 0 select 0;
																
																	if (_veh == csatQuad1_1) then {
																		uiSleep 59;
																		deleteVehicle csatQuad1_1;
																		[csatQuad2_1,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == csatQuad1_2) then {
																		uiSleep 59;
																		deleteVehicle csatQuad1_2;
																		[csatQuad2_2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == csatTransport1) then {
																		uiSleep 59;
																		deleteVehicle csatTransport1;
																		[csatTransport2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == csatMrap1) then {
																		uiSleep 119;
																		deleteVehicle csatMrap1;
																		[csatMrap2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == csatLav1) then {
																		uiSleep 119;
																		deleteVehicle csatLav1;
																		[csatLav2,false] remoteExec ["hideObject",0,true];
																	};
																	if (_veh == csatTank1) then {
																		uiSleep 119;
																		deleteVehicle csatTank1;
																		[csatTank2,false] remoteExec ["hideObject",0,true];
																	};
																};
															};
													}];
		};
	} forEAch _csatBase1Vehicles;
};