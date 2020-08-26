/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_listbox","_index","_data","_classname","_configName","_title","_skinName"];
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_listbox = _display displayCtrl 22020;
_index = lbCurSel _listbox;
if (_index isEqualTo -1) exitWith {};
_data = parseSimpleArray(_listbox lbData _index);
_classname = _data select 0;
if (_classname isEqualTo "ExileMoney" && (player getVariable ["ExileMoney", 0]) < 1) exitWith {};
if (_classname isEqualTo "ExileScore" && ExileClientPlayerScore < 1) exitWith {};
MarXetTradingItem = _data;
_name = "";
switch (_classname) do
{
	case "ExileMoney":
	{
		_name = "1 Poptabs";
		(_display displayCtrl 22025) ctrlEnable true;
		(_display displayCtrl 22025) ctrlSetText "1";
		(_display displayCtrl 22026) ctrlSetText "Poptabs";
	};
	case "ExileScore":
	{
		_name = "1 Respect";
		(_display displayCtrl 22025) ctrlEnable true;
		(_display displayCtrl 22025) ctrlSetText "1";
		(_display displayCtrl 22026) ctrlSetText "Respect";
	};
	default
	{
		(_display displayCtrl 22025) ctrlEnable false;
		(_display displayCtrl 22025) ctrlSetText "1";
		_configName = _classname call ExileClient_util_gear_getConfigNameByClassName;
		_name = getText(configFile >> _configName >> _classname >> "displayName");
	};
};
switch (MarXetCurrentPanel) do
{
	case 22028:
	{
		_title = _display displayCtrl 22155;
		_title ctrlSetStructuredText parseText format[
			"<t align='center' size='1.2'>Creating a Trade For<br/><t color='#3FD4FC'>%1</t>",
			_name
		];
		if (_classname isKindOf "AllVehicles") then
		{
			_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
			if !(_skinName isEqualTo "") then
			{
				_title ctrlSetStructuredText parseText format[
					"<t align='center' size='1.2'>Creating a Trade For<br/><t color='#3FD4FC'>%1 (%2)</t>",
					_name,
					_skinName
				];
			};
		};
		(_display displayCtrl 22153) ctrlSetText "1";
		{
			(_display displayCtrl _x) ctrlEnable true;
		}
		forEach [22152, 22154, 22153];
	};
	case 22031:
	{
		_title = _display displayCtrl 22402;
		_title ctrlSetStructuredText parseText format[
			"<t align='center' size='1.2'>Creating a new listing for <t color='#3FD4FC'>%1</t>",
			_name
		];
		true call ExileClient_marxet_gui_auctionCreate_toggleItemInfo;
		_classname call ExileClient_marxet_gui_auctionCreate_updateItemStats;
		MarXetTradingItem = [_classname];
	};
	default {};
};
