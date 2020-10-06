/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_listbox", "_editbox", "_data", "_updatedData", "_bidPrice"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (ExileClientIsWaitingForServerTradeResponse) exitWith 
{
	["WarningTitleAndText", ["Please Wait...", "Trade is in progress"]] call ExileClient_gui_toaster_addTemplateToast;	
};
_listbox = _display displayCtrl 22303;
_editbox = _display displayCtrl 22335;
_data = parseSimpleArray(_listbox lbData (lbCurSel _listbox));
if (_data isEqualTo []) exitWith {};
_updatedData = MarXetAuction getVariable [(_data select 3) select 4, []];
if (_updatedData isEqualTo []) exitWith 
{
	["WarningTitleAndText", ["Our deepest apologies", "The selected item is no longer available for bidding"]] call ExileClient_gui_toaster_addTemplateToast;	
	MarXetUpdatePending = true;
};
if (_updatedData select 0) exitWith
{
	["WarningTitleAndText", ["Our deepest apologies", "The selected item is currently locked, please try again later"]] call ExileClient_gui_toaster_addTemplateToast;	
};
_bidPrice = ctrlText _editbox;
if (((_updatedData select 4) select 1) >= parseNumber(_bidPrice)) exitWith 
{
	["WarningTitleAndText", ["Bid too low!", "Your bid is too low, please bid at least 1 poptab above the current bid"]] call ExileClient_gui_toaster_addTemplateToast;	
};
ExileClientIsWaitingForServerTradeResponse = true;
["bidRequest", [(_data select 3) select 4, _bidPrice]] call ExileClient_system_network_send;