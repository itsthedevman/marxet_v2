/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
{
	(_display displayCtrl _x) ctrlShow false;
}
forEach [22502,22503,22506,22507,22508,22509,22510,22511,22504,22505];
MarXetAuctionTimeThread = [0.5, ExileClient_marxet_gui_auctionMine_thread_updateTimeLeft, [], true] call ExileClient_system_thread_addTask;