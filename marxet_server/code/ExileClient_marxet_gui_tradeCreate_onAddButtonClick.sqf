/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_fromListbox","_toListbox","_quantity","_classname","_picture","_configFile","_index","_skinName"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_fromListbox = _display displayCtrl 22152;
_toListbox = _display displayCtrl 22156;
_quantity = ctrlText(_display displayCtrl 22153);
_classname = _fromListbox lbData (lbCurSel _fromListbox);
if (_quantity isEqualTo "" || _classname isEqualto "") exitWith {};
_fromListbox lbDelete (lbCurSel _fromListbox);
MarXetRequestedItems pushBack [_classname, parseNumber(_quantity)];
_name = "";
_picture = "";
switch (_classname) do
{
	case "ExileMoney":
	{
		_name = "Poptabs";
		_picture = "\exile_assets\texture\ui\poptab_notification_ca.paa";
	};
	case "ExileScore":
	{
		_name = "Respect";
		_picture = "\exile_assets\texture\ui\fail_ca.paa";
	};
	default
	{
		_configFile = _classname call ExileClient_util_gear_getConfigNameByClassName;
		_name = getText(configFile >> _configFile >> _classname >> "displayName");
		_picture = getText(configFile >> _configFile >> _classname >> "picture");
	};
};
_index = _toListbox lbAdd _name;
_toListbox lbSetTextRight [_index, format["x%1", parseNumber(_quantity)]];
_toListbox lbSetPicture [_index, _picture];
_toListbox lbSetData [_index, _classname];
if (_classname isKindOf "AllVehicles") then
{
	_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
	if !(_skinName isEqualTo "") then
	{
		_toListbox lbSetText [_index, format["%1 (%2)", _name, _skinName]];
	};
};
(_display displayCtrl 22159) ctrlEnable true;
(_display displayCtrl 22153) ctrlSetText "1";
