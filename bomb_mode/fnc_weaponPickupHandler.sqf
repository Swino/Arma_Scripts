/**
[player,"SNIPER","PRI"] call weaponPickupHnd;
**/

//Function Parameters
private _playerUnit = param [0, objNull];
private _weapon = param [1, ""];
private _secondary = param [2, "PRIM"];

_debug = missionNamespace getVariable ["debugMode", false];

if (_debug) then {
	["Weapon Pickup Handler Triggered"] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	["###################################################"] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	_msg = format ["Weapon to spawn = %1", _weapon];
	[_msg] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	_msg = format ["Secondary = %1", _secondary];
	[_msg] remoteExec ["diag_log",[0,-2] select isDedicated,false];
	["###################################################"] remoteExec ["diag_log",[0,-2] select isDedicated,false];
};

switch (_secondary) do
{
	case "BACK":
	{
		private _oldSecMags = [];
		// Remove Old Secondary Weapon
	};
	case "SEC":
	{
		private _oldSecMags = [];
		_oldMags = handgunMagazine _playerUnit;
		{
			_playerUnit removeMagazines _x;
		} forEach _oldMags;

		_playerUnit removeWeapon (handgunWeapon _playerUnit);
	};
	default
	{
		private _oldMags = [];
		// Remove Old Primary Weapon
		_oldMags = primaryWeaponMagazine _playerUnit;
		{
			_playerUnit removeMagazines _x;
		} forEach _oldMags;

		_playerUnit removeWeapon (primaryWeapon _playerUnit);
	};
};

// Add picked up Weapon
switch (_weapon) do
{
	case "BR":
	{
		for "_i" from 1 to 6 do {_playerUnit addMagazine "OPTRE_36Rnd_95x40_Mag";};
		_playerUnit addWeapon "OPTRE_BR55HB";
		_playerUnit addPrimaryWeaponItem "OPTRE_M7_Sight";
		_playerUnit selectWeapon "OPTRE_BR55HB";
	};
	case "DMR":
	{
		for "_i" from 1 to 5 do {_playerUnit addMagazine "OPTRE_15Rnd_762x51_Mag";};
		_playerUnit addWeapon "OPTRE_M393_DMR";
		_playerUnit addPrimaryWeaponItem "OPTRE_M393_Scope";
		_playerUnit selectWeapon "OPTRE_M393_DMR";
	};
	case "SHOTGUN":
	{
		for "_i" from 1 to 6 do {_playerUnit addMagazine "OPTRE_12Rnd_8Gauge_Pellets";};
		_playerUnit addWeapon "OPTRE_M45E";
		_playerUnit addPrimaryWeaponItem "OPTRE_M45_Flashlight";
		_playerUnit selectWeapon "OPTRE_M45E";
	};
	case "MG":
	{
		for "_i" from 1 to 4 do {_playerUnit addMagazine "OPTRE_100Rnd_95x40_Box";};
		_playerUnit addWeapon "OPTRE_M73";
		_playerUnit addPrimaryWeaponItem "OPTRE_M7_Sight";
		_playerUnit selectWeapon "OPTRE_M73";
	};
	case "ROCKET":
	{
		_playerUnit addBackpack "OPTRE_UNSC_Rucksack_Heavy";
		for "_i" from 1 to 2 do {_playerUnit addItemToBackpack "OPTRE_M41_Twin_HEAT";};
		_playerUnit addWeapon "OPTRE_M41_SSR";
		removeBackpack _playerUnit;
		for "_i" from 1 to 2 do {_playerUnit addItemToVest "OPTRE_M41_Twin_HEAT";};
	};
	case "SNIPER":
	{
		for "_i" from 1 to 4 do {_playerUnit addMagazine "OPTRE_4Rnd_145x114_APFSDS_Mag";};
		_playerUnit addWeapon "OPTRE_SRS99C";
		_playerUnit addPrimaryWeaponItem "OPTRE_SRS99C_Scope";
		_playerUnit selectWeapon "OPTRE_SRS99C";
	};
	case "PISTOL":
	{
		for "_i" from 1 to 4 do {_playerUnit addMagazine "OPTRE_60Rnd_5x23mm_Mag";};
		_playerUnit addWeapon "OPTRE_M7_Folded";
		_playerUnit addHandgunItem "OPTRE_M7_Laser";
	};
	default
	{
		"fnc_weaponPickupHandler.sqf: Weapon Listing landed on default..." call BIS_fnc_error;
	};

private _pWeapNew = primaryWeapon _playerUnit;
_playerUnit selectWeapon _pWeapNew;

};