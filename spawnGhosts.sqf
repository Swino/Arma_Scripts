/*
	File: spawnGhosts.sqf
	Author: DasJayYa

	Description:
	Group will spawn and hunt player with fancy effects

	Parameter(s):
	_this select 0: Pos - Spawn Position - Marker or Coordinates
	_this select 1: side - Units side
	_this select 2: Group - Units to spawn
	_this select 3: Group - Group name of the player group to stalk
	_this select 4: Int - Type of spawn. 1 for Hunt Players, any other number for Patrol Current Pos
	_this select 5: Int - Spawn Effect. 1 For Teleport effect, any other number no effect and silent

grpPlayers
	e.g. [getmarkerPos "spawn1", East, ["O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F","O_Soldier_VR_F"], grpPlayers,1,1] call spawnGhosts;
	Returns:
	group - Group ID
*/

private ["_spawnMrker","_side","_groupUnits","_groupStalk","_leaderGrp","_grp","_type","_effect","_dest","_stealthDaMode"];

if (!isServer) exitWith {};

_spawnMrker = _this select 0;
_side = _this select 1;
_groupUnits = _this select 2;
_groupStalk = _this select 3;
_type = _this select 4;
_effect = _this select 5;
_dest = _this select 6;
_stealthDaMode = _this select 7;

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

_leaderGrp = leader _grp;
_leaderGrp addBackpack "G_FieldPack_LAT2";
_leaderGrp addItemToBackpack "MRAWS_HEAT_F";
_leaderGrp addWeapon "launch_MRAWS_olive_rail_F";

switch (_stealthDaMode) do
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