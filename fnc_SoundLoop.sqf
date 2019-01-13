/*
	File: spawnGhosts.sqf
	Author: DasJayYa

	Description:
	Group will spawn and hunt player with fancy effects
	soundLoop = = compile preprocessFileLineNumbers "functions\fnc_SoundLoop.sqf";

	Parameter(s):
	_this select 0: obj - The object that makes sound
	_this select 1: String - sound name in Decription file
	_this select 2: int - seconds until loop resets

	e.g. [objRadio,"song",50] call soundLoop;
*/

private ["_object","_sound","_duration"];

_object = _this select 0;
_sound = _this select 1;
_duration = _this select 2;

while {alive _object} do {
	[[_object,_sound], "say3d",true] call BIS_fnc_MP;
    sleep _duration;
};

true;