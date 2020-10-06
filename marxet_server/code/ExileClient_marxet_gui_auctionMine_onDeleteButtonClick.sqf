/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_listbox", "_data"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (ExileClientIsWaitingForServerTradeResponse) exitWith 
{
	["WarningTitleAndText", ["Please Wait...", "Processing your request"]] call ExileClient_gui_toaster_addTemplateToast;	
};
_listbox = _display displayCtrl 22501;
_data = parseSimpleArray(_listbox lbData (lbCurSel _listbox));
if (_data isEqualTo []) exitWith {};
ExileClientIsWaitingForServerTradeResponse = true;
["deleteListingRequest", [(_data select 3) select 4]] call ExileClient_system_network_send;