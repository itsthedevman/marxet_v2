/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
(_display displayCtrl 22102) ctrlSetStructuredText parseText "<t align='center' size='1.2'>Please select an Item</t>";
call ExileClient_marxet_gui_tradeView_updateSortingDropdown;
call ExileClient_marxet_gui_tradeView_updateListingListbox;
MarXetUpdatePending = false;
MarXetCurrentSelectedID = "";
MarXetSelectedIndex = -1;
MarXetUpdateThread = [0.5, ExileClient_marxet_gui_tradeView_thread_update, [], true] call ExileClient_system_thread_addTask;
