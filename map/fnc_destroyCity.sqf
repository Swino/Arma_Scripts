private ["_cityPos","_nearHouses","_percent"];

_cityPos = _this select 0;
_dst = _this select 1;
_percent = _this select 2;

//building damage
_nearHouses =  nearestObjects[_cityPos, ["house"], _dst];
{
    if (round(random 100) <= _percent) then
    {
        _x setDamage 1;
    }
    else
    {
        _x setDamage 0.9;
    };
}foreach _nearHouses;

true;