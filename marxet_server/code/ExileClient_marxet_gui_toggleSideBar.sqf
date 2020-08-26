/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display"];
_display = uiNamespace getVariable ["RscMarXet", displayNull];
{
	(_display displayCtrl _x) ctrlShow _this;
	(_display displayCtrl _x) ctrlEnable _this;
}
forEach [22011, 22012, 22013, 22015, 22016, 22017, 22010, 22014];
