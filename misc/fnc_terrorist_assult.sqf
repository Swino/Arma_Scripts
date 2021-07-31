/** 
This function is called when the number of terrorists drops below a threashold.

They will move and attack the player so its less of a hunt for stuck or stationary units

_nul = [] execVM "functions\fnc_terrorist_assult.sqf";
**/

{
   if ((side _x) == east) then
   {
	   	_nested = _x;
	   	// Remove any movment restrictions
		_animHandle = _nested getVariable ["BIS_EhAnimDone", -1];
	   	{_nested enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET","PATH"];
	   	_nested removeEventHandler ["AnimDone",_animHandle];
		_nested playMoveNow "AmovPercMstpSrasWrflDnon";
		unassignVehicle _nested;
		doGetOut _nested;
		_nested leaveVehicle vehicle _nested;
		[_nested] allowGetIn false;
		_nested setUnitPos "AUTO";
		detach _nested;
		group _nested setBehaviour "COMBAT";

	   	// Stalk Players
	   	_stalking = [group _x, grpPlayers] spawn BIS_fnc_stalk;
   };
} forEach allUnits;

exit;