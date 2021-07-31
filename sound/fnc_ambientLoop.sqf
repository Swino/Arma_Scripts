/*
	File: fnc_SoundLoop.sqf
	Author: DasJayYa

	Description:
	Object will play a sound and loop unless object is destroyed / deleted

	Parameter(s):
	_this select 0: obj - The object that makes sound
	_this select 1: String - sound name and folder in mission dir
	_this select 2: int - seconds until loop resets
	_this select 3: Boolean - Is indoors True or False
	_this select 4: int - Volume of the sound
	_this select 5: int - Distance of the sound

	e.g. _nil = [objRadio,"song",50,1,false] execVM "fnc_SoundLoop.sqf";
	_nul = [offSoundSrc2, "sounds\station.ogg",100,true,10,10] execVM "functions\fnc_ambientLoop.sqf"
*/

private ["_object","_sound","_duration","_vol","_indoors","_dis"];

_object = _this select 0;
_sound = _this select 1;
_duration = _this select 2;
_indoors = _this select 3;
_vol = _this select 4;
_dis = _this select 5;

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + _sound;

while {alive _object} do
{
	playSound3D [_soundToPlay, _object, _indoors, getPosASL _object, _vol, 1, _dis];

	sleep _duration;
};

true;