//Parameters
private ["_position"];

_position = _this select 0;

_light = "#lightpoint" createvehiclelocal _position;
_light setposatl [_position select 0,_position select 1,(_position select 2) + 10];
_light setLightDayLight true;
_light setLightBrightness 300;
_light setLightAmbient [0.05, 0.05, 0.1];
_light setlightcolor [1, 1, 2];

sleep 0.1;
_light setLightBrightness 0;
sleep (random 0.1);

_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;

_lightning = _class createvehiclelocal [100,100,100];
_lightning setdir random 360;
_lightning setpos _position;

_thunder = ["thunder_1", "thunder_2","bl_hit1","bl_hit2","bl_hit3"] call BIS_fnc_selectRandom;
//Play thunder sound
playSound _thunder;

_duration = (1 + random 3);

for "_i" from 0 to _duration do {
	_time = time + 0.1;
	_light setLightBrightness (100 + random 100);
	time > _time;
};

deletevehicle _lightning;
deletevehicle _light;

true;