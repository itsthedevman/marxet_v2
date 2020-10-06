/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_days", "_hours", "_min", "_maxDay", "_maxHour", "_maxMin", "_minDay", "_minHour", "_minMin", "_totalSeconds", "_maxSeconds", "_minSeconds", "_dropdown", "_index", "_containerType", "_containerNetID"];
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (ExileClientIsWaitingForServerTradeResponse) exitWith 
{
	["WarningTitleAndText", ["Please Wait...", "Request creation in progress"]] call ExileClient_gui_toaster_addTemplateToast;	
};
if (MarXetTradingItem isEqualTo []) exitWith {};
_days = parseNumber(ctrlText(_display displayCtrl 22433));
_hours = parseNumber(ctrlText(_display displayCtrl 22435));
_min = parseNumber(ctrlText(_display displayCtrl 22437));
(getArray(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Auction" >> "maxLength")) params ["_maxDay", "_maxHour", "_maxMin"];
(getArray(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Auction" >> "minLength")) params ["_minDay", "_minHour", "_minMin"];
_totalSeconds = (_days * 86400) + (_hours * 3600) + (_min * 60);
_maxSeconds = (_maxDay * 86400) + (_maxHour * 3600) + (_maxMin * 60);
_minSeconds = (_minDay * 86400) + (_minHour * 3600) + (_minMin * 60);
if (_totalSeconds > _maxSeconds) exitWith 
{
	["ErrorTitleAndText", ["Auction length is too long!", format["The max time is %1 days, %2 hours, %3 minutes", _maxDay, _maxHour, _maxMin]]] call ExileClient_gui_toaster_addTemplateToast;	
};
if (_totalSeconds < _minSeconds) exitWith 
{
	["ErrorTitleAndText", ["Auction length is too short!", format["The min time is %1 days, %2 hours, %3 minutes", _minDay, _minHour, _minMin]]] call ExileClient_gui_toaster_addTemplateToast;	
};
if (ctrlText(_display displayCtrl 22440) isEqualTo "") exitWith 
{
	["ErrorTitleAndText", ["Missing starting prace", "You need to set a starting price!"]] call ExileClient_gui_toaster_addTemplateToast;	
};
_dropdown = _display displayCtrl 22019;
_index = lbCurSel _dropdown;
_containerType = _dropdown lbValue _index;
_containerNetID = "";
if (_containerType isEqualTo 5) then
{
	_containerNetID = _dropdown lbData _index;
};
ExileClientIsWaitingForServerTradeResponse = true;
["createListingRequest", [MarXetTradingItem, ctrlText(_display displayCtrl 22440), [_days, _hours, _min], _containerType, _containerNetID]] call ExileClient_system_network_send;
(_display displayCtrl 22433) ctrlSetText "1";
(_display displayCtrl 22435) ctrlSetText "0";
(_display displayCtrl 22437) ctrlSetText "0";
(_display displayCtrl 22440) ctrlSetText "";
