/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_itemClassName","_currentPrice","_picture","_bidCount","_dialog","_itemPicture","_i","_itemConfig","_promotedStats","_controlID"];
disableSerialization;
_itemClassName = ((_this select 3) select 0);
_currentPrice = ((_this select 4) select 1);
_picture = ((_this select 3) select 3);
_bidCount = ((_this select 4) select 2);
[_picture] call ArcasDevTools_util_debugLog;
_dialog = uiNameSpace getVariable ["RscMarXet", displayNull];
_itemPicture = _dialog displayCtrl 22304;
_itemPicture ctrlShow false;
for "_i" from 22305 to 22332 do
{
	(_dialog displayCtrl _i) ctrlShow false;
};
if !(_itemClassName isEqualTo "") then
{
	_itemConfig = _itemClassName call ExileClient_util_gear_getConfigNameByClassName;
	_itemPicture ctrlShow true;
	_itemPicture ctrlSetText _picture;
	_promotedStats = [_itemClassName, _currentPrice, _bidCount] call ExileClient_marxet_util_item_getMainStats;
	_controlID = 22305;
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
