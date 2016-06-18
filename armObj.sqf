// run the actual bomb arm script from the server
_obj = _this select 3 select 0;

if (_obj == obj1) then {
	[[player,_obj,obj1Charge,1],"armObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj2) then {
	[[player,_obj,obj2Charge,2],"armObjB.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj3) then {
	[[player,_obj,obj3Charge,3],"armObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj4) then {
	[[player,_obj,obj4Charge,4],"armObjB.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj5) then {
	[[player,_obj,obj5Charge,5],"armObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj6) then {
	[[player,_obj,obj6Charge,6],"armObjB.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj7) then {
	[[player,_obj,obj7Charge,7],"armObjA.sqf"] remoteExec ["execVM",2];
};

if (_obj == obj8) then {
	[[player,_obj,obj8Charge,8],"armObjB.sqf"] remoteExec ["execVM",2];
};