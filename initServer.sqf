execVM "update.sqf";
//Init Objectives
_tasks = [];
[true,"NATO","NATO",objNull,"CREATED",-1,false,"scout"] call BIS_fnc_taskCreate;
[true,["NATOAA","NATO"],"NATOAA",getMarkerPos "NATOAAObj","CREATED",-1,false,"destroy"] call BIS_fnc_taskCreate;
//[true,["NATOCargo","NATO"],"NATOCargo",getMarkerPos "NATOCargoObj","CREATED",-1,false,"search"] call BIS_fnc_taskCreate;
[true,["NATOUpload","NATO"],"NATOUpload",getPos NATOUploadObj,"CREATED",-1,false,"upload"] call BIS_fnc_taskCreate;
//[true,"Guer","Guer",objNull,"CREATED",-1,false,"meet"] call BIS_fnc_taskCreate;
//[true,["GuerMeet","Guer"],"GuerMeet",getPos GuerMeetObj,"ASSIGNED",-1,false,"meet"] call BIS_fnc_taskCreate;