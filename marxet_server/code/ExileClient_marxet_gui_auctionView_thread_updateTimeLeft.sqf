/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_isEnd"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
(_display displayCtrl 22334) ctrlSetStructuredText parseText (call ExileClient_marxet_util_time_format);
_isEnd = ([] call ExileClient_marxet_util_time_sync) <= 0;
if (_isEnd) then 
{
	{
		(_display displayCtrl _x) ctrlShow false;
	}
	forEach [22333,22334,22335,22336,22337];
};