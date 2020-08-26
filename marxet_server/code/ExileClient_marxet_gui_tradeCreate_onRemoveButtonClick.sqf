/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_fromListbox","_toListbox","_classname","_index","_count"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_fromListbox = _display displayCtrl 22156;
_toListbox = _display displayCtrl 22152;
_classname = _fromListbox lbData (lbCurSel _fromListbox);
if (_classname isEqualto "") exitWith {};
_fromListbox lbDelete (lbCurSel _fromListbox);
_index =
{
	if ((_x select 0) isEqualto _classname) exitWith {_forEachIndex};
}
forEach MarXetRequestedItems;
MarXetRequestedItems deleteAt _index;
_count = (lbSize _fromListbox) > 0;
(_display displayCtrl 22158) ctrlEnable _count;
(_display displayCtrl 22159) ctrlEnable _count;
call ExileClient_marxet_gui_tradeCreate_updateAvailableListbox;
