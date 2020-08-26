/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_listbox","_index","_display","_entry","_classname","_title","_skinName","_vehicleCost","_rekeyCost","_amount","_requestedBy","_requestedItemsLB","_hasAllRequested","_isVehicle","_displayName","_picture","_hasItem","_damaged","_textRight","_textColor","_quantity","_configName","_cargo","_overallHealth"];
disableSerialization;
_listbox = _this select 0;
_index = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (_index isEqualTo -1) exitWith
{
	(_display displayCtrl 22102) ctrlSetStructuredText parseText "<t align='center' size='1.2'>Please select an Item</t>";
	call ExileClient_marxet_gui_tradeView_postInit;
};
if ((_listbox lbValue _index) isEqualTo 1) exitWith
{
	(_display displayCtrl 22102) ctrlSetStructuredText parseText "<t align='center' size='1.2'>You listed this item<br/><t size='0.8'>You can modify it in ""My Requests""</t></t>";
	call ExileClient_marxet_gui_tradeView_postInit;
};
_entry = parseSimpleArray(_listbox lbData _index);
MarXetCurrentSelectedID = (_entry select 3) select 4;
_name = (_entry select 3) select 2;
_classname = (_entry select 3) select 0;
_title = _display displayCtrl 22102;
_title ctrlSetStructuredText parseText format[
	"<t align='center' size='1.2'>Trading For<br/><t color='#3FD4FC'>%1</t>",
	_name
];
if (_classname isKindOf "AllVehicles") then
{
	_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
	if !(_skinName isEqualTo "") then
	{
		_title ctrlSetStructuredText parseText format[
			"<t align='center' size='1.2'>Trading For<br/><t color='#3FD4FC'>%1 (%2)</t>",
			_name,
			_skinName
		];
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "addRekeyFee") isEqualTo 1) then
	{
		_index = -1;
		_vehicleCost = getNumber (missionConfigFile >> "CfgExileArsenal" >> _classname >> "price");
		_rekeyCost = floor(_vehicleCost * (getNumber (missionConfigFile >> "CfgTrading" >> "rekeyPriceFactor"))) max 1;
		{
			if ((_x select 0) isEqualTo "ExileMoney") exitWith
			{
				_index = _forEachIndex;
			};
		}
		forEach (_entry select 4);
		if (_index isEqualTo -1) then
		{
			(_entry select 4) pushBack ["ExileMoney", _rekeyCost];
		}
		else
		{
			_amount = ((_entry select 4) select _index) select 1;
			((_entry select 4) select _index) set [1, _amount + _rekeyCost];
		};
	};
};
if ((_entry select 1) select 2) then
{
	_requestedBy = _display displayCtrl 22103;
	_requestedBy ctrlSetStructuredText parseText format["<t size='0.8' align='center'>Requestor: %1</t>", (_entry select 1) select 1];
	_requestedBy ctrlShow true;
};
_requestedItemsLB = _display displayCtrl 22105;
lbClear _requestedItemsLB;
_hasAllRequested = [];
_isVehicle = false;
{
	_displayName = "";
	_picture = "";
	_hasItem = false;
	_damaged = false;
	_textRight = "";
	_textColor = [0.780, 0.149, 0.318, 1];
	_classname = _x select 0;
	_quantity = _x select 1;
	switch (_classname) do
	{
		case "ExileMoney":
		{
			_displayName = "Poptabs";
			_picture = "\exile_assets\texture\ui\poptab_notification_ca.paa";
			_hasItem = (player getVariable ["ExileMoney", 0]) >= _quantity;
		};
		case "ExileScore":
		{
			_displayName = "Respect";
			_picture = "\exile_assets\texture\ui\fail_ca.paa";
			_hasItem = ExileClientPlayerScore >= _quantity;
		};
		default
		{
			_configName = _classname call ExileClient_util_gear_getConfigNameByClassName;
			_displayName = getText(configFile >> _configName >> _classname >> "displayName");
			_picture = getText(configFile >> _configName >> _classname >> "picture");
			_cargo = (player call ExileClient_util_playerCargo_list) call ExileClient_util_array_toLower;
			{
				if (local _x && {alive _x}) then
				{
					if (toLower(typeOf(_x)) isEqualTo toLower(_classname)) then
					{
						_overallHealth = (getAllHitPointsDamage _x) call ExileClient_marxet_util_vehicle_getOverallDamage;
						_overallHealth = [(1 - _overallHealth) * 100, 2] call ExileClient_util_math_round;
						_damaged = _overallHealth < getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "overallVehicleHealth");
					};
					_cargo pushBack toLower(typeOf(_x));
					_cargo append (_x call ExileClient_util_containerCargo_list) call ExileClient_util_array_toLower;
				};
			}
			forEach (nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80]);
			_hasItem = ({ _x isEqualTo toLower(_classname) } count _cargo) >= _quantity;
		};
	};
	switch (true) do
	{
		case (_hasItem && _damaged):
		{
			_textRight = "Too damaged";
			_textColor = [0.871, 0.796, 0.227, 1];
		};
		case (_hasItem && !_damaged):
		{
			_textRight = "Found";
			_textColor = [0.627, 0.874, 0.231, 1];
		};
		default
		{
			_textRight = "Missing";
			_textColor = [0.780, 0.149, 0.318, 1];
		};
	};
	_hasAllRequested pushBack (_hasItem && !_damaged);
	_index = _requestedItemsLB lbAdd format["%2x %1", _displayName, _quantity];
	_requestedItemsLB lbSetTextRight [_index, _textRight];
	_requestedItemsLB lbSetColorRight [_index, _textColor];
	_requestedItemsLB lbSetPicture [_index, _picture];
	if (_classname isKindOf "AllVehicles") then
	{
		_skinName = _classname call ExileClient_marxet_util_vehicle_getSkinName;
		if !(_skinName isEqualTo "") then
		{
			_requestedItemsLB lbSetText [_index, format["%1x %2 (%3)", _quantity, _displayName, _skinName]];
		};
	};
}
forEach (_entry select 4);
_hasAllRequested = ({_x} count _hasAllRequested) isEqualTo count(_hasAllRequested);
_isVehicle = ((_entry select 3) select 0) isKindOf "AllVehicles";
{
	(_display displayCtrl _x) ctrlShow _isVehicle;
	(_display displayCtrl _x) ctrlEnable (_hasAllRequested && _isVehicle);
}
forEach [22106, 22107];
{
	(_display displayCtrl _x) ctrlShow true;
}
forEach [22104, 22105];
(_display displayCtrl 22107) ctrlSetText "";
(_display displayCtrl 22108) ctrlEnable (_hasAllRequested && !_isVehicle);
