/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_listbox","_index","_display","_entry","_classname","_title","_createdOnTitle","_removalFee","_skinName","_displayName","_picture","_quantity","_configName"];
disableSerialization;
_listbox = _this select 0;
_index = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_entry = parseSimpleArray(_listbox lbData _index);
_name = (_entry select 3) select 2;
_classname = (_entry select 3) select 0;
_title = _display displayCtrl 22202;
_createdOnTitle = _display displayCtrl 22203;
_removalFee = floor((getNumber(missionConfigFile >> "CfgExileArsenal" >> _classname >> "price")) * (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "removalFeeFactor"))) max 1;
_title ctrlSetStructuredText parseText format[
	"<t align='center' size='1.2'>Listed Item<br/><t color='#3FD4FC'>%1</t>",
	_name
];
if (_classname isKindOf "AllVehicles") then
{
	_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
	if !(_skinName isEqualTo "") then
	{
		_title ctrlSetStructuredText parseText format[
			"<t align='center' size='1.2'>Listed Vehicle<br/><t color='#3FD4FC'>%1 (%2)</t>",
			_name,
			_skinName
		];
	};
};
_createdOnTitle ctrlSetStructuredText parseText format ["<t align='center' size='0.8'>Created: %1</t>", (_entry select 2) call ExileClient_marxet_util_time_pretty];
(_display displayCtrl 22208) ctrlSetStructuredText parseText format[
	"<t>Removal Fee: <t color='#C72651'>%1</t><img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>",
	_removalFee
];
_listbox = _display displayCtrl 22205;
lbClear _listbox;
{
	_displayName = "";
	_picture = "";
	_classname = _x select 0;
	_quantity = _x select 1;
	switch (_classname) do
	{
		case "ExileMoney":
		{
			_displayName = "Poptabs";
			_picture = "\exile_assets\texture\ui\poptab_notification_ca.paa";
		};
		case "ExileScore":
		{
			_displayName = "Respect";
			_picture = "\exile_assets\texture\ui\fail_ca.paa";
		};
		default
		{
			_configName = _classname call ExileClient_util_gear_getConfigNameByClassName;
			_displayName = getText(configFile >> _configName >> _classname >> "displayName");
			_picture = getText(configFile >> _configName >> _classname >> "picture");
		};
	};
	_index = _listbox lbAdd _displayName;
	_listbox lbSetPicture [_index, _picture];
	_listbox lbSetTextRight [_index, format["x%1", _quantity]];
}
forEach (_entry select 4);
{
	(_display displayCtrl _x) ctrlShow true;
}
forEach [22202,22203,22204,22205,22206,22207,22208,22209];
if (_removalFee > player getVariable ["ExileMoney", 0]) then
{
	(_display displayCtrl 22209) ctrlEnable false;
};
