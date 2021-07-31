/*
	File: fnc_SoundLoop.sqf
	Author: DasJayYa

	Description:
	Object will play a sound and loop unless object is destroyed / deleted

	Parameter(s):
	_this select 0: obj - The object that makes sound
	_this select 1: String - sound name in Decription file
	_this select 2: int - seconds until loop resets

	e.g. _nil = [objRadio,"song",50] execVM "fnc_SoundLoop.sqf";
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