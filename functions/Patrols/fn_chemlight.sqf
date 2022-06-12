_unit = _this select 0;
_colour = _this select 1;
_chemlightClass = "chemlight_" + _colour;
_chem = objNull;

while {(alive _unit) && (behaviour _unit != "COMBAT")} do
{
	if ((isNull _chem) && (vehicle _unit == _unit)) then 
	{
		_chem = createVehicle [_chemlightClass, position _unit, [], 0, "NONE"];
		_chem attachto [_unit,[0,-0.1,.10],"leftshoulder"];
		//systemChat "Creating Chemlight";
	}
	else {
		//systemChat "Light already exists";
	};
	if (vehicle _unit != _unit) then {
		detach _chem;
		deleteVehicle _chem;
	};
	sleep 1;
};
detach _chem;