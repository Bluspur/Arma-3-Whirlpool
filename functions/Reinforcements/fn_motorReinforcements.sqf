//passed from init
_vehicle = _this select 0;
_advisor = _this select 1;
_chemlights = _this select 2;

//init variables
_groupClasses = [
	"B_HIDF_Soldier_SL_F",
	"O_T_Soldier_TL_F", //advisor slot!
	"B_HIDF_Soldier_TL_F",
	"B_HIDF_Soldier_A_F",
	"B_HIDF_RadioOperator_F",
	"B_HIDF_Soldier_AR_F",
	"B_HIDF_Medic_F"
	];

//init group
_group = createGroup [east,true];
_group setVariable ["State","INIT"];

//init units
if !(_advisor) then {
	_groupClasses deleteAT 1;
	//systemChat "No advisor";
};

{
	private _unit = _group createUnit [_x, getPos _vehicle, [], 5, "None"];
	[_unit] joinSilent _group;
	if (_unit == leader _group) then {
		_unit setRank "LIEUTENANT";
		[_unit,"red"] spawn BLU_fnc_chemlight;
	};
	if (_x == "O_T_Soldier_TL_F") then {
		_unit setRank "SERGEANT";
	};
	if (_x == "B_HIDF_RadioOperator_F") then {
		_unit setRank "CORPORAL";
		[_unit,"red"] spawn BLU_fnc_chemlight;
	};
	//_unit moveInAny _vehicle;
	_unit triggerDynamicSimulation false;
} forEach _groupClasses;

//init vehicle
_vehicle triggerDynamicSimulation false;
_vehicle addEventHandler ["Killed",{
	params ["_unit"];
	_update = Dispatch getVariable "Reinforcements";
	_entry = _update findIf {(_x select 2) == _unit};
	(_update select _entry) set [1,"DISABLED"];
}];
_group addVehicle _vehicle;
(units _group) allowGetIn false;

//Ready
_group setVariable ["State","READY"];

//Pass to Dispatch
waitUntil {!isNil{Dispatch getVariable "Reinforcements"}};
_update = Dispatch getVariable "Reinforcements";
_update append [[_group,(_group getVariable "State"),_vehicle]];