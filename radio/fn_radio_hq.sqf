//_nul = execVM "functions\fn_radio_hq.sqf"
_radio_units = missionNamespace getVariable ["squad_radios", []];

{
	_actionAlready = _x getVariable ["has_radio_id", false];
	if (_actionAlready) then {
		// Already have action, do nothing
	} else {
		private _unitAction = [
			_x, 
			"Radio HQ", 
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
			"radioHQCanCall && leader group _this == _this && _this distance _target < 4", 
			"_this distance _target < 4", 
			{}, 
			{}, 
			{
				radioHQCalling = true;
				publicVariable "radioHQCalling";
				radioHQCanCall = false;
				publicVariable "radioHQCanCall";
			},
			{}, 
			[],
			5, 
			1, false, false
		] call BIS_fnc_holdActionAdd;
		_x setVariable ["has_radio_id", true, true];
		_x setVariable ["radio_hq_id", _unitAction, true];
	};
	
} forEach _radio_units;

if (!isServer) exitWith {};

// Update Obective to point to Radios
_task_desc = "Get in touch with Command to get/send an update on the Operation and recieve any updates to your Mission Parameters.<br /><br />RTO's:<br />";
{
	_task_desc = _task_desc + " - " + name _x + "<br />";
} forEach _radio_units;


if (!(["command"] call BIS_fnc_taskExists)) then { 
	"command" call BIS_fnc_missionTasks;
} else {
	["command","CREATED"] call BIS_fnc_taskSetState;
	["command"] call BIS_fnc_taskSetCurrent;
};

["command",[_task_desc, "Radio Command", ""]] call BIS_fnc_taskSetDescription;


//vn_macv_radio_1
//spawn invis marker on player play radio and delete when done
