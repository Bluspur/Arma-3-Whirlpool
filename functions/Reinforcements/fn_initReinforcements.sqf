if (isServer) then {
	_callerArray = [];
	Dispatch setVariable ["Reinforcements",[]];
	Dispatch setVariable ["Callouts",[]];
	Dispatch setVariable ["Mortars",[]];
	Dispatch setVariable ["Roads",[]];
	[] call BLU_fnc_getRoads;
	[] spawn BLU_fnc_dispatcher;
	{
		if (((side _x) == east) && !(isNil{_x getVariable "Caller"})) then {
			_caller = _x getVariable "Caller";
			//systemChat format ["%1, %2",_x, _caller];
			[_x,_caller] spawn BLU_fnc_caller; 
		};
		if ((vehicle _x != _x) && (vehicle _x isKindOf "StaticMortar") && !(isNil{(vehicle _x) getVariable "Status"})) then {
			_status = (vehicle _x) getVariable "Status";
			//systemChat format ["%1, %2",_x, _status];
			_update = Dispatch getVariable "Mortars";
			_update append [[_x,_status]];
			_x addEventHandler ["Killed", {
				params ["_unit"];
				_update = Dispatch getVariable "Mortars";
				_entry = _update findIf {(_x select 0) == _unit};
				(_update select _entry) set [1,"DISABLED"];
			}];
			_x addEventHandler ["GetOutMan", {
				params ["_unit"];
				_update = Dispatch getVariable "Mortars";
				_entry = _update findIf {(_x select 0) == _unit};
				(_update select _entry) set [1,"DISABLED"];
			}];
			_x addEventHandler ["GetInMan", {
				params ["_unit"];
				_update = Dispatch getVariable "Mortars";
				_entry = _update findIf {(_x select 0) == _unit};
				(_update select _entry) set [1,"READY"];
			}];
		};
	} forEach allUnits;
};