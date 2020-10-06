/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_isEnd"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
(_display displayCtrl 22508) ctrlSetStructuredText parseText format["<t align='center' size='0.8'>%1</t>", (call ExileClient_marxet_util_time_format)];
_isEnd = ([] call ExileClient_marxet_util_time_sync) <= 0;
if (_isEnd) then 
{
	{
		(_display displayCtrl _x) ctrlShow false;
	}
	forEach [22503,22506,22507,22508,22509,22510,22511,22504,22505];
	[] call ExileClient_marxet_gui_auctionMine_updateListingListbox;
};