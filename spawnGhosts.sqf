/*
	File: spawnGhosts.sqf
	Author: DasJayYa

	Description:
	Group will spawn and hunt player with fancy effects

	Parameter(s):
	0: Pos - Spawn Position - Marker or Coordinates
	1: side - Units side
	2: Array, Config - Units to spawn
	3: Group - Group name of the players group to stalk / follow
	4: Int - Type of spawn. 1 for Hunt Players, 2 Patrol Current Pos, 3 Attack pos of param 6
	5: Int - Spawn Effect. 1 For Teleport effect, any other number no effect and silent
	6: Pos - Attack Position
	7: String - Combat mode of the group.

grpPlayers
	e.g. [getmarkerPos "spawn1", East, ["O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F"], grpPlayers,1,1,[],""] call spawnGhosts;
	Returns:
	group - Group ID
*/

if (!isServer) exitWith {};

//Function Parameters
private _spawnMrker = param [0, ""];
private _side = param [1, East];
private _groupUnits = param [2, objNull];
private _groupStalk = param [3, objNull];
private _type = param [4, 2];
private _effect = param [5, 1];
private _dest = param [6, []];
private _comMode = param [7, "AWARE"];

//Validation of Params
if (typeName _spawnMrker != "ARRAY") then
{
	"spawnGhosts.sqf: Spawn Destination not Array containing Coordinates." call BIS_fnc_error;
};
if (typeName _side != "SIDE") then
{
	"spawnGhosts.sqf: Spawn SIDE not Valid SIDE" call BIS_fnc_error;
};
if (typeName _groupUnits != "CONFIG" && typeName _groupUnits != "ARRAY") then
{
	"spawnGhosts.sqf: Spawn Units not Valid. Needs to be Config or Array of units" call BIS_fnc_error;
};

//Spawn Effect?
if (_effect == 1) Then {
	[[_spawnMrker],"functions\spawnEffects.sqf"] remoteExec ["BIS_fnc_execVM",0,false];
};

//Spawn Group
_grp = [_spawnMrker, _side, _groupUnits] call BIS_fnc_spawnGroup;
//Set Groups Gear
{
	_x addVest "V_Rangemaster_belt";
	_x addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
	_x addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
	_x addWeapon "arifle_SPAR_01_blk_F";
	_x addeventhandler ["fired", {(_this select 0) setAmmo [currentWeapon (_this select 0), 25]; 1}];
	_x linkItem "NVGogglesB_grn_F";
} forEach units _grp;

_grp allowFleeing 0;

_leaderGrp = leader _grp;
_leaderGrp addBackpack "G_FieldPack_LAT2";
_leaderGrp addItemToBackpack "MRAWS_HEAT_F";
_leaderGrp addWeapon "launch_MRAWS_olive_rail_F";

switch (_comMode) do
{
	case "STEATH":
	{
		_grp setBehaviour "STEALTH";
	};
	case "COMBAT":
	{
		_grp setBehaviour "COMBAT";
	};
	default
	{
		_grp setBehaviour "AWARE";
	};
};

//_grp setBehaviour "COMBAT";
//_grp setCombatMode "RED";

//Sound Effect
if (_effect == 1) Then {
	[[_leaderGrp, "tc_13_teleport"], "Say3d"] spawn BIS_fnc_MP;
};

{
	removeVest _x;
	removeBackpack _x;
} forEach units _grp;

//Type of Spawn? 1 = Hunt, 2 = patrol, 3 = stand there
switch (_type) do {
    case 1: {
    	_stalking = [_grp,_groupStalk] spawn BIS_fnc_stalk;
    };
    case 2: {
    	[_grp, position _leaderGrp, 150] call BIS_fnc_taskPatrol;
    };
    case 3: {
    	[_grp, _dest] call BIS_fnc_taskAttack;
    };
    default {
     	{
			_x setunitpos "up";
		} forEach units _grp;
    };
};

_grp;