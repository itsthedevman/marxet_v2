/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_inventoryDropdown", "_dropdownIndex", "_tradeContainerType", "_tradeVehicleObject", "_items", "_currentLoad", "_maximumLoad", "_inventoryListBox", "_containerClass", "_vehicles", "_vehicleNetID", "_vehicleObject", "_inventoryLoadProgress", "_inventoryLoadValue", "_itemClassName", "_itemInfo", "_indexEntryIndex", "_configName", "_quality", "_qualityColor"];
disableSerialization;
_display = uiNameSpace getVariable ["RscMarXet", displayNull];
_inventoryDropdown = _display displayCtrl 22019;
_dropdownIndex = lbCurSel _inventoryDropdown;
_tradeContainerType = _inventoryDropdown lbValue _dropdownIndex;
_tradeVehicleObject = objNull;
_items = [];
_currentLoad = 0;
_maximumLoad = 0;
_inventoryListBox = _display displayCtrl 22020;
lbClear _inventoryListBox;
switch (_tradeContainerType) do
{
	case 1: 
	{
		_currentLoad = (loadAbs player);
		_maximumLoad = getNumber(configfile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
		_items = [player, true] call ExileClient_util_playerEquipment_list;
		if (player getVariable ["ExileMoney", 0] > 0) then 
		{
			if (MarXetCurrentPanel isEqualTo 22028) then
			{
				_items = ["ExileMoney"] + _items;
			};
		};
		if (ExileClientPlayerScore > 0) then 
		{
			if (MarXetCurrentPanel in [22028, 22031]) then
			{
				_items = ["ExileScore"] + _items;
			};
		};
	};
	case 2:
	{
		_containerClass = getText(configFile >> "CfgWeapons" >> (uniform player) >> "ItemInfo" >> "containerClass");
		_maximumLoad = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
		_currentLoad = (loadUniform player) * _maximumLoad;
		_items = (uniformContainer player) call ExileClient_util_containerCargo_list;
	};
	case 3: 
	{
		_containerClass = getText(configFile >> "CfgWeapons" >> (vest player) >> "ItemInfo" >> "containerClass");
		_maximumLoad = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
		_currentLoad = (loadVest player) * _maximumLoad;
		_items = (vestContainer player) call ExileClient_util_containerCargo_list;
	};
	case 4:
	{
		_maximumLoad = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumLoad");
		_currentLoad = (loadBackpack player) * _maximumLoad;
		_items = (backpackContainer player) call ExileClient_util_containerCargo_list;
	};
	default 
	{
		_items = [];
		_vehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80];
		if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "allowVehiclesToBeListed") isEqualTo 1) then 
		{
			if ((MarXetCurrentPanel in [22028])) then 
			{
				{
					if (local _x && {alive _x}) then 
					{
						_items pushBack [typeOf _x, netID _x];
					};
				}
				forEach _vehicles;
			};
			_maximumLoad = 0;
			_currentLoad = 0;
		}
		else
		{
			_vehicleNetID = _inventoryDropdown lbData _dropdownIndex;
			_vehicleObject = objectFromNetId _vehicleNetID;
			_maximumLoad = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicleObject) >> "maximumLoad");
			_items = _vehicleObject call ExileClient_util_containerCargo_list;
			_currentLoad = _items call ExileClient_util_gear_calculateLoad;
		};
	};
};
if (MarXetCurrentPanel in [22028, 22031]) then 
{
	(_display displayCtrl 22021) ctrlShow false;
	(_display displayCtrl 22022) ctrlShow false;
	(_display displayCtrl 22023) ctrlShow false;
	(_display displayCtrl 22024) ctrlShow false;
	(_display displayCtrl 22026) ctrlShow true;
	(_display displayCtrl 22025) ctrlShow true;
	(_display displayCtrl 22025) ctrlEnable false;
	(_display displayCtrl 22025) ctrlSetText "1";
}
else
{
	(_display displayCtrl 22025) ctrlShow false;
	(_display displayCtrl 22026) ctrlShow false;
	(_display displayCtrl 22021) ctrlShow true;
	(_display displayCtrl 22022) ctrlShow true;
	(_display displayCtrl 22023) ctrlShow true;
	(_display displayCtrl 22024) ctrlShow true;
	_inventoryLoadProgress = _display displayCtrl 22022;
	_inventoryLoadProgress progressSetPosition (_currentLoad / (_maximumLoad max 1));
	_inventoryLoadProgress ctrlShow true;
	_inventoryLoadValue = _display displayCtrl 22024;
	_inventoryLoadValue ctrlSetStructuredText (parseText format["<t size='1' font='puristaMedium' align='right'>%1/%2</t>", round(_currentLoad), _maximumLoad]);
	_inventoryLoadValue ctrlShow true;
};
{
	_itemClassName = _x;
	_itemInfo = "";
	if (_x isEqualType []) then 
	{
		_itemClassName = _x select 0;
		_itemInfo = _x select 1;
	};
	switch (_itemClassName) do 
	{
		case "ExileMoney": 
		{
			_indexEntryIndex = _inventoryListBox lbAdd "Poptabs";
			_inventoryListBox lbSetColor [_indexEntryIndex, [0.93, 0, 0.48, 1]];
			_inventoryListBox lbSetPicture [_indexEntryIndex, "\exile_assets\texture\ui\poptab_notification_ca.paa"];
			_inventoryListBox lbSetValue [_indexEntryIndex, _tradeContainerType];
			_inventoryListBox lbSetData [_indexEntryIndex, str([_itemClassName, "1"])];
		};
		case "ExileScore": 
		{
			_indexEntryIndex = _inventoryListBox lbAdd "Respect";
			_inventoryListBox lbSetColor [_indexEntryIndex, [0.93, 0, 0.48, 1]];
			_inventoryListBox lbSetPicture [_indexEntryIndex, "\exile_assets\texture\ui\fail_ca.paa"];
			_inventoryListBox lbSetValue [_indexEntryIndex, _tradeContainerType];
			_inventoryListBox lbSetData [_indexEntryIndex, str([_itemClassName, "1"])];
		};
		default 
		{
			_configName = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
			_quality = getNumber(missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "quality");
			_qualityColor = [1, 1, 1, 1];
			switch (_quality) do
			{
				case 2: 		 { _qualityColor = [0.62, 0.87 ,0.23, 1]; };
				case 3:		 { _qualityColor = [0, 0.78, 0.92, 1]; };
				case 4:		 { _qualityColor = [0.62, 0.27, 0.58, 1]; };
				case 5:		 { _qualityColor = [1, 0.7, 0.09, 1]; };
				case 6:		 { _qualityColor = [0.93, 0, 0.48, 1]; };						
			};
			_indexEntryIndex = _inventoryListBox lbAdd getText(configFile >> _configName >> _itemClassName >> "displayName");
			_inventoryListBox lbSetColor [_indexEntryIndex, _qualityColor];
			_inventoryListBox lbSetPicture [_indexEntryIndex, getText(configFile >> _configName >> _itemClassName >> "picture")];
			_inventoryListBox lbSetValue [_indexEntryIndex, _tradeContainerType];
			_inventoryListBox lbSetData [_indexEntryIndex, str([_itemClassName, _itemInfo])];
		};
	};
}
forEach _items;
_inventoryListBox lbSetCurSel 0;
true