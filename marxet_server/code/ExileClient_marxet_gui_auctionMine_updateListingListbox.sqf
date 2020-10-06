/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_listbox", "_listings", "_entry", "_classname", "_displayName", "_picture", "_configName", "_config", "_quality", "_qualityColor", "_timeLeft", "_index"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_listbox = _display displayCtrl 22501;
lbClear _listbox;
_listings = [];
{
	_entry = MarXetAuction getVariable [_x, nil];
	if !(isNil "_entry") then 
	{
		_entry = +_entry;
		if (((_entry select 1) select 0) isEqualTo (getPlayerUID player)) then 
		{
			_classname = ((_entry select 3) select 0);
			_displayName = "";
			_picture = "";
			switch (_classname) do
			{
				case "ExileScore": 
				{
					_displayName = format["%1 Respect", (_entry select 3) select 1 select 0];
					_picture = "\exile_assets\texture\ui\fail_ca.paa";
				};
				default 
				{
					_configName = _classname call ExileClient_util_gear_getConfigNameByClassName;
					_config = configFile >> _configName >> _classname;
					_displayName = getText(_config >> "displayName");
					_picture = getText(_config >> "picture");
				};
			};
			(_entry select 3) pushBack _displayName;
			(_entry select 3) pushBack _picture;
			(_entry select 3) pushBack _x;
			_listings pushBack _entry;
		};
	};
}
forEach (allVariables MarXetAuction);
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
	_timeLeft = [((_entry select 4) select 0)] call ExileClient_marxet_util_time_sync;
	if (_timeLeft > -10) then 
	{
		_index = _listbox lbAdd _name;
		_listbox lbSetPicture [_index, ((_entry select 3) select 3)];
		_listbox lbSetData [_index, str(_entry)];
		_listbox lbSetColor [_index, _qualityColor];
		_listbox lbSetValue [_index, 0];
		if (MarXetCurrentSelectedID isEqualTo ((_entry select 3) select 4)) then 
		{
			MarXetSelectedIndex = _index;
		};
		if (_timeLeft >= -10 && _timeLeft <= 0) then 
		{
			_listbox lbSetTextRight [_index, "SOLD"];
			_listbox lbSetColorRight [_index, [0.7, 0.93, 0, 0.6]];
		};
	};
}
forEach _listings;