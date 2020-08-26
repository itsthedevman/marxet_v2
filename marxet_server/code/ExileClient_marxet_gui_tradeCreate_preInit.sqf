/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
MarXetRequestedItems = [];
MarXetTradingItem = [];
call ExileClient_marxet_gui_tradeCreate_updateSortingDropdown;
lbClear (_display displayCtrl 22156);
(_display displayCtrl 22157) cbSetChecked false;
