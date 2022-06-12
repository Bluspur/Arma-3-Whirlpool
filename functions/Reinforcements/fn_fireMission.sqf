_gunner = _this select 0; //Object: Which gunner should fire their mortar?
_target = _this select 1; //Marker: Where should the mortar fire?
_index = _this select 2; //INT: DYNAMIC! What is the mortars index in the available mortars list?
_type = _this select 3; //STRING: What classname of shell should the mortar use?
_burst = _this select 4; //INT: How many rounds should the mortar fire per burst?
_duration = _this select 5; //INT: How many minutes should the mortar attack the target?
_delay = _this select 6; //INT: How long should the mortar wait between bursts?
_startTime = dayTime;
_deltaTime = 0;
_status =
for [{_i = 0}, {_i <= _duration}, {_i = _deltaTime}] do {
	//Check if mortar is still active
	_status = ((Dispatch getVariable "Mortars") select _index) select 1;
	if (_status == "DISABLED") exitWith {};
	_gunner doArtilleryFire [(getMarkerPos _target), _type, _burst];
	sleep _delay;
	_deltaTime = [_startTime] call BLU_fnc_getTimeElapsed;
	//hint format ["Duration in Minutes: %1",_deltaTime];
};
//Rounds Complete
_status = ((Dispatch getVariable "Mortars") select _index) select 1;
if (_status != "DISABLED") then {
	_update = Dispatch getVariable "Mortars";
	(_update select _index) set [1,"READY"];
};