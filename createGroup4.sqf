if (isServer ) then {

	// Process Group 4 (Agia Mariana)
	_natoBase3Vehicles = [natoQuad1_1,natoQuad1_2,natoTransport1,natoMrap1,natoLav1,natoTank1,natoQuad2_1,natoQuad2_2,natoTransport2,natoMrap2,natoLav2,natoTank2,natoQuad3_1,natoQuad3_2,natoTransport3,natoMrap3,natoLav3,natoTank3];
	_csatBase3Vehicles = [csatQuad1_1,csatQuad1_2,csatTransport1,csatMrap1,csatLav1,csatTank1,csatQuad2_1,csatQuad2_2,csatTransport2,csatMrap2,csatLav2,csatTank2,csatQuad3_1,csatQuad3_2,csatTransport3,csatMrap3,csatLav3,csatTank3];
	
	_tmp = [west] call BIS_fnc_respawnTickets;
	_tmp = numBlueforTickets - _tmp;
	[west, _tmp] call BIS_fnc_respawnTickets;
	
	[east, -1] call BIS_fnc_respawnTickets;
	
	"csatOrient3" remoteExec ["deleteMarker",0,true];
	["csatOrient4",1] remoteExec ["setMarkerAlpha",0,true];
	
	// place csat spawn at stratis airbase
	["respawn_east",[2180.031,5779.627]] remoteExec ["setMarkerPos",0,true];
				
	// uiSleep 30;
	
	["TaskAssigned",["","Defend both objectives"]] remoteExec ["bis_fnc_showNotification",defenders,false];
	["TaskAssigned",["","Destroy both objectives"]] remoteExec ["bis_fnc_showNotification",attackers,false];
	
	objACurr = obj7;
	objBCurr = obj8;

	publicVariable "objACurr";
	publicVariable "objBCurr";
	
	"create3D.sqf" remoteExec ["execVM",0,true];
	
	"natoOrient3"  remoteExec ["deleteMarker",0,true];
	"csatRestMk3"  remoteExec ["deleteMarker",0,true];
	"natoRestMk3"  remoteExec ["deleteMarker",0,true];
	
	"allRestMk5"  remoteExec ["deleteMarker",0,true];
	
	["natoOrient4",1] remoteExec ["setMarkerAlpha",0,true];
	
	createMarker ["csatRestMk4",(getPos csatRestriction4)];
		"csatRestMk4" setMarkerShape "RECTANGLE";
		"csatRestMk4" setMarkerSize [14000,2000];
		"csatRestMk4" setMarkerColor "ColorRed";
		"csatRestMk4" setMarkerBrush "BDiagonal";
		"csatRestMk4" setMarkerDir 90;
		["csatRestMk4",0] remoteExec ["setMarkerAlphaLocal",west,true];
	
	createMarker ["natoRestMk4",(getPos natoRestriction4)];
		"natoRestMk4" setMarkerShape "RECTANGLE";
		"natoRestMk4" setMarkerSize [14000,2000];
		"natoRestMk4" setMarkerColor "ColorRed";
		"natoRestMk4" setMarkerBrush "BDiagonal";
		"natoRestMk4" setMarkerDir 115;
		["natoRestMk4",0] remoteExec ["setMarkerAlphaLocal",east,true];
	
	createMarker ["allRestMk6",(getPos allRestriction2)];
		"allRestMk6" setMarkerShape "RECTANGLE";
		"allRestMk6" setMarkerSize [14000,2000];
		"allRestMk6" setMarkerColor "ColorRed";
		"allRestMk6" setMarkerBrush "BDiagonal";
		"allRestMk6" setMarkerDir 15;
		["allRestMk6",1] remoteExec ["setMarkerAlphaLocal",0,true];
		
	["csatRestMk4",1] remoteExec ["setMarkerAlpha",east,true];
	["natoRestMk4",1] remoteExec ["setMarkerAlpha",west,true];
			
	// place nato spawn at radio antenne
	["respawn_west", [5217.33,4986.36]] remoteExec ["setMarkerPos",0,true];
					
	_mkobj7 = createMarker ["mk4-1", (getPos obj7)];
		_mkobj7 setMarkerShape "ICON";
		_mkobj7 setMarkerType "hd_destroy";
		_mkobj7 setMarkerText "A";
					
	_mkobj8 = createMarker ["mk4-2", (getPos obj8)];
		_mkobj8 setMarkerShape "ICON";
		_mkobj8 setMarkerType "hd_destroy";
		_mkobj8 setMarkerText "B";
		
	activeRestrictions = [natoRestriction4, csatRestriction4, allRestriction2];
	publicVariable "activeRestrictions";
		
	// begins nato forEach loop
	{	
		if ((count (crew _x))==0) then {
		
			deleteVehicle _x;
			
			if ((_x == natoQuad3_1) and ((count (crew natoQuad2_1))==0) and ((count (crew natoQuad1_1))==0)) then {
				[natoQuad4_1,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoQuad3_2) and ((count (crew natoQuad2_2))==0) and ((count (crew natoQuad1_2))==0)) then {
				[natoQuad4_2,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoTransport3) and ((count (crew natoTransport2))==0) and ((count (crew natoTransport1))==0)) then {
				[natoTransport4,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoMrap3) and ((count (crew natoMrap2))==0) and ((count (crew natoMrap1))==0)) then {
				[natoMrap4,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoLav3) and ((count (crew natoLav2))==0) and ((count (crew natoLav1))==0)) then {
				[natoLav4,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == natoTank3) and ((count (crew natoTank2))==0) and ((count (crew natoTank1))==0)) then {
				[natoTank4,false] remoteExec ["hideObject",0,true];
			};
		}
		else {
			_x addMPEventHandler ["mpkilled", {[_this] spawn{	
																if (isServer) then {
																	_veh = _this select 0 select 0;
																
																	if ((_veh == natoQuad3_1) or (_veh == natoQuad2_1) or (_veh == natoQuad1_1)) then {
																		uiSleep 59;
																		deleteVehicle natoQuad3_1;
																		[natoQuad4_1,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoQuad3_2) or (_veh == natoQuad2_2) or (_veh == natoQuad1_2)) then {
																		uiSleep 59;
																		deleteVehicle natoQuad3_2;
																		[natoQuad4_2,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoTransport3) or (_veh == natoTransport2) or (_veh == natoTransport1)) then {
																		uiSleep 59;
																		deleteVehicle natoTransport3;
																		[natoTransport4,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoMrap3) or (_veh == natoMrap2) or (_veh == natoMrap1)) then {
																		uiSleep 119;
																		deleteVehicle natoMrap3;
																		deleteVehicle natoMrap2;
																		deleteVehicle natoMrap1;
																		[natoMrap4,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoLav3) or (_veh == natoLav2) or (_veh == natoLav1)) then {
																		uiSleep 119;
																		deleteVehicle natoLav3;
																		[natoLav4,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == natoTank3) or (_veh == natoTank2) or (_veh == natoTank1)) then {
																		uiSleep 119;
																		deleteVehicle natoTank3;
																		[natoTank4,false] remoteExec ["hideObject",0,true];
																	};
																};
															};
													}];
		};
	} forEAch _natoBase3Vehicles;
	
	// begins csat forEach loop
	{	
		if ((count (crew _x))==0) then {
		
			deleteVehicle _x;
			
			if ((_x == csatQuad3_1) and ((count (crew csatQuad2_1))==0) and ((count (crew csatQuad1_1))==0)) then {
				[csatQuad4_1,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatQuad3_2) and ((count (crew csatQuad2_2))==0) and ((count (crew csatQuad1_2))==0)) then {
				[csatQuad4_2,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatTransport3) and ((count (crew csatTransport2))==0) and ((count (crew csatTransport1))==0)) then {
				[csatTransport4,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatMrap3) and ((count (crew csatMrap2))==0) and ((count (crew csatMrap1))==0)) then {
				[csatMrap4,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatLav3) and ((count (crew csatLav2))==0) and ((count (crew csatLav1))==0)) then {
				[csatLav4,false] remoteExec ["hideObject",0,true];
			};
			if ((_x == csatTank3) and ((count (crew csatTank2))==0) and ((count (crew csatTank1))==0)) then {
				[csatTank4,false] remoteExec ["hideObject",0,true];
			};
		}
		else {
			_x addMPEventHandler ["mpkilled", {[_this] spawn{	
																if (isServer) then {
																	_veh = _this select 0 select 0;
																
																	if ((_veh == csatQuad3_1) or (_veh == csatQuad2_1) or (_veh == csatQuad1_1)) then {
																		uiSleep 59;
																		deleteVehicle csatQuad3_1;
																		[csatQuad4_1,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatQuad3_2) or (_veh == csatQuad2_2) or (_veh == csatQuad1_2)) then {
																		uiSleep 59;
																		deleteVehicle csatQuad3_2;
																		[csatQuad4_2,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatTransport3) or (_veh == csatTransport2) or (_veh == csatTransport1)) then {
																		uiSleep 59;
																		deleteVehicle csatTransport3;
																		[csatTransport4,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatMrap3) or (_veh == csatMrap2) or (_veh == csatMrap1)) then {
																		uiSleep 119;
																		deleteVehicle csatMrap3;
																		[csatMrap4,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatLav3) or (_veh == csatLav2) or (_veh == csatLav1)) then {
																		uiSleep 119;
																		deleteVehicle csatLav3;
																		[csatLav4,false] remoteExec ["hideObject",0,true];
																	};
																	if ((_veh == csatTank3) or (_veh == csatTank2) or (_veh == csatTank1)) then {
																		uiSleep 119;
																		deleteVehicle csatTank3;
																		[csatTank4,false] remoteExec ["hideObject",0,true];
																	};
																};
															};
													}];
		};
	} forEAch _csatBase3Vehicles;
};
