/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_itemClassName","_dialog","_itemPicture","_i","_itemConfig","_picture","_promotedStats","_controlID"];
disableSerialization;
_itemClassName = _this;
_dialog = uiNameSpace getVariable ["RscMarXet", displayNull];
_itemPicture = _dialog displayCtrl 22403;
_itemPicture ctrlShow false;
for "_i" from 22404 to 22431 do
{
	(_dialog displayCtrl _i) ctrlShow false;
};
if !(_itemClassName isEqualTo "") then
{
	_itemConfig = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
	_itemPicture ctrlShow true;
	_picture = "";
	switch (_itemClassName) do
	{
		case "ExileScore":
		{
			_picture = "\exile_assets\texture\ui\fail_ca.paa";
		};
		default
		{
			_picture = getText(configFile >> _itemConfig >> _itemClassName >> "picture")
		};
	};
	_itemPicture ctrlSetText _picture;
	_promotedStats = [_itemClassName] call ExileClient_marxet_util_item_getMainStats;
	_controlID = 22404;
	{
		(_dialog displayCtrl _controlID) ctrlShow true;
		(_dialog displayCtrl (_controlID + 2)) ctrlSetText (_x select 0);
		(_dialog displayCtrl (_controlID + 2)) ctrlShow true;
		(_dialog displayCtrl (_controlID + 3)) ctrlSetStructuredText parseText (_x select 1);
		(_dialog displayCtrl (_controlID + 3)) ctrlShow true;
		(_dialog displayCtrl (_controlID + 1)) progressSetPosition (_x select 2);
		(_dialog displayCtrl (_controlID + 1)) ctrlShow true;
		(_dialog displayCtrl (_controlID + 1)) ctrlCommit 1;
		_controlID = _controlID + 4;
	}
	forEach _promotedStats;
};
true
