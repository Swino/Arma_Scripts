//Set time to specific times
_daysSkip = _this select 0;
_hour = _this select 1;
_minute = _this select 2;

//hint format ["Skip - %1 - Hour %2 - Min - %3", _daysSkip, _hour, _minute];

_currDate = date;
_year = _currDate select 0;
_month = _currDate select 1;
_day = _currDate select 2;
setDate [_year, _month, _day + _daysSkip, _hour, _minute];
exit;