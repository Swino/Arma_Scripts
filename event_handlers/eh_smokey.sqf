hint "Throw smoke to signal the Hill has been Seized...";

player addItemToBackpack "vn_m18_yellow_mag";

player addEventHandler ["Fired", { 
 params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
 	//hint format ["%1", _magazine]; 
	_smokes = ["vn_m18_purple_mag", "vn_m18_red_mag", "vn_m18_yellow_mag", "vn_m18_white_mag", "vn_m18_green_mag"];
	if (_magazine in _smokes) then {
		//hint format ["Smoke %1", _magazine]; 
		iLikeMyHillNonSmoking = true;
		publicVariable "iLikeMyHillNonSmoking";
	} else {
		//hint format ["No Smoke %1", _magazine]; 
	};
}];

true;