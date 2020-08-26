/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
if (_this select 0) then
{
	["SuccessTitleAndText", ["Bid added", "You now control this listing.<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House"]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Bid failed", _this select 1]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if !(isNull _display) then
{
	call ExileClient_marxet_gui_updatePlayerMoney;
};
