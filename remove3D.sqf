// THIS SCRIPT RUNS ON THE CLIENT ONLY
_toRemove = _this select 0;

if (_toRemove == "a") then {
	removeMissionEventHandler ["Draw3D",a];
}else{
	removeMissionEventHandler ["Draw3D",b];
};