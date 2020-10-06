/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_inputBox", "_key", "_display", "_ctrlText", "_tooMuch"];
disableSerialization;
_inputBox = _this select 0;
_key = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_ctrlText = ctrlText _inputBox;
_tooMuch = parseNumber(_ctrlText) > (player getVariable ["ExileMoney", -1]);
if (
	_tooMuch 
	|| parseNumber(_ctrlText) isEqualTo 0 
	|| (_key isEqualTo 0x0E && {_tooMuch}) 
	|| (_key isEqualTo 0x0E && {parseNumber(_ctrlText) isEqualTo 0})
) exitWith 
{
	(_display displayCtrl 22337) ctrlEnable false;
};