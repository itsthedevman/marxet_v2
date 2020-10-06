/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/


private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
MarXetTradingItem = [];
MarXetEntryEndTime = -1;
(_display displayCtrl 22441) ctrlEnable false;
