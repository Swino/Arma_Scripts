//Function Parameters
// _nul = [player,desti] execVM "functions\fnc_teleporter.sqf";
private _playerUnit = param [0, objNull];
private _destPos = param [1, []];

cutText ["", "WHITE OUT", 0.1];

sleep 0.2;

_playerUnit setpos getPosATL _destPos;
_playerUnit setDir getDir _destPos;

sleep 0.1;

cutText ["", "WHITE In", 0.1];