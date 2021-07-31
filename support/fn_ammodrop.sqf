//[ammo_chopper, ammo_crate_01, ammo_crate_02] execVM "functions\fn_ammodrop.sqf";
if (!isServer) exitWith {};

private _heli = param [0, []];
private _ammoCrate_1 = param [1, []];
private _ammoCrate_2 = param [2, []];

detach _ammoCrate_1;
detach _ammoCrate_2;

_ammoCrate_1 setPos [(getPos _heli select 0) - 3, (getPos _heli select 1) + 2, (getPos _heli select 2) +0.5];
_ammoCrate_1 setVelocity [0, 2, -1];
_ammoCrate_1 enableSimulationGlobal true;
_ammoCrate_1 enableDynamicSimulation false;
_ammoCrate_1 allowDamage false;

_ammoCrate_2 setPos [(getPos _heli select 0) - 3, (getPos _heli select 1) - 3, (getPos _heli select 2) +0.5];
_ammoCrate_2 setVelocity [0, 2, -1];
_ammoCrate_2 enableSimulationGlobal true;
_ammoCrate_2 enableDynamicSimulation false;
_ammoCrate_2 allowDamage false;

private _smoke = "SmokeShellRed" createVehicle [0,0,0];
_smoke attachTo [_ammoCrate_1, [0, 0, 0]];
sleep 1.5;
detach _smoke;

private _markerName = format ["%1", _ammoCrate_1]; 
private _marker1 = createMarker [_markerName, position _smoke];
_marker1 setMarkerType "hd_destroy";
_marker1 setMarkerColor "ColorBlue";
_marker1 setMarkerText "Ammo Drop";

true;


[] spawn {
	_mortar = mortar1;
	_mortarGunner = mortar1G;
	_radius = 250;

	while {alive _mortarGunner} do {
		_center2 = markerpos "BIS_village";
		_radius2 = 250;

		_pos2 = [
			(_center2 select 0) - _radius + (2 * random _radius),
			(_center2 select 1) - _radius + (2 * random _radius),
			0
		];

		// Fire
		_mortar commandArtilleryFire [
			_pos2,
			getArtilleryAmmo [_mortar] select 0,
			1
		];

		_mortar setVehicleAmmo 1;

		sleep 10 + random 10;

	};
};

[] spawn {
	_mortar = mortar2;
	_mortarGunner = mortar2G;
	_radius = 250;

	while {alive _mortarGunner} do {
		_center2 = markerpos "BIS_village";
		_radius2 = 250;

		_pos2 = [
			(_center2 select 0) - _radius + (2 * random _radius),
			(_center2 select 1) - _radius + (2 * random _radius),
			0
		];

		// Fire
		_mortar commandArtilleryFire [
			_pos2,
			getArtilleryAmmo [_mortar] select 0,
			1
		];

		_mortar setVehicleAmmo 1;

		sleep 10 + random 10;

	};
};
