/*
//TODO search at destination is semi-functional, consider switching to a lambs function for a less aggressive patrol.
If the area is clear and a certain time has elapsed it needs to send the group back to their vehicle
It needs to check that their vehicle is still usable and if not, either fix it or search for another vehicle
It needs to remount the group
It needs to mark the group as available
It needs to move the group back to their origin point
*/

_reactionGroup = _this select 0;
_vehicle = _this select 1;
_target = _this select 2;

//Check One
if ((isNull _reactionGroup) || (behaviour (leader _reactionGroup) == "COMBAT")) exitWith {
	//Either the group is dead or they are in combat
};

//Mount up!
(units _reactionGroup) allowGetIn true;
(units _reactionGroup) orderGetIn true;

//Ready?! (might need a check or two)
waitUntil {
	({vehicle _x  != _x} count (units _reactionGroup)) == ( {alive _x} count (units _reactionGroup))
	};

//Reset Waypoints
{
	[_reactionGroup, (currentWaypoint _reactionGroup)] setWaypointPosition [getPosASL ((units _reactionGroup) select 0), -1];
	sleep 0.1;
	for "_i" from count waypoints _reactionGroup - 1 to 0 step -1 do 
	{
		deleteWaypoint [_reactionGroup, _i];
	};
};

//Where to Sir?
_roads = Dispatch getVariable "Roads";
_sortedRoads = _roads apply {_x distance getMarkerPos _target};
_minIndex = _sortedRoads findIf {_x == selectMin _sortedRoads};
_dropLocation = _roads select _minIndex;

//Let me mark that for you!
_dropMarker = createMarker ["DropMarker", getPos _dropLocation];
_dropMarker setMarkerType "mil_start";
_dropMarker setMarkerAlpha 0;

//On your Bike! (Might need some checks if they are attacked on the way)
_wp0 = _reactionGroup addWaypoint [_dropLocation,-1];
_wp0 setWaypointType "GETOUT";

//Where should we look?
_searchMarker = createMarker ["searchMarker", getMarkerPos _target];
_searchMarker setMarkerShape "RECTANGLE";
_searchMarker setMarkerSize [200, 200];
_searchMarker setMarkerAlpha 0;

//On our way!
_wp1 = _reactionGroup addWaypoint [getMarkerPos _searchMarker,-1];
_wp1 setWaypointType "MOVE";
waitUntil {(currentWaypoint _reactionGroup) == ((count waypoints _reactionGroup))};
[_reactionGroup, _searchMarker] call CBA_fnc_taskSearchArea;

