/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_listbox","_index","_display","_entry","_timeLeftCtrl","_playerPoptabs"];
disableSerialization;
_listbox = _this select 0;
_index = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
false call ExileClient_marxet_gui_auctionView_toggleItemInfo;
if (_index isEqualTo -1 || (_listbox lbValue _index) isEqualTo 1) exitWith {};
_entry = parseSimpleArray(_listbox lbData _index);
MarXetCurrentSelectedID = (_entry select 3) select 4;
MarXetEntryEndTime = (_entry select 4) select 0;
_entry call ExileClient_marxet_gui_auctionView_updateItemStats;
(_display displayCtrl 22335) ctrlSetText "";
if (([] call ExileClient_marxet_util_time_sync) > 0) then
{
	(_display displayCtrl 22333) ctrlShow true;
	_timeLeftCtrl = _display displayCtrl 22334;
	_timeLeftCtrl ctrlSetStructuredText parseText (call ExileClient_marxet_util_time_format);
	_timeLeftCtrl ctrlShow true;
	_playerPoptabs = player getVariable ["ExileMoney", -1];
	{
		(_display displayCtrl _x) ctrlEnable (((_entry select 4) select 1) < _playerPoptabs);
		(_display displayCtrl _x) ctrlShow true;
	}
	forEach [22335,22336,22337];
	(_display displayCtrl 22337) ctrlEnable false;
};
