/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display"];
if (_this select 0) then 
{
	["SuccessTitleAndText", ["Trade Deleted", "Your trading item/vehicle has been returned to you in your SafeX<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House"]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Delete failed", _this select 1]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if !(isNull _display) then 
{
	call ExileClient_marxet_gui_updatePlayerMoney;
	call ExileClient_marxet_gui_updateInventoryDropdown;
	[(_display displayCtrl 22013)] call ExileClient_marxet_gui_onPanelSwitch;
};
