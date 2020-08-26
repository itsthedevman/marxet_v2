/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_inventoryDropdown","_index","_nearVehicles"];
disableSerialization;
_display = uiNameSpace getVariable ["RscMarXet", displayNull];
_inventoryDropdown = _display displayCtrl 22019;
lbClear _inventoryDropdown;
_index = _inventoryDropdown lbAdd "Equipment";
_inventoryDropdown lbSetValue [_index, 1];
_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\face_ca.paa"];
_inventoryDropdown lbSetCurSel 0;
if !((uniform player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd "Uniform";
	_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa"];
	_inventoryDropdown lbSetValue [_index, 2];
};
if !((vest player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd "Vest";
	_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa"];
	_inventoryDropdown lbSetValue [_index, 3];
};
if !((backpack player) isEqualTo "") then
{
	_index = _inventoryDropdown lbAdd "Backpack";
	_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"];
	_inventoryDropdown lbSetValue [_index, 4];
};
if (MarXetCurrentPanel in [22028]) then
{
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "allowVehiclesToBeListed") isEqualTo 1) then
	{
		_nearVehicles = { local _x && {alive _x} } count (nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80]);
		if (_nearVehicles > 0) then
		{
			_index = _inventoryDropdown lbAdd "Nearby Vehicles";
			_inventoryDropdown lbSetPicture [_index, "a3\ui_f\data\gui\Rsc\RscDisplayGarage\car_ca.paa"];
			_inventoryDropdown lbSetValue [_index, 5];
		};
	};
}
else
{
	_nearVehicles = nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80];
	{
		if (local _x && {alive _x}) then
		{
			_index = _inventoryDropdown lbAdd getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
			_inventoryDropdown lbSetData [_index, netId _x];
			_inventoryDropdown lbSetValue [_index, 5];
		};
	}
	forEach _nearVehicles;
};
