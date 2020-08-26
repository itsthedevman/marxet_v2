/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
_display = uiNamespace getVariable ["RscMarXet", displayNull];
call ExileClient_marxet_gui_updatePlayerMoney;
call ExileClient_marxet_gui_updateInventoryDropdown;
MarXetUpdateThread = -1;
[(_display displayCtrl 22011)] call ExileClient_Marxet_gui_onPanelSwitch;
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
