//Function Parameters
private _plr = param [0, ""];
private _playerSide = "";

_debug = missionNamespace getVariable ["debugMode", false];

_plr setVariable ["bombCarrier", true, true];
_playerSide = side group _plr;

daBomb setVariable ["pickedUp", true, true];

missionNamespace setVariable ["bombCarrierUnit", _caller, true];

switch (_playerSide) do
{
	case west:
	{
		missionNamespace setVariable ["carrierSide", west, true];
	};

	case east:
	{
		missionNamespace setVariable ["carrierSide", east, true];
	};

	default
	{
		"fnc_bombPickupHandler.sqf: Side landed on default???" call BIS_fnc_error;
	};
};

//Give Player Backpack to show bomb carrier
//removeBackpack player;
//player addBackpack "OPTRE_Fury_Backpack_Nuke";

if (_debug) then {
	["Bomb Pickup Handler Triggered"] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	["###################################################"] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	_msg = format ["Player Carrier = %1", _plr];
	[_msg] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	_msg = format ["Bomb Mode = %1", daBomb getVariable ["pickedUp", false]];
	[_msg] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	_msg = format ["Carrier Unit = %1", missionNamespace getVariable ["bombCarrierUnit", objNull]];
	[_msg] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	_msg = format ["Carrier Side = %1", missionNamespace getVariable ["carrierSide", sideUnknown]];
	[_msg] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	["###################################################"] remoteExec ["diag_log",[0,-2] select isDedicated,false];
};

true;