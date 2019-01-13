//_nul = [getmarkerpos "alphaSpawn1"] execVM "spawnEffects.sqf";
private ["_spawnMrker","_light1","_ele","_raza","_halo","_ref"];

_spawnMrker = _this select 0;

_light1 = "#lightpoint" createVehicle _spawnMrker;
_light1 setLightBrightness 1;
_light1 setLightColor [1,0,0];
_light1 setLightAttenuation [5,0,15,0,51,15];

_ele = "#particlesource" createVehicleLocal _spawnMrker;
_ele setParticleCircle [0, [0, 0, 0]];
_ele setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ele setParticleParams [["\A3\data_f\blesk1", 1, 0, 1], "", "SpaceObject", 1, 0.5, [0, 0, 0], [0, 0, 0.75], 0.3, 10, 7.9, 0.075, [0.1, 0.1, 0.1], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _spawnMrker];
_ele setDropInterval 0.05;

// raza
_raza = "#particlesource" createVehicleLocal _spawnMrker;
_raza setParticleCircle [1, [0, 0, 0]];
_raza setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_raza setParticleParams [["\A3\data_f\kouleSvetlo", 1, 0, 1], "", "Billboard", 1, 1, [0, 0, 0], [0, 0, 17], 0, 9, 9, 0, [5, 5, 5], [[1, 0.1, 0.1, 1], [1, 0.25, 0.25, 1], [1, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _spawnMrker];
_raza setDropInterval 0.002;

// halo
_halo = "#particlesource" createVehicleLocal _spawnMrker;
_halo setParticleCircle [2, [0, 0, 0]];
_halo setParticleRandom [1, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_halo setParticleParams [["\A3\data_f\laserBeam", 1, 0, 1], "", "SpaceObject", 1, 1, [0, 0, 0], [0, 0, 11], 3, 10, 7.9, 0, [1, 1, 1], [[1, 1, 1, 1], [1, 1, 1, 1], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _spawnMrker];
_halo setDropInterval 0.01;

//wobbly
_ref = "#particlesource" createVehicleLocal _spawnMrker;
_ref setParticleCircle [20, [0, 0, 0]];
_ref setParticleRandom [60, [0.25, 0.25, 0], [0, 0, 0], 5, 0.25, [0, 0, 0, 0.5], 0, 0];
_ref setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0], 2, 9.7, 7.9, 0, [20, 20, 20], [[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _spawnMrker];
_ref setDropInterval 0.5;

sleep 2;

deleteVehicle _ele;
deleteVehicle _raza;
deleteVehicle _halo;
deleteVehicle _ref;
deleteVehicle _light1;

true;