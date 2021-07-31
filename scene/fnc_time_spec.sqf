// _nul = [300,13.30] execVM "functions\fnc_time_spec.sqf";
// 300x time multipl will await til 1:30pm to return to normal
private _multip = param [0, []];
private _timeWait = param [1, []];

setTimeMultiplier _multip;

waitUntil { daytime >= _timeWait };

setTimeMultiplier 1;