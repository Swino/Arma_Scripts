private _spawnPos = param [0, []];
private _landPos = param [1, []];
private _supportType = param [2, "EXIT"];
private _exitPos = param [3, []];
private _groupUnits = param [4, []];
private _groupObjective = param [5, "ATTACK"];

//_landPos = getMarkerPos "dest5";  // Where you want them to land.
//_spawnPos = getPosATL heliSpawn2;  // Where they spawnfrom.
//[getPosATL heliSpawn2, getMarkerPos "dest5", "CAS", "", (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfAssault"), getMarkerPos "zulu1"] execVM "functions\spawnSquad.sqf";

// Spawn invis helipad to land on.
_helipad = createVehicle ["Land_HeliPadEmpty_F", _landPos, [], 0, "NONE"];

// Spawn helicopter and crew.
_helisv = [_spawnPos, 180, "B_Heli_Transport_01_F", WEST] call BIS_fnc_spawnVehicle;
_heli = _helisv select 0;
_heliCrew = _helisv select 1;
_heliGroup = _helisv select 2;

// Spawn reinforcements and get them in the helicopter.
_reinforcements = [_spawnPos, blufor, _groupUnits] call BIS_fnc_spawnGroup;
{_x assignAsCargo _heli; _x moveInCargo _heli;} forEach units _reinforcements;

// Stuffs
{_x allowFleeing 0} forEach units _reinforcements;

// Waypoint to the location
_wp1 = _heliGroup addWaypoint [_landPos, 0];
_wp1 setWaypointSpeed "NORMAL";
_wp1 setWaypointType "TR UNLOAD";
_wp1 setWaypointBehaviour "CARELESS";

// Wait till we're out.
waitUntil{sleep 1; {_x in _heli} count units _reinforcements == 0};

sleep 5;

// Release heli from being landed and clean up.
_heli flyInHeight 50;
deleteVehicle _helipad;

[_reinforcements, _groupObjective] call BIS_fnc_taskAttack;

switch (_supportType) do
{
	case "CAS":
	{
		_wp2 = _heliGroup addWaypoint [_landPos, 0];
		_wp2 setWaypointSpeed "NORMAL";
		_wp2 setWaypointType "LOITER";
		_wp2 setWaypointBehaviour "AWARE";
	};

	default
	{
		_wp2 = _heliGroup addWaypoint [_exitPos, 0];
		_wp2 setWaypointSpeed "FULL";
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew (vehicle this) + [vehicle this];"];
	};
};

true;