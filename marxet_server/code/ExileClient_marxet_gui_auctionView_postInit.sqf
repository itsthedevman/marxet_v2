/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
false call ExileClient_marxet_gui_auctionView_toggleItemInfo;
MarXetAuctionTimeThread = [0.5, ExileClient_marxet_gui_auctionView_thread_updateTimeLeft, [], true] call ExileClient_system_thread_addTask;