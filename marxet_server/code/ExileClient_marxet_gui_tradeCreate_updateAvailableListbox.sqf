/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_dropdown", "_listbox", "_editbox", "_search", "_configName", "_items", "_picture", "_classname", "_configFile", "_index", "_skinName"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_dropdown = _display displayCtrl 22151;
_listbox = _display displayCtrl 22152;
_editbox = _display displayCtrl 22150;
_search = ctrlText _editbox;
_configName = _dropdown lbData (lbCurSel _dropdown);
lbClear _listbox;
_items = [];
if (_configName isEqualTo "all") then 
{
	{
		_items append (getArray(missionConfigFile >> "CfgMarXet" >> "Requestable" >> _x >> "items"));
	}
	forEach ([missionConfigFile >> "CfgMarXet" >> "Requestable"] call ExileClient_marxet_util_config_getSubClasses);
}
else
{
	_items = getArray(missionConfigFile >> "CfgMarXet" >> "Requestable" >> _configName >> "items");
};
{
	_name = "";
	_picture = "";
	_classname = _x;
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
			_name = getText(configFile >> _configFile >> _x >> "displayName");
			_picture = getText(configFile >> _configFile >> _x >> "picture");
		};
	};
    if (
		((toLower _classname) find _search > -1 || (toLower _name) find _search > -1) 
		&& ({(_x select 0) isEqualTo _classname} count MarXetRequestedItems) isEqualTo 0
	) then
	{
		_index = _listbox lbAdd _name;
		_listbox lbSetPicture [_index, _picture];
		_listbox lbSetData [_index, _x];
		if (_classname isKindOf "AllVehicles") then 
		{
			_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
			if !(_skinName isEqualTo "") then 
			{
				_listbox lbSetText [_index, format["%1 (%2)", _name, _skinName]];
			};
		};
	};
}
forEach _items;
_listbox lbSetCurSel 0;