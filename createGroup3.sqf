if (isServer ) then {

	// Process Group 3 (radio tower)
	_natoBase2Vehicles = [natoQuad1_1,natoQuad1_2,natoTransport1,natoMrap1,natoLav1,natoTank1,natoQuad2_1,natoQuad2_2,natoTransport2,natoMrap2,natoLav2,natoTank2];
	_csatBase2Vehicles = [csatQuad1_1,csatQuad1_2,csatTransport1,csatMrap1,csatLav1,csatTank1,csatQuad2_1,csatQuad2_2,csatTransport2,csatMrap2,csatLav2,csatTank2];
	
	_tmp = [west] call BIS_fnc_respawnTickets;
	_tmp = numBlueforTickets - _tmp;
	[west, _tmp] call BIS_fnc_respawnTickets;
	
	[east, -1] call BIS_fnc_respawnTickets;
	
	"csatOrient2" remoteExec ["deleteMarker",0,true];
	["csatOrient3",1] remoteExec ["setMarkerAlpha",0,true];
	
	// place csat spawn at kamino
	["respawn_east",[6486.38,5391.02]] remoteExec ["setMarkerPos",0,true];
	//respawn_east setDir 170;

	//uiSleep 30;
	
	["TaskAssigned",["","Defend both objectives"]] remoteExec ["bis_fnc_showNotification",defenders,false];
	["TaskAssigned",["","Destroy both objectives"]] remoteExec ["bis_fnc_showNotification",attackers,false];
	
	objACurr = obj5;
	objBCurr = obj6;

	publicVariable "objACurr";
	publicVariable "objBCurr";
	
	"create3D.sqf" remoteExec ["execVM",0,true];
	
	"natoOrient2" remoteExec ["deleteMarker",0,true];
	"csatRestMk2" remoteExec ["deleteMarker",0,true];
	"natoRestMk2" remoteExec ["deleteMarker",0,true];
	
	["natoOrient3",1] remoteExec ["setMarkerAlpha",0,true];
	
	createMarker ["csatRestMk3",(getPos csatRestriction3)];
		"csatRestMk3" setMarkerShape "RECTANGLE";
		"csatRestMk3" setMarkerSize [14000,2000];
		"csatRestMk3" setMarkerColor "ColorRed";
		"csatRestMk3" setMarkerBrush "BDiagonal";
		"csatRestMk3" setMarkerDir 45;
		["csatRestMk3",0] remoteExec ["setMarkerAlphaLocal",west,true];
	
	createMarker ["natoRestMk3",(getPos natoRestriction3)];
		"natoRestMk3" setMarkerShape "RECTANGLE";
		"natoRestMk3" setMarkerSize [14000,2000];
		"natoRestMk3" setMarkerColor "ColorRed";
		"natoRestMk3" setMarkerBrush "BDiagonal";
		"natoRestMk3" setMarkerDir 45;
		["natoRestMk3",0] remoteExec ["setMarkerAlphaLocal",east,true];
	
	["csatRestMk3",1] remoteExec ["setMarkerAlpha",east,true];
	["natoRestMk3",1] remoteExec ["setMarkerAlpha",west,true];
	
	// place nato spawn at airstation mike-26
	["respawn_west", [4369.605,3801.048]] remoteExec ["setMarkerPos",0,true];
	//respawn_west setDir 220;
					
	_mkobj5 = createMarker ["mk3-1", (getPos obj5)];
		_mkobj5 setMarkerShape "ICON";
		_mkobj5 setMarkerType "hd_destroy";
		_mkobj5 setMarkerText "A";
					
	_mkobj6 = createMarker ["mk3-2", (getPos obj6)];
		_mkobj6 setMarkerShape "ICON";
		_mkobj6 setMarkerType "hd_destroy";
		_mkobj6 setMarkerText "B";
		
	activeRestrictions = [natoRestriction3, csatRestriction3, allRestriction1];
	publicVariable "activeRestrictions";
		
	// begins nato forEach loop
	{	
		if ((count (crew _x))==0) then {
			deleteVehicle _x;
			
			if ((_x == natoQuad2_1) and (count (crew natoQuad1_1))==0) then {
				[natoQuad3_1,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoQuad2_2) and (count (crew natoQuad1_2))==0) then {
				[natoQuad3_2,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoTransport2) and (count (crew natoTransport1))==0) then {
				[natoTransport3,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoMrap2) and (count (crew natoMrap1))==0) then {
				[natoMrap3,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoLav2) and (count (crew natoLav1))==0) then {
				[natoLav3,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoTank2) and (count (crew natoTank1))==0) then {
				[natoTank3,false] remoteExec ["hideObject",0,true];
			};
		} 
		else {
			_x addMPEventHandler ["mpkilled", {[_this] spawn{	
																if (isServer) then {
																	_veh = _this select 0 select 0;
																
																	if ((_veh == natoQuad2_1) or (_veh == natoQuad1_1)) then {
																		uiSleep 59;
																		deleteVehicle natoQuad1_1;
																		deleteVehicle natoQuad2_1;
																		[natoQuad3_1,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoQuad2_2) or (_veh == natoQuad1_2)) then {
																		uiSleep 59;
																		deleteVehicle natoQuad1_2;
																		deleteVehicle natoQuad2_2;
																		[natoQuad3_2,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoTransport2) or (_veh == natoTransport1)) then {
																		uiSleep 59;
																		deleteVehicle natoTransport2;
																		deleteVehicle natoTransport1;
																		[natoTransport3,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoMrap2) or (_veh == natoMrap1)) then {
																		uiSleep 119;
																		deleteVehicle natoMrap2;
																		deleteVehicle natoMrap1;
																		[natoMrap3,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoLav2) or (_veh == natoLav1)) then {
																		uiSleep 119;
																		deleteVehicle natoLav2;
																		deleteVehicle natoLav1;
																		[natoLav3,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoTank2) or (_veh == natoTank1)) then {
																		uiSleep 119;
																		deleteVehicle natoTank2;
																		deleteVehicle natoTank1;
																		[natoTank3,false] remoteExec ["hideObject",0,true];
																	};
																};
															};
													}];
		};
	} forEAch _natoBase2Vehicles;
	
	// begins csat forEach loop
	{	
		if ((count (crew _x))==0) then {
			deleteVehicle _x;
			
			if ((_x == csatQuad2_1) and (count (crew csatQuad1_1))==0) then {
				[csatQuad3_1,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatQuad2_2) and (count (crew csatQuad1_2))==0) then {
				[csatQuad3_2,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatTransport2) and (count (crew csatTransport1))==0) then {
				[csatTransport3,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatMrap2) and (count (crew csatMrap1))==0) then {
				[csatMrap3,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatLav2) and (count (crew csatLav1))==0) then {
				[csatLav3,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatTank2) and (count (crew csatTank1))==0) then {
				[csatTank3,false] remoteExec ["hideObject",0,true];
			};
		} 
		else {
			_x addMPEventHandler ["mpkilled", {[_this] spawn{	
																if (isServer) then {
																	_veh = _this select 0 select 0;
																
																	if ((_veh == csatQuad2_1) or (_veh == csatQuad1_1)) then {
																		uiSleep 59;
																		deleteVehicle csatQuad1_1;
																		deleteVehicle csatQuad2_1;
																		[csatQuad3_1,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatQuad2_2) or (_veh == csatQuad1_2)) then {
																		uiSleep 59;
																		deleteVehicle csatQuad1_2;
																		deleteVehicle csatQuad2_2;
																		[csatQuad3_2,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatTransport2) or (_veh == csatTransport1)) then {
																		uiSleep 59;
																		deleteVehicle csatTransport2;
																		deleteVehicle csatTransport1;
																		[csatTransport3,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatMrap2) or (_veh == csatMrap1)) then {
																		uiSleep 119;
																		deleteVehicle csatMrap2;
																		deleteVehicle csatMrap1;
																		[csatMrap3,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatLav2) or (_veh == csatLav1)) then {
																		uiSleep 119;
																		deleteVehicle csatLav2;
																		deleteVehicle csatLav1;
																		[csatLav3,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatTank2) or (_veh == csatTank1)) then {
																		uiSleep 119;
																		deleteVehicle csatTank2;
																		deleteVehicle csatTank1;
																		[csatTank3,false] remoteExec ["hideObject",0,true];
																	};
																};
															};
													}];
		};
	} forEAch _csatBase2Vehicles;
};