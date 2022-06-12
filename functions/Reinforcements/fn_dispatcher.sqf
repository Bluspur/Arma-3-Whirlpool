while {true} do {
	_currentCallouts = Dispatch getVariable "Callouts";
	{
		_callout = _x;
		_locationMarker = _x select 0;
		_area = _x select 1;
		_groups = Dispatch getVariable "Reinforcements";
		//systemChat format ["All:%1",_groups];
		_selectedGroupID = _groups findIf {(_x select 1) == "READY"};
		if (_selectedGroupID != -1) then {
			//Reserve the group
			(_groups select _selectedGroupID) set [1,"BUSY"];
			//Group dispatch
			[((_groups select _selectedGroupID) select 0),((_groups select _selectedGroupID) select 2),_locationMarker] spawn BLU_fnc_reactionForce;
			//Check available mortars
			_mortars = Dispatch getVariable "Mortars";
			_selectedMortarID = _mortars findIf {(_x select 1) == "READY"};
			if (_selectedMortarID != -1) then {
				//Reserve the mortar
				(_mortars select _selectedMortarID) set [1,"BUSY"];
				_selectedMortar = _mortars select _selectedMortarId;
				[(_selectedMortar select 0),_locationMarker,_selectedMortarId,"8Rnd_82mm_Mo_Flare_white",2,10,20] spawn BLU_fnc_fireMission;
			};
			//Send instructions to reinforcements
			//Create logic for HE artillery missions
			//Remove call out request
			_currentCallouts deleteAt _forEachIndex;
		}
		else {
			//systemChat "No Reinforcements currently available";
		};
	} forEach _currentCallouts;
	sleep 10;
};