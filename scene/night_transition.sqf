enableradio false;

player allowdamage false;

10 fadesound 0.2;
cutText ["","BLACK OUT", 3];

0 fadeMusic 1;
playmusic "vn_calm_before_the_storm";

sleep 4;

_camera = "camera" camcreate [10574.2,10562.9,53.6674];
_camera cameraeffect ["internal", "back"];

_camera camPrepareTarget [9646.73,9785.78,343.022];
_camera camPreparePos [10574.2,10562.9,53.6674];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

cutText ["","BLACK IN", 3];

sleep 35;

10 fadesound 1;

sleep 5;

player cameraEffect ["terminate","back"];
camDestroy _camera;

cutText ["","BLACK IN", 2];

enableradio true;
player allowdamage true;

nightTimeBattle = true;
publicVariable "nightTimeBattle";

sleep 40 + random 20;

playsound "EXP_m04_flare";
sleep 1.5;
[(getPos flare_01) vectorAdd [0,0,70], 2] call vn_ms_fnc_createFlare;

exit;