/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display"];
if !(MarXetUpdatePending) exitWith {};
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (isNull _display) exitWith 
{
	[MarXetUpdateThread] call ExileClient_system_thread_removeTask;
	MarXetUpdateThread = -1;
};
call ExileClient_marxet_gui_tradeView_updateListingListbox;
(_display displayCtrl 22101) lbSetCurSel MarXetSelectedIndex;
MarXetUpdatePending = false;