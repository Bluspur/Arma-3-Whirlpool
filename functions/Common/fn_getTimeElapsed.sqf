_startTime = _this select 0;
_currentTime = dayTime;
_deltaTime = 0;

_deltaTime = _currentTime - _startTime;
//Remove Days
_hours = floor _deltaTime;
_minutes = floor ((_deltaTime - _hours) * 60);
_minutes;