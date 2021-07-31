/*
	File: fnc_spawn_blackfish_cargo.sqf
	Author: DasJayYa

	Description:
	Spawns a Vehicle that will spawn and assault the provided destination

	Parameter(s):
	_this select 0: Pos - Spawn Position - Marker or Coordinates

grpPlayers
	e.g. [getmarkerPos "heliSpawn1", 40, "B_T_VTOL_01_vehicle_F", west, getmarkerPos "lzOne", getmarkerPos "dest"] call fnc_spawn_blackfish_cargo;
	Returns:
	Array - [Veh, Units Arr, Group ID]
*/

private ["_spawnMrker","_dir","_veh","_side","_destMrker","_grpArr","_grpVeh","_grpID","_pilot","_wp"];

if (!isServer) exitWith {};

_spawnMrker = _this select 0;
_dir = _this select 1;
_veh = _this select 2;
_side = _this select 3;
_destMrker = _this select 4;
_exitMrker = _this select 5;

_grpArr = [_spawnMrker, _dir, "B_T_VTOL_01_vehicle_F", _side] call BIS_fnc_spawnVehicle;

//Select Pilot n shit
_grpVeh = _grpArr select 0;
_grpID = _grpArr select 2;
_pilot = driver _grpVeh;

_grpVeh animateDoor ['Door_1_source', 1];

//Set Waypoint for group
_wp = _grpID addWaypoint [_destMrker, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointStatements ["true", "_grpVeh land 'GET OUT'; _grpVeh setVehicleCargo objNull;"];
_wp setWaypointCompletionRadius 250;

//Set Waypoint for group
_wp = _grpID addWaypoint [_destMrker, 0];
_wp setWaypointType "VEHICLEINVEHICLEUNLOAD";
_wp setWaypointStatements ["true", "_grpVeh setVehicleCargo objNull;"];

_wp = _grpID addWaypoint [_exitMrker, 0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "FULL";

//Spawn Vehicle in Transport
_grpArr2 = [_spawnMrker, _dir, "B_LSV_01_armed_F", _side] call BIS_fnc_spawnVehicle;

//Select Pilot n shit
_grp2Veh = _grpArr2 select 0;
_grp2ID = _grpArr2 select 2;
_grp2Driver = driver _grp2Veh;

_grp2Veh allowCrewInImmobile true;

//Load Vehicle into Heli
_result = _grpVeh setVehicleCargo _grp2Veh;

_wp = _grp2ID addWaypoint [_exitMrker, 0];
_wp setWaypointType "SAD";

_grpArr2;


/**
endHeli land "GET OUT"; endHeli animateDoor ['Door_rear', 1];