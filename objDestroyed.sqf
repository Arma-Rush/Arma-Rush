if (isServer) then {
	_obj = _this select 0 select 0;

	if (_obj == obj1) then {
		objAArmed = false;
		objACurr = nil;
		publicVariable "objAArmed";
		publicVariable "objACurr";
		[["a"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		"mk1-1" remoteExec ["deleteMarker",0,true];
		obj1 remoteExec ["removeAllActions",0,true];
		["TaskCanceled",["","Defend objective A"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective A"]] remoteExec ["bis_fnc_showNotification",attackers];
		if ((!alive obj1) AND (!alive obj2)) then {execVM "createGroup2.sqf";};
	};
	
	if (_obj == obj2) then {
		objBArmed = false;
		objBCurr = nil;
		publicVariable "objBArmed";
		publicVariable "objBCurr";
		[["b"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		["TaskCanceled",["","Defend objective B"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective B"]] remoteExec ["bis_fnc_showNotification",attackers];
		"mk1-2" remoteExec ["deleteMarker",0,true];
		obj2 remoteExec ["removeAllActions",0,true];
		if ((!alive obj1) AND (!alive obj2)) then {execVM "createGroup2.sqf";};
	};
	
	if (_obj == obj3) then {
		objAArmed = false;
		objACurr = nil;
		publicVariable "objAArmed";
		publicVariable "objACurr";
		[["a"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		["TaskCanceled",["","Defend objective A"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective A"]] remoteExec ["bis_fnc_showNotification",attackers];
		"mk2-1" remoteExec ["deleteMarker",0,true];
		obj3 remoteExec ["removeAllActions",0,true];
		if ((!alive obj3) AND (!alive obj4)) then { execVM "createGroup3.sqf";};
	};
	
	if (_obj == obj4) then {
		objBArmed = false;
		objBCurr = nil;
		publicVariable "objBArmed";
		publicVariable "objBCurr";
		[["b"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		["TaskCanceled",["","Defend objective B"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective B"]] remoteExec ["bis_fnc_showNotification",attackers];
		"mk2-2" remoteExec ["deleteMarker",0,true];
		obj4 remoteExec ["removeAllActions",0,true];
		if ((!alive obj3) AND (!alive obj4)) then { execVM "createGroup3.sqf";};
	};
	
	if (_obj == obj5) then {
		objAArmed = false;
		objACurr = nil;
		publicVariable "objAArmed";
		publicVariable "objACurr";
		[["a"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		["TaskCanceled",["","Defend objective A"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective A"]] remoteExec ["bis_fnc_showNotification",attackers];
		"mk3-1" remoteExec ["deleteMarker",0,true];
		removeAllActions obj5;
		if ((!alive obj5) AND (!alive obj6)) then { execVM "createGroup4.sqf";};
	};
	
	if (_obj == obj6) then {
		objBArmed = false;
		objBCurr = nil;
		publicVariable "objBArmed";
		publicVariable "objBCurr";
		[["b"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		["TaskCanceled",["","Defend objective B"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective B"]] remoteExec ["bis_fnc_showNotification",attackers];
		deleteMarker "mk3-2";
		removeAllActions obj6;
		if ((!alive obj5) AND (!alive obj6)) then { execVM "createGroup4.sqf";};
	};
	
	if (_obj == obj7) then {
		objAArmed = false;
		objACurr = nil;
		publicVariable "objAArmed";
		publicVariable "objACurr";
		[["a"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		["TaskCanceled",["","Defend objective A"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective A"]] remoteExec ["bis_fnc_showNotification",attackers];
		["Draw3D", a] remoteExec ["removeMissionEventHandler",0,true];
		deleteMarker "mk4-1";
		removeAllActions obj7;
		if((!alive obj7) AND (!alive obj8)) then { execVM "endGame.sqf";};
	};
	
	if (_obj == obj8) then {
		objBArmed = false;
		objBCurr = nil;
		publicVariable "objBArmed";
		publicVariable "objBCurr";
		[["b"],"remove3D.sqf"] remoteExec ["execVM",0,false];
		["TaskCanceled",["","Defend objective B"]] remoteExec ["bis_fnc_showNotification",defenders];
		["TaskSucceeded",["","Destroy objective B"]] remoteExec ["bis_fnc_showNotification",attackers];
		deleteMarker "mk4-2";
		removeAllActions obj8;
		if((!alive obj7) AND (!alive obj8)) then { execVM "endGame.sqf";};
	};
};