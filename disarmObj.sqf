// run the actual bomb arm script from the server
_obj = _this select 3 select 0;

if (_obj == obj1) then {
	[[player,_obj],"disarmObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj2) then {
	[[player,_obj],"disarmObjB.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj3) then {
	[[player,_obj],"disarmObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj4) then {
	[[player,_obj],"disarmObjB.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj5) then {
	[[player,_obj],"disarmObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj6) then {
	[[player,_obj],"disarmObjB.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj7) then {
	[[player,_obj],"disarmObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj8) then {
	[[player,_obj],"disarmObjB.sqf"] remoteExec ["execVM",2];
};