/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
MarXetAuctionTimeThread = -1;
MarXetUpdateThread = -1;
MarXetEntryEndTime = -1;
MarXetUpdatePending = false;
MarXetBiddingThead = -1;
call ExileClient_marxet_gui_auctionView_updateSortingDropdown;
call ExileClient_marxet_gui_auctionView_updateListingListbox;
MarXetUpdateThread = [0.5, ExileClient_marxet_gui_auctionView_thread_update, [], true] call ExileClient_system_thread_addTask;
MarXetBiddingThead = [0.5, ExileClient_marxet_gui_auctionView_thread_updateBidding, [], true] call ExileClient_system_thread_addTask;
