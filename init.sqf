MISSION_ROOT = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

end = false;

defenders = east;
attackers = west;
	
if (isServer ) then {
	
	playerADisarming = nil;
	playerBDisarming = nil;
	objADisarming = false;
	objBDisarming = false;
	objAArmed = false;
	objBArmed = false;
	objACurr = obj1;
	objBCurr = obj2;
	activeRestrictions = [natoRestriction1, csatRestriction1, allRestriction1];
	
	publicVariable "playerADisarming";
	publicVariable "playerBDisarming";
	publicVariable "objADisarming";
	publicVariable "objBDisarming";
	publicVariable "objAArmed";
	publicVariable "objBArmed";
	publicVariable "objACurr";
	publicVariable "objBCurr";
	publicVariable "activeRestrictions";
	
	//execVm "kill.sqf"; // TESTING ONLY
	//execVm "tickets.sqf"; // TESTING ONLY
	//execVM "vehicle.sqf";
	
	_objs = [obj1,obj2,obj3,obj4,obj5,obj6,obj7,obj8];
	_objCharges = [obj1Charge,obj2Charge,obj3Charge,obj4Charge,obj5Charge,obj6Charge,obj7Charge,obj8Charge];
	_natoBase1Vehicles = [natoMrap1, natoQuad1_1, natoQuad1_2, natoTransport1, natoTank1, natoLav1];

	// this is the number to refresh attacker tickets to after A and B are destroyed
	numBlueForTickets = 100;	

	"natoOrient2" setMarkerAlpha 0;
	"csatOrient2" setMarkerAlpha 0;
	"natoOrient3" setMarkerAlpha 0;
	"csatOrient3" setMarkerAlpha 0;
	"natoOrient4" setMarkerAlpha 0;
	"csatOrient4" setMarkerAlpha 0;

	createMarker ["csatRestMk1",(getPos csatRestriction1)];
		"csatRestMk1" setMarkerShape "RECTANGLE";
		"csatRestMk1" setMarkerSize [14000,2000];
		"csatRestMk1" setMarkerColor "ColorRed";
		"csatRestMk1" setMarkerBrush "BDiagonal";
		["csatRestMk1",0] remoteExec ["setMarkerAlphaLocal",attackers,true];	// hide this restriction zone from blufor
			
	createMarker ["natoRestMk1",(getPos natoRestriction1)];
		"natoRestMk1" setMarkerShape "RECTANGLE";
		"natoRestMk1" setMarkerSize [14000,2000];
		"natoRestMk1" setMarkerColor "ColorRed";
		"natoRestMk1" setMarkerBrush "BDiagonal";
		["natoRestMk1",0] remoteExec ["setMarkerAlphaLocal",defenders,true];	// hide this restriction zone from opfor
			
	createMarker ["allRestMk5",(getPos allRestriction1)];
		"allRestMk5" setMarkerShape "RECTANGLE";
		"allRestMk5" setMarkerSize [14000,2000];
		"allRestMk5" setMarkerColor "ColorRed";
		"allRestMk5" setMarkerBrush "BDiagonal";
		"allRestMk5" setMarkerDir -45;
	
	// add the event handler to call the script when an obj is destroyed
	// disable simulation (inventories and moving objs via ramming) for all objectives
	// clear all obj inventories
	{
		_x addMPEventHandler ["mpkilled", {[_this] execVM "objDestroyed.sqf";}]; 
		_x enableSimulationGlobal false;
		clearWeaponCargo _x;
		clearMagazineCargo _x;
	} forEach _objs;
	
	// disable simulation for all obj charges and hide them
	{
		_x hideObject true;
		_x enableSimulationGlobal false;
	} forEach _objCharges;
	
	//{ _x hideObject true; _x enableSimulation false;} forEach _natoBase1Vehicles;
	
	//natoMrapActual setPos (getPos natoMrap1);
	//natoMrapActual setDir (getDir natoMrap1);
	
	// add the arm and disarm actions for all objectives
	// save this for later ;) (side player == defenders)AND
	[obj1,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObj.sqf",[obj1],6,true,true,"","(((player distance obj1) < 5)AND(!objAArmed)AND(alive obj1)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj1,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmObj.sqf",[obj1],6,true,true,"","(((player distance obj1) < 5)AND(objAArmed)AND(alive obj1)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
	[obj2,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armObj.sqf",[obj2],6,true,true,"","(((player distance obj2) < 5)AND(!objBArmed)AND(alive obj2)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj2,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmobj.sqf",[obj2],6,true,true,"","(((player distance obj2) < 5)AND(objBArmed)AND(alive obj2)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
	[obj3,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armobj.sqf",[obj3],6,true,true,"","(((player distance obj3) < 5)AND(!objAArmed)AND(alive obj3)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj3,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmobj.sqf",[obj3],6,true,true,"","(((player distance obj3) < 5)AND(objAArmed)AND(alive obj3)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
	[obj4,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armobj.sqf",[obj4],6,true,true,"","(((player distance obj4) < 5)AND(!objBArmed)AND(alive obj4)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj4,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmobj.sqf",[obj4],6,true,true,"","(((player distance obj4) < 5)AND(objBArmed)AND(alive obj4)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
	[obj5,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armobj.sqf",[obj5],6,true,true,"","(((player distance obj5) < 5)AND(!objAArmed)AND(alive obj5)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj5,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmobj.sqf",[obj5],6,true,true,"","(((player distance obj5) < 5)AND(objAArmed)AND(alive obj5)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
	[obj6,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armobj.sqf",[obj6],6,true,true,"","(((player distance obj6) < 5)AND(!objBArmed)AND(alive obj6)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj6,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmobj.sqf",[obj6],6,true,true,"","(((player distance obj6) < 5)AND(objBArmed)AND(alive obj6)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
	[obj7,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armobj.sqf",[obj7],6,true,true,"","(((player distance obj7) < 5)AND(!objAArmed)AND(alive obj7)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj7,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmobj.sqf",[obj7],6,true,true,"","(((player distance obj7) < 5)AND(objAArmed)AND(alive obj7)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
	[obj8,[("<t color=""#FF0000"">"+"Arm Objective"+"</t>"),"armobj.sqf",[obj8],6,true,true,"","(((player distance obj8) < 5)AND(!objBArmed)AND(alive obj8)AND(player==vehicle player))"]]remoteExec["addAction",attackers,true];
	[obj8,[("<t color=""#00FF00"">"+"Disarm Objective"+"</t>"),"disarmobj.sqf",[obj8],6,true,true,"","(((player distance obj8) < 5)AND(objBArmed)AND(alive obj8)AND(player==vehicle player))"]]remoteExec["addAction",defenders,true];
};

	a = addMissionEventHandler ["Draw3D", {
		drawIcon3D ["A3\ui_f\data\map\markers\military\destroy_CA.paa", [1,1,1,1], getPosATL objACurr, 1, 1, 45, "A", 1, 0.05, "TahomaB","center",true];
	}];
	b = addMissionEventHandler ["Draw3D", {
		drawIcon3D ["A3\ui_f\data\map\markers\military\destroy_CA.paa", [1,1,1,1], getPosATL objBCurr, 1, 1, 45, "B", 1, 0.05, "TahomaB","center",true];
	}];
	
	"objAArmed" addPublicVariableEventHandler {
		if (objAArmed) then {
			helipadA = "PortableHelipadLight_01_red_F" createVehicle [0,0,0];
			helipadA attachTo [objACurr, [-1.3,0,-1.3]];
			helipadA say3D "bombAlarm";
			if (side player == attackers) then {
				player say3D ["US_Friendly_Charge_Armed_A",0,1];
			} else{
				player say3D ["RU_Hostile_Charge_Armed_A",0,1];
			};
		} else {
			deleteVehicle helipadA;
		};
	};
	
	"objBArmed" addPublicVariableEventHandler {
		if (objBArmed) then {
			helipadB = "Land_HelipadEmpty_F" createVehicle [0,0,0];
			helipadB attachTo [objBCurr, [-1.3,0,-1.3]];
			helipadB say3D "bombAlarm";
			if (side player == attackers) then {
				player say3D ["US_Friendly_Charge_Armed_B",0,1];
			}else{
				player say3D ["RU_Hostile_Charge_Armed_B",0,1];
			};
		} else {
			deleteVehicle helipadB;
		};
	};
	
	"objADisarming" addPublicVariableEventHandler {
		if (objADisarming) then {
			helipadDA = "Land_HelipadEmpty_F" createVehicle [0,0,0];
			helipadDA attachTo [playerADisarming, [0,0,0]];
			helipadDA say3D "bombDisarming";
		} else {
			deleteVehicle helipadDA;
		};
	};
	
	"objBDisarming" addPublicVariableEventHandler {
		if (objBDisarming) then {
			helipadDB = "Land_HelipadEmpty_F" createVehicle [0,0,0];
			helipadDB attachTo [playerBDisarming, [0,0,0]];
			helipadDB say3D "bombDisarming";
		} else {
			deleteVehicle helipadDB;
		};
	};
