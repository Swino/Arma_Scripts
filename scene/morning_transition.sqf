enableradio false;
player allowdamage false;
camUseNVG false;

10 fadesound 0.2;
cutText ["","BLACK OUT", 3];

0 fadeMusic 1;
//playmusic "vn_prayer_for_the_fallen";

sleep 4;

timeJumpMorning = true;
publicVariable "timeJumpMorning";

sleep 1;

_camera = "camera" camcreate [10456.1,10365.3,79.5608];
_camera cameraeffect ["internal", "back"];

_camera camPrepareTarget [12099.5,9735.52,155.328];
_camera camPreparePos [10456.1,10365.3,79.5608];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

[getMarkerPos "ambient_heli_01", getMarkerPos "ambient_heli_01_dest", 60, "NORMAL", "vn_b_air_uh1d_01_01",west] call BIS_fnc_ambientFlyby;
[getMarkerPos "ambient_heli_02", getMarkerPos "ambient_heli_02_dest", 60, "NORMAL", "vn_b_air_uh1d_01_01",west] call BIS_fnc_ambientFlyby;

cutText ["","BLACK IN", 3];

sleep 35;

30 fadesound 1;

sleep 5;

player cameraEffect ["terminate","back"];
camDestroy _camera;

[] call VN_MS_fnc_sfx_wakeUp;
cutText ["","BLACK IN", 2];

enableradio true;
player allowdamage true;

morningHasCome = true;
publicVariable "morningHasCome";

setTimeMultiplier 1;

sleep 20;

[getMarkerPos "ambient_heli_04", getMarkerPos "ambient_heli_04_dest", 120, "NORMAL", "vn_b_air_f4b_usmc_hcas",west] call BIS_fnc_ambientFlyby;

sleep 5;

[getMarkerPos "ambient_heli_04", getMarkerPos "ambient_heli_04_dest", 120, "NORMAL", "vn_b_air_f4b_usmc_hcas",west] call BIS_fnc_ambientFlyby;

exit;