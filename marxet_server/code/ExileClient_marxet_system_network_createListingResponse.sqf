/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_classname","_displayName","_configName","_message","_display"];
if (_this select 0) then
{
	_classname = _this select 1;
	_displayName = "";
	switch (_classname) do
	{
		case "ExileMoney":
		{
			_displayName = "Poptabs";
		};
		case "ExileScore":
		{
			_displayName = "Respect";
		};
		default
		{
			_configName = _classname call ExileClient_util_gear_getConfigNameByClassName;
			_displayName = getText(configFile >> _configName >> _classname >> "displayName");
		};
	};
	_message = format[
		"You have successfully listed <t font='PuristaBold'>%1</t> for auction.<br/>Make sure to sign up with Exile Server Manager to receive an offline notification when your auction has been closed.<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House",
		_displayName
	];
	["SuccessTitleAndText", ["Listing Created", _message]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Listing failed", _this select 1]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if !(isNull _display) then
{
	call ExileClient_marxet_gui_updatePlayerMoney;
	call ExileClient_marxet_gui_updateInventoryDropdown;
	[(_display displayCtrl 22015)] call ExileClient_marxet_gui_onPanelSwitch;
};
