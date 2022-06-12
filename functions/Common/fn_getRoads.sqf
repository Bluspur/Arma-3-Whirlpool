_roads = Dispatch getVariable "Roads";
{
    _node = _x;
    if ( isOnRoad getPos _node || [ "bridge", getModelInfo _node select 0 ] call BIS_fnc_inString ) then {
        _roads pushBack _x;
    };
}forEach ( (getMarkerPos "Center") nearRoads ((getMarkerSize "Center") select 0));