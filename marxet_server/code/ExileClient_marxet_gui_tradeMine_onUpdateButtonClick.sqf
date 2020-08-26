/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (ExileClientIsWaitingForServerTradeResponse) exitWith
{
	["WarningTitleAndText", ["Please Wait...", "Editing request in progress"]] call ExileClient_gui_toaster_addTemplateToast;
};
if (MarXetTradingItem isEqualTo "" || MarXetRequestedItems isEqualTo []) exitWith {};
ExileClientIsWaitingForServerTradeResponse = true;
["editTradeRequest", [MarXetTradingItem, MarXetRequestedItems, cbChecked (_display displayCtrl 22157)]] call ExileClient_system_network_send;
["InfoTitleAndText", ["Please Wait...", "Updating your trade request"]] call ExileClient_gui_toaster_addTemplateToast;
{
	(_display displayCtrl _x) ctrlEnable false;
}
forEach [22152, 22153, 22154, 22156, 22158, 22159, 22018];
