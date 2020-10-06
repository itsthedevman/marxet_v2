/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_endSeconds", "_days", "_hours", "_minutes", "_seconds", "_text"];
_endSeconds = [] call ExileClient_marxet_util_time_sync;
_days = floor(_endSeconds / 60 / 60 / 24);
_hours = floor((_endSeconds / 60 / 60) % 24);
_minutes = floor((_endSeconds / 60) % 60);
_seconds = floor(_endSeconds % 60);
_text = "";
if !((_days + _hours + _minutes + _seconds) isEqualTo 0) then
{
	_text = format["<t>%1d, %2h, %3m, %4s</t>", _days, _hours, _minutes, _seconds];
}
else
{
	_text = "<t>0d, 0h, 0m, 0s</t>";
};
_text