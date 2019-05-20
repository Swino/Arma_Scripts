/*
	File: fnc_ropeDrop.sqf
	Author: DasJayYa

	Description:
	Spawns Vehicle with Crate and attachs cargo as sling. Vehicle will navigate and dropp off cargo and fly away.
	Declare function in the mission Init.sqf and put script in 'Functions' folder
		fnc_ropeDrop = compile preprocessFileLineNumbers "Functions\fnc_ropeDrop.sqf";

	Parameter(s):
		_this select 0: Pos - Spawn Position - Marker or Coordinates
		_this select 1: Pos - DropOff Position - Marker or Coordinates
		_this select 2: Pos - Exit Position - Marker or Coordinates
		_this select 3: String - The class of the vehicle
		_this select 4: Side - Side of the spawned Units
		_this select 5: String - Classname of cargo, crate or vehicle

	e.g.[getpos start, getpos dropOff, getpos end, "B_Heli_Transport_01_F", west, "B_supplyCrate_F"] call fnc_ropeDrop;
		[getMarkerPos "start", getMarkerPos "dropOff", getMarkerPos "end", "B_Heli_Transport_01_F", west, "B_supplyCrate_F"] call fnc_ropeDrop;
	Returns:
	Array - Group Array
*/

private ["_start", "_dropOff", "_finish", "_veh", "_side", "_itemCarry"];

if (!isServer) exitWith {};
// Validate parameter count
if ((count _this) < 6) exitWith {debugLog "Log: [fnc_ropeDrop] Function requires at least 6 parameters!"; []};

_start = _this select 0;
_dropOff = _this select 1;
_finish = _this select 2;
_veh = _this select 3;
_side = _this select 4;
_itemCarry = _this select 5;

// Validate Inputs
if ((typeName _start) != (typeName [])) exitWith {debugLog "Log: [fnc_ropeDrop] Start (0) must be an Array!"; []};
if ((typeName _dropOff) != (typeName [])) exitWith {debugLog "Log: [fnc_ropeDrop] dropOff (1) must be an Array!"; []};
if ((typeName _finish) != (typeName [])) exitWith {debugLog "Log: [fnc_ropeDrop] End (2) must be an Array!"; []};
if ((typeName _veh) != (typeName "")) exitWith {debugLog "Log: [fnc_ropeDrop] veh (3) must be a String!"; []};
if ((typeName _itemCarry) != (typeName "")) exitWith {debugLog "Log: [fnc_ropeDrop] itemCarry (6) must be a String!"; []};

// Spawn Vehicle
_grpArr = [_start, 1, _veh, _side] call BIS_fnc_spawnVehicle;

// Setup Veh Group Variables
_grpVeh = _grpArr select 0;
_grpID = _grpArr select 2;
_pilot = driver _grpVeh;

// Spawn and attach Ammo
_cargo = createVehicle [_itemCarry, _start,[],0,"FLY"];

//Attach Cargo
_grpVeh setSlingLoad _cargo;

//Set Waypoint for group
_wp1 = _grpID addWaypoint [_dropOff, 0];
_wp1 setWaypointType "UNHOOK";
_wp1 setWaypointCombatMode "BLUE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointCompletionRadius 50;

_wp2 = _grpID addWaypoint [_finish, 0];
_wp2 setWaypointType "Move";
_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle this) + [vehicle this];"];
_wp2 setWaypointCompletionRadius 50;

_grpID;