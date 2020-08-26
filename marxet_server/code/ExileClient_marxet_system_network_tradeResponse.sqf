/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_classname","_sentToSafex","_pincode","_message","_displayName","_configName","_isVehicle","_display"];
if (_this select 0) then
{
	_classname = _this select 1;
	_sentToSafex = _this select 2;
	_pincode = _this select 3;
	_message = "";
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
	_isVehicle = _classname isKindOf "AllVehicles";
	if (_sentToSafex) then
	{
		_message = format[
			"Congratulations! You are now the owner of a slightly used <t font='PuristaBold'>%1</t>.<br/><br/><t underline='true'>Our sincerest apologies, due to space limitations, your new trade has been deposited in your <t font='PuristaBold'>SafeX</t>.</t><br/><br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House",
			_displayName
		];
	}
	else
	{
		_message = format[
			"Congratulations! You are now the owner of a slightly used <t font='PuristaBold'>%1</t><br/>%2Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House",
			_displayName,
			if (_isVehicle) then
			{
				if (profileNameSpace getVariable ["ExileStreamFriendlyUI", false]) then
				{
					"Your pincode has been set and is ready for you to use.<br/>"
				}
				else
				{
					format["Your pincode is <t font='PuristaBold' color='#3FD4FC'>%1</t><br/>", _pincode]
				};
			}
			else
			{
				""
			}
		];
	};
	["SuccessTitleAndText", ["Trade Complete", _message]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
	["ErrorTitleAndText", ["Trade Failed", _this select 1]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientIsWaitingForServerTradeResponse = false;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if !(isNull _display) then
{
	call ExileClient_marxet_gui_updatePlayerMoney;
	call ExileClient_marxet_gui_updateInventoryDropdown;
};
