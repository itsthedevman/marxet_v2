/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_inputBox","_key","_display","_ctrlText","_tooMuch","_type","_title"];
disableSerialization;
_inputBox = _this select 0;
_key = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_ctrlText = ctrlText _inputBox;
_tooMuch = false;
_type = "";
if ((MarXetTradingItem select 0) isEqualTo "ExileMoney") then
{
	_tooMuch = parseNumber(_ctrlText) > (player getVariable ["ExileMoney", 0]);
	_type = "Poptabs";
}
else
{
	_tooMuch = parseNumber(_ctrlText) > ExileClientPlayerScore;
	_type = "Respect";
};
if (_tooMuch || parseNumber(_ctrlText) isEqualTo 0 || (_key isEqualTo 0x0E && {_tooMuch}) || (_key isEqualTo 0x0E && {parseNumber(_ctrlText) isEqualTo 0})) exitWith
{
	if (_tooMuch) then
	{
		MarXetTradingItem set [1, str(player getVariable ["ExileMoney", -1])];
		if (MarXetCurrentPanel isEqualTo 22028) then
		{
			_title = _display displayCtrl 22155;
			_title ctrlSetStructuredText parseText format[
				"<t align='center' size='1.2'>Creating a Trade For<br/><t color='#3FD4FC'>%1 %2</t>",
				if ((MarXetTradingItem select 0) isEqualTo "ExileMoney") then
				{
					player getVariable ["ExileMoney", 0]
				}
				else
				{
					ExileClientPlayerScore
				},
				_type
			];
		}
		else
		{
			_title = _display displayCtrl 22402;
			_title ctrlSetStructuredText parseText format[
				"<t align='center' size='1.2'>Creating a new listing for <t color='#3FD4FC'>%1 %2</t>",
				if ((MarXetTradingItem select 0) isEqualTo "ExileMoney") then
				{
					player getVariable ["ExileMoney", 0]
				}
				else
				{
					ExileClientPlayerScore
				},
				_type
			];
		};
	};
};
MarXetTradingItem set [1, _ctrlText];
if (MarXetCurrentPanel isEqualTo 22028) then
{
	_title = _display displayCtrl 22155;
	_title ctrlSetStructuredText parseText format[
		"<t align='center' size='1.2'>Creating a Trade For<br/><t color='#3FD4FC'>%1 %2</t>",
		_ctrlText,
		_type
	];
}
else
{
	_title = _display displayCtrl 22402;
	_title ctrlSetStructuredText parseText format[
		"<t align='center' size='1.2'>Creating a new listing for <t color='#3FD4FC'>%1 %2</t>",
		_ctrlText,
		_type
	];
};
