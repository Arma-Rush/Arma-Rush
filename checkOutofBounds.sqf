while {true} do {
	if(player inArea natoRestriction1) then {
		[[player,true,natoRestriction1],"blackandwhite.sqf"] remoteExec ["execVM",player,false];
	};
	sleep 1;
};