/**
0 = [0.95, 100, position generator] execVM "functions\lights.sqf"; - cut the lights 100m around object named "generator"
0 = [0, 500, position lightswitch] execVM "functions\lights.sqf"; - restore the lights 500m around object named "lightswitch"
0 = [0.95, 1000, getMarkerPos "townMarker"] execVM "functions\lights.sqf"; - cut lights 1000m around marker named "townmarker"
0 = [0, 250, getMarkerPos "powerplant"] execVM "functions\lights.sqf"; - restore lights 250m around marker named "powerplant"
**/

private ["_onoff", "_distance", "_marker", "_types", "_lamps"];

if (!isServer) exitWith {};

_onoff = [_this, 0, 0.95, [0]] call BIS_fnc_param;
_distance = [_this, 1, 1000, [0]] call BIS_fnc_param;
_marker = [_this, 2, getMarkerPos "lightsmarker", ["",[],objNull]] call BIS_fnc_param;

_types = [
	"Lamps_Base_F",
	"PowerLines_base_F",
	"Land_LampDecor_F",
	"Land_LampHalogen_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_NavigLight",
	"Land_runway_edgelight",
	"Land_PowerPoleWooden_L_F",
	"Land_LampIndustrial_01_off_F",
	"Land_LampIndustrial_02_off_F",
	"Land_LampStreet_02_double_off_F",
	"Land_LampStreet_02_amplion_off_F",
	"Land_LampStreet_02_triple_off_F",
	"Land_LampStreet_02_off_F",
	"Land_PowerLine_02_pole_small_lamp_off_F"
];

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
   _lamps = _marker nearObjects [_types select _i, _distance];
   sleep 0.1;
   {_x setDamage _onoff} forEach _lamps;
};