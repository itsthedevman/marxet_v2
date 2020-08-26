/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_inputBox","_key","_display","_ctrlText"];
disableSerialization;
_inputBox = _this select 0;
_key = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_ctrlText = ctrlText _inputBox;
if (_key isEqualTo 0x0E && {(count _ctrlText) < 4}) exitWith
{
	(_display displayCtrl 22108) ctrlEnable false;
};
