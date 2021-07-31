
private ["_trigArea", "_side","_dest"];

if (!isServer) exitWith {};
// Validate parameter count
//[hill_area, east, getMarkerPos "Base_Area_611"] execVM "functions\fnc_retreat.sqf";
if ((count _this) < 2) exitWith {debugLog "Log: [fnc_retreat] Function requires 3 parameters!"; []};

_trigArea = _this select 0;
_side = _this select 1;
_dest = _this select 2;

_position = _dest;

{
	if (side _x == _side) then
	{
		private _unit = _x;
		_animHandle = _unit getVariable ["BIS_EhAnimDone", -1];
		{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET","PATH"];
		_unit setUnitPos "UP";
		detach _unit;
		//unlock the unit from it's ambient animation
		_unit removeEventHandler ["AnimDone",_animHandle];
		_unit playMoveNow "AmovPercMstpSrasWrflDnon";
		unassignVehicle _unit;
		doGetOut _unit;
		_unit leaveVehicle vehicle _unit;
		[_unit] allowGetIn false;
		group _unit setCombatMode "GREEN";
		group _unit setBehaviour "AWARE";
		if (leader group _unit == _unit ) then
		{
			_group = group _unit;
			// Delete all previous waypoints
			while {count waypoints _group > 0} do
			{
				deleteWaypoint ((waypoints _group) select 0);
			};
			// Create waypoint
			private _moveWaypoint = _group addWaypoint [_position, 0];
			// Set waypoint properties
			_moveWaypoint setWaypointType "MOVE";
			_moveWaypoint setWaypointSpeed "FULL";
			_moveWaypoint setWaypointBehaviour "AWARE";
			_moveWaypoint setWaypointCombatMode "GREEN";
		};
		_unit doMove _position;
	};
} forEach list _trigArea;

true;