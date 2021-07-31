// [] call fnc_radio_handler;
// Returns Array of Units with backpacks
// Create a GLobal Array of Units with Radio Backpacks
_radio_backpacks = ["vn_b_pack_03", "vn_b_pack_03_02", "vn_b_pack_03_02_type56_pl", "vn_b_pack_03_02_xm177_pl", "vn_b_pack_03_xm177_pl", "vn_b_pack_03_m3a1_pl", "vn_b_pack_trp_04_02_m16_pl","vn_b_pack_lw_06_m16_pl", "vn_b_pack_lw_06", "vn_b_pack_prc77_01", "vn_b_pack_trp_04_02"];
_radio_vehicles = ["vn_b_boat_05_01", "vn_b_wheeled_m54_03", "vn_b_wheeled_m151_01", "vn_b_wheeled_m54_02", "vn_b_wheeled_m54_01", "vn_b_wheeled_m54_mg_02", "vn_i_air_ch34_02_01", "vn_i_air_ch34_01_02", "vn_i_air_ch34_02_02"];
_units_radios = [];

// loop through each unit and check backpack.
{
	_unitPack = backpack _x;
	//player sidechat format ["Backpack - %1", _unitPack];
	if (debug_mode) then {diag_log format ["Backpack - %1", _unitPack];};
	if (_unitPack in _radio_backpacks) then {
		// Unit has radio, add action
		if (debug_mode) then {diag_log format ["Adding Action to - %1", name _x];};
		_units_radios pushBack _x;		
	};
	
} forEach units grpPlayers;

missionNamespace setVariable ["squad_radios", _units_radios, true];

_units_radios;