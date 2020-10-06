/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_dropdown", "_index", "_config"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_dropdown = _display displayCtrl 22151;
lbClear _dropdown;
_index = _dropdown lbAdd "All";
_dropdown lbSetData [_index, "all"];
{
	_config = missionConfigFile >> "CfgMarXet" >> "Requestable" >> _x;
	_index = _dropdown lbAdd (getText(_config >> "name"));
	_dropdown lbSetPicture [_index, getText(_config >> "icon")];
	_dropdown lbSetData [_index, _x];
}
forEach ([missionConfigFile >> "CfgMarXet" >> "Requestable"] call ExileClient_marxet_util_config_getSubClasses);
_dropdown lbSetCurSel 0;