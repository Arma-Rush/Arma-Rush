a = addMissionEventHandler ["Draw3D", {
	drawIcon3D ["A3\ui_f\data\map\markers\military\destroy_CA.paa", [1,1,1,1], getPosATL objACurr, 1, 1, 45, "A", 1, 0.05, "TahomaB", "center", true];
}];
b = addMissionEventHandler ["Draw3D", {
	drawIcon3D ["A3\ui_f\data\map\markers\military\destroy_CA.paa", [1,1,1,1], getPosATL objBCurr, 1, 1, 45, "B", 1, 0.05, "TahomaB", "center", true];
}];