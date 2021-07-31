/*
	File: fnc_bullet.sqf
	Author: DasJayYa

	Description:
	Spawn Bullet

	Parameter(s):
*/

if (!isServer) exitWith {};

params ["_unit"];

_bullet = createVehicle ["SomeKindOfBullet",(_unit modelToWorldVisual [1,0,1]),[],0,"NONE"];
_vector = vectorNormalized ((getPosATL _bullet) vectorFromTo (_unit modelToWorldVisual (_unit selectionPosition "head")));
_bullet setVelocity (_vector vectorMultiply 500);
