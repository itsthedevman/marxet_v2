/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
(_display displayCtrl 22107) ctrlSetText "";
(_display displayCtrl 22108) ctrlEnable false;
{
	(_display displayCtrl _x) ctrlShow false;
}
forEach [22104, 22105, 22106, 22107, 22103];
