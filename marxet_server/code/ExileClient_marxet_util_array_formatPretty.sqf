/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_output", "_classname", "_quantity", "_displayName", "_configName"];
_output = "";
{
	_classname = _x select 0;
	_quantity = _x select 1;
	_displayName = "";
	switch (_classname) do 
	{
		case "ExileMoney": 
		{
			_displayName = "Poptabs";
		};
		case "ExileScore": 
		{
			_displayName = "Respect";
		};
		default 
		{
			_configName = _classname call ExileClient_util_gear_getConfigNameByClassName;
			_displayName = getText(configFile >> _configName >> _classname >> "displayName");
		};
	};
	_output = format["%1%2x %3\n", _output, _quantity, _displayName];
}
forEach _this;
_output