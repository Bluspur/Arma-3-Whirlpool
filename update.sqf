//Init Variables
//missionNamespace setVariable ["NATOCargo",false];

//Update Loop
while {true} do {
	//NATO AA
	if (!alive AAObjectiveOne && !alive AAObjectiveTwo) then {
		["NATOAA","SUCCEEDED"] call BIS_fnc_taskSetState;
	};
	sleep 2;
	
	if (("NATOAA" call BIS_fnc_taskCompleted) && ("NATOUpload" call BIS_fnc_taskCompleted)) then {
		["end1",true] remoteExecCall ['BIS_fnc_endMission',0];
	};
};

