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

private ["_song","_duration"];

_song = _this select 0;
_duration = _this select 1;

while {finalSongPlay} do {
	[_song] remoteExec ['playMusic',[0,-2] select isDedicated,false];
    sleep _duration;
};

true;