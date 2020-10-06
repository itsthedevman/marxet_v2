/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_listbox", "_entry", "_quality", "_qualityColor", "_classname", "_isVehicle", "_index", "_skinName", "_health"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_listbox = _display displayCtrl 22101;
lbClear _listbox;
{
	_entry = _x;
	_quality = getNumber(missionConfigFile >> "CfgExileArsenal" >> ((_entry select 3) select 0) >> "quality");
	_qualityColor = [1, 1, 1, 1];
	switch (_quality) do
	{
		case 2: 		 { _qualityColor = [0.62, 0.87 ,0.23, 1]; };
		case 3:		 { _qualityColor = [0, 0.78, 0.92, 1]; };
		case 4:		 { _qualityColor = [0.62, 0.27, 0.58, 1]; };
		case 5:		 { _qualityColor = [1, 0.7, 0.09, 1]; };
		case 6:		 { _qualityColor = [0.93, 0, 0.48, 1]; };						
	};
	_name = (_entry select 3) select 2;
	_classname = (_entry select 3) select 0;
	_isVehicle = _classname isKindOf "AllVehicles";
	_index = _listbox lbAdd _name;
	_listbox lbSetPicture [_index, ((_entry select 3) select 3)];
	_listbox lbSetData [_index, str(_entry)];
	_listbox lbSetColor [_index, _qualityColor];
	_listbox lbSetValue [_index, 0];
	if (MarXetCurrentSelectedID isEqualTo ((_entry select 3) select 4)) then 
	{
		MarXetSelectedIndex = _index;
	};
	if (_isVehicle) then 
	{
		_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
		if !(_skinName isEqualTo "") then 
		{
			_listbox lbSetText [_index, format["%1 (%2)", _name, _skinName]];
		};
	};
	if (((_entry select 1) select 0) isEqualTo (getPlayerUID player)) then 
	{
		_listbox lbSetTextRight [_index, "Mine"];	
		_listbox lbSetValue [_index, 1];
		_listbox lbSetColor [_index, [0.5, 0.5, 0.5, 1]];
		_listbox lbSetColorRight [_index, [0.5, 0.5, 0.5, 1]];
	}
	else
	{
		if (_isVehicle) then 
		{
			_health = (((_entry select 3) select 1) select 0) call ExileClient_marxet_util_vehicle_getOverallDamage;
			_listbox lbSetTextRight [_index, format["%1%2", [(1 - _health) * 100, 2] call ExileClient_util_math_round, "%"]];
			_listbox lbSetTooltip [_index, format["Overall Health: %1%2", [(1 - _health) * 100, 2] call ExileClient_util_math_round, "%"]];
		};
	};
}
forEach (call ExileClient_marxet_gui_tradeView_sortListings);