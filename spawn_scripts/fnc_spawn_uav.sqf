/*
	File: fnc_spawn_drone.sqf
	Author: DasJayYa

	Description:
	Spawns a Vehicle that will spawn and assault the provided destination

	Parameter(s):
	_this select 0: Pos - Spawn Position - Marker or Coordinates

grpPlayers
	e.g. [drone_spawn, "B_UAV_02_dynamicLoadout_F", west, objective_01] call fnc_spawn_uav;
	Returns:
	Array - [Veh, Units Arr, Group ID]
*/

private ["_spawnMrker","_veh","_side","_destMrker","_grpArr","_grpVeh","_grpID","_pilot","_wp"];

if (!isServer) exitWith {};

_spawnMrker = _this select 0;
_veh = _this select 1;
_side = _this select 2;
_destMrker = _this select 3;

_uav = [getposATL _spawnMrker, getDir _spawnMrker, _veh, _side] call BIS_fnc_spawnVehicle;

//Select Pilot n shit
_grpVeh = _uav select 0;

createVehicleCrew _grpVeh;  

//Select Pilot n shit
_grpVeh flyInHeight 100;
_grpVeh setVehicleAmmo  0;

//Set Waypoint for group
_wp = group _grpVeh addWaypoint [position _destMrker, 0];
_wp setWaypointType "LOITER";
_wp setWaypointCombatMode "BLUE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointLoiterRadius 100;

//_grpVeh doTarget getpos _destMrker;
//_grpVeh lockCameraTo [getpos _destMrker, [0]];

true;