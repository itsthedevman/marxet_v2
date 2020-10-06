/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display"];
if (_this select 0) then 
{
	["SuccessTitleOnly", ["Trade Updated"]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Update failed", _this select 1]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if !(isNull _display) then 
{
	call ExileClient_marxet_gui_tradeMine_onCloseEditButtonClick;
	call ExileClient_marxet_gui_updatePlayerMoney;
	call ExileClient_marxet_gui_updateInventoryDropdown;
	[(_display displayCtrl 22013)] call ExileClient_marxet_gui_onPanelSwitch;
};
