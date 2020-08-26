/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_dropdown","_index","_containerType","_containerNetID"];
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (ExileClientIsWaitingForServerTradeResponse) exitWith
{
	["WarningTitleAndText", ["Please Wait...", "Request creation in progress"]] call ExileClient_gui_toaster_addTemplateToast;
};
if (MarXetTradingItem isEqualTo [] || MarXetRequestedItems isEqualTo []) exitWith {};
_dropdown = _display displayCtrl 22019;
_index = lbCurSel _dropdown;
_containerType = _dropdown lbValue _index;
_containerNetID = "";
if (_containerType isEqualTo 5) then
{
	_containerNetID = _dropdown lbData _index;
};
ExileClientIsWaitingForServerTradeResponse = true;
["createTradeRequest", [MarXetTradingItem, MarXetRequestedItems, cbChecked (_display displayCtrl 22157), _containerType, _containerNetID]] call ExileClient_system_network_send;
