/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_endYear","_endMonth","_endDay","_endHours","_endMinute","_endSeconds","_currentYear","_currentMonth","_currentDay","_currentHours","_currentMinute","_currentSeconds","_yearDiff","_monthDiff","_dayDiff","_hourDiff","_minuteDiff","_secondDiff","_minutes","_seconds"];
_this params ["_endYear","_endMonth","_endDay","_endHours","_endMinute","_endSeconds"];
(call ExileServer_util_time_currentTime) params ["_currentYear","_currentMonth","_currentDay","_currentHours","_currentMinute","_currentSeconds"];
_yearDiff = _endYear - _currentYear;
_monthDiff = _endMonth - _currentMonth;
_dayDiff = _endDay - _currentDay;
_hourDiff = _endHours - _currentHours;
_minuteDiff = _endMinute - _currentMinute;
_secondDiff = _endSeconds - _currentSeconds;
_yearDiff = _yearDiff * 525600;
_monthDiff = _monthDiff * 43829;
_dayDiff = _dayDiff * 1440;
_hourDiff = _hourDiff * 60;
_minutes = _yearDiff + _monthDiff + _dayDiff + _hourDiff + _minuteDiff;
_seconds = (_minutes * 60) + _secondDiff;
_seconds = _seconds + parseNumber("extDB3" callExtension "9:UPTIME:SECONDS");
_seconds
