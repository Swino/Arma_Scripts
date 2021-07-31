private ["_goggleBool"];

_goggleBool = false;

//Check if the player has goggles on
if ((goggles player) == "G_Goggles_VR") then {
	_goggleBool = true;
	{
		//Hide all Independent soldiers as they are the "ghosts"
		if ((side _x) == independent) then
		{
			_x hideObject false;
		};
	} forEach allUnits;
}
else {
	_goggleBool = false;
};
//returns true or false
//player sidechat format ["Returning %1", _goggleBool];
_goggleBool;