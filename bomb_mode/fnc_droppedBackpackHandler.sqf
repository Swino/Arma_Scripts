// Function runs on Droped Inventory
// If item is Backpack Nuke, do something
// _putEH = player addEventHandler ["Put", {_this call droppedBackpack}];
_unit = _this select 0;
_container = _this select 1;
_item = _this select 2;

_blackListItem = "OPTRE_Fury_Backpack_Nuke";

_debug = missionNamespace getVariable ["debugMode", false];

if (_debug) then {
	systemChat format ["Unit: %1, Container: %2, Item: %3", _unit, _container, _item];
};

if (_item == _blackListItem) then
{
	//Delete Backpack
	deleteVehicle _item; // Not an object so.. does not work :(
};

true;