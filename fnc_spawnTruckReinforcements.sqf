/*
	File: fnc_spawnTruckReinforcements.sqf
	Author: DasJayYa

	Description:
	Group will drive truck to marker and get out and assult defined position

	Parameter(s):
		_this select 0: Pos - Spawn Position - Marker or Coordinates
		_this select 1: Pos - Position where units will disembark
		_this select 2: Pos - Position where units will assault after disembarking
		_this select 3: Can be multiple inputs
			- list of character types (Array)
			- amount of characters (Number)
			- CfgGroups entry (Config)
		_this select 4: Side - Side of the spawned Units
		_this select 5: STRING - Classname of the Transport Truck
		_this select 6: (Optional) NUMBER - Trucks Spawn Direction

	e.g. [getmarkerPos "spawnCar1", getmarkerPos "exitMarker1", getmarkerPos "regroup", ["I_G_Soldier_F","I_G_Soldier_lite_F"], Resistance, "I_G_Van_01_transport_F", 100] call spawnReinforcements;
	Returns:
	Array - Group Array
*/

private ["_spawnMrker", "_posOut", "_posAttk", "_groupUnits", "_side", "_transport", "_spawnDir"];

if (!isServer) exitWith {};

_spawnMrker = _this select 0;
_posOut = _this select 1;
_posAttk = _this select 2;
_groupUnits = _this select 3;
_side = _this select 4;
_transport = _this select 5;
_spawnDir = if (count _this > 5) then {_this select 6} else {{100}};

_veh = _transport createVehicle _spawnMrker;
_veh setdir _spawnDir;
_grp = [_spawnMrker, _side, _groupUnits] call BIS_fnc_spawnGroup;
{_x moveInAny _veh} foreach (units _grp);

_wp = _grp addWaypoint [_posOut, 0];
_wp setWaypointType "GETOUT";
_wp setWaypointCompletionRadius 20;

_wp = _grp addWaypoint [_posAttk, 0];
_wp setWaypointType "SAD";
_wp setWaypointCompletionRadius 20;

_grp;