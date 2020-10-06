/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/

private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
MarXetEntryEndTime = -1;
call ExileClient_marxet_gui_auctionMine_updateListingListbox;
