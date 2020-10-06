/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_listbox", "_entry", "_requestedListbox", "_picture", "_classname", "_quantity", "_configFile", "_index", "_skinName", "_title", "_button"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_listbox = _display displayCtrl 22201;
_entry = parseSimpleArray(_listbox lbData (lbCurSel _listbox));
[(_display displayCtrl 22012)] call ExileClient_marxet_gui_onPanelSwitch;
(_display displayCtrl 22002) ctrlSetText "TRADE: EDIT A REQUEST";
_requestedListbox = _display displayCtrl 22156;
MarXetRequestedItems = _entry select 4;
MarXetTradingItem = (_entry select 3) select 4;
{
	_name = "";
	_picture = "";
	_classname = _x select 0;
	_quantity = _x select 1;
	switch (_classname) do 
	{
		case "ExileMoney":
		{
			_name = "Poptabs";
			_picture = "\exile_assets\texture\ui\poptab_notification_ca.paa";
		};
		case "ExileScore": 
		{
			_name = "Respect";
			_picture = "\exile_assets\texture\ui\fail_ca.paa";
		};
		default 
		{
			_configFile = _classname call ExileClient_util_gear_getConfigNameByClassName;
			_name = getText(configFile >> _configFile >> _classname >> "displayName");
			_picture = getText(configFile >> _configFile >> _classname >> "picture");
		};
	};
	_index = _requestedListbox lbAdd _name;
	_requestedListbox lbSetTextRight [_index, format["x%1", _quantity]];
	_requestedListbox lbSetPicture [_index, _picture];
	_requestedListbox lbSetData [_index, _classname];
	if (_classname isKindOf "AllVehicles") then 
	{
		_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
		if !(_skinName isEqualTo "") then 
		{
			_requestedListbox lbSetText [_index, format["%1 (%2)", _name, _skinName]];
		};
	};
}
forEach MarXetRequestedItems;
call ExileClient_marxet_gui_tradeCreate_updateAvailableListbox;
(_display displayCtrl 22019) ctrlEnable false;
(_display displayCtrl 22020) ctrlEnable false;
(_display displayCtrl 22025) ctrlEnable false;
false call ExileClient_marxet_gui_toggleSideBar;
(_display displayCtrl 22018) ctrlShow true;
_name = (_entry select 3) select 2;
_classname = (_entry select 3) select 0;
_title = _display displayCtrl 22155;
_title ctrlSetStructuredText parseText format[
	"<t align='center' size='1.2'>Editing Trade For<br/><t color='#3FD4FC'>%1</t>", 
	_name
];
if (_classname isKindOf "AllVehicles") then 
{
	_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
	if !(_skinName isEqualTo "") then 
	{
		_title ctrlSetStructuredText parseText format[
			"<t align='center' size='1.2'>Editing Trade For<br/><t color='#3FD4FC'>%1 (%2)</t>", 
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
(_display displayCtrl 22157) cbSetChecked ((_entry select 1) select 2);
_button = _display displayCtrl 22159;
_button ctrlSetText "UPDATE";
_button ctrlRemoveAllEventHandlers "ButtonClick";
_button ctrlAddEventHandler ["ButtonClick", "call ExileClient_marxet_gui_tradeMine_onUpdateButtonClick"];
_button ctrlEnable true;