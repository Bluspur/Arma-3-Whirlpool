_callerUnit = _this select 0;
_callerArea = _this select 1;
_detectionTime = ["DetectionTime", 9] call BIS_fnc_getParamValue;
_alerted = false;

while {alive _callerUnit} do {
	while {(!_alerted) && (alive _callerUnit)} do {
		_allPlayers = call BIS_fnc_listPlayers;
		{
			if ((alive _x) && (!_alerted)) then {
				if (((_callerUnit knowsAbout _x) >= 1.4) || ((behaviour _callerUnit ) == "COMBAT")) then {
					_alerted = true;
					//systemChat format ["Unit detected at %1",_callerArea];
				};
			};
		} forEach _allPlayers;
	};
	sleep _detectionTime;
	if (alive _callerUnit && !(_callerArea getVariable "HelpCalled")) then {
		_callerArea setVariable ["HelpCalled",true];
		_detectedEnemy = _callerUnit findNearestEnemy _callerUnit;
		_reinforceLocation = if (!isNull _detectedEnemy) then {getPos _detectedEnemy} else {getPos _callerUnit};
		_reinforceMarker = createMarker ["Marker1", _reinforceLocation];
		_reinforceMarker setMarkerType "mil_objective";
		_reinforceMarker setMarkerAlpha 0;
		//systemChat "Marker Created Successfully";
		//systemChat format ["Sending report from %1",_callerArea];
		_update = Dispatch getVariable "Callouts";
		_update append [[_reinforceMarker,_callerArea]];
		//report to dispatcher
		sleep 600;
		_alerted = false;
		//systemChat "Alert status reset";
	}
	else {
		if (!alive _callerUnit) then {
			//systemChat "Reporting unit killed, standing down";
		}
		else {
			//systemChat "Unit detected, but this area has already called for help";
			sleep 30;
		};
	};
};

