/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_button"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
MarXetRequestedItems = [];
{
	(_display displayCtrl _x) ctrlEnable true;
}
forEach [22152, 22153, 22154, 22156, 22158, 22159, 22018];
(_display displayCtrl 22019) ctrlEnable true;
(_display displayCtrl 22020) ctrlEnable true;
(_display displayCtrl 22025) ctrlEnable true;
(_display displayCtrl 22018) ctrlShow false;
true call ExileClient_marxet_gui_toggleSideBar;
[(_display displayCtrl 22013)] call ExileClient_marxet_gui_onPanelSwitch;
(_display displayCtrl 22002) ctrlSetText "TRADE: VIEW MY REQUESTS";
_button = _display displayCtrl 22159;
_button ctrlSetText "Create";
_button ctrlRemoveAllEventHandlers "ButtonClick";
_button ctrlAddEventHandler ["ButtonClick", "call ExileClient_marxet_gui_tradeCreate_onCreatebuttonClick"];
_button ctrlEnable false;