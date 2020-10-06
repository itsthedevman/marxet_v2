/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_listbox", "_editbox", "_data", "_dropdown", "_index", "_containerType", "_containerNetID", "_vehicleNetIDs", "_classname", "_overallHealth"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (ExileClientIsWaitingForServerTradeResponse) exitWith 
{
	["WarningTitleAndText", ["Please Wait...", "Trade is in progress"]] call ExileClient_gui_toaster_addTemplateToast;	
};
_listbox = _display displayCtrl 22101;
_editbox = _display displayCtrl 22107;
_data = parseSimpleArray(_listbox lbData (lbCurSel _listbox));
if (_data isEqualTo []) exitWith {};
ExileClientIsWaitingForServerTradeResponse = true;
_dropdown = _display displayCtrl 22019;
_index = lbCurSel _dropdown;
_containerType = _dropdown lbValue _index;
_containerNetID = "";
if (_containerType isEqualTo 5) then
{
	_containerNetID = _dropdown lbData _index;
};
_vehicleNetIDs = [];
{
	_classname = _x select 0;
	if (_classname isKindOf "AllVehicles") then 
	{
		{
			if (local _x && {alive _x}) then 
			{
				if (toLower(typeOf(_x)) isEqualTo toLower(_classname)) then 
				{
					_overallHealth = (getAllHitPointsDamage _x) call ExileClient_marxet_util_vehicle_getOverallDamage;
					_overallHealth = [(1 - _overallHealth) * 100, 2] call ExileClient_util_math_round;
					if (_overallHealth > getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "overallVehicleHealth")) then 
					{
						_vehicleNetIDs pushBack netID(_x);
					};
				};
			};
		}
		forEach (nearestObjects [player, ["LandVehicle", "Air", "Ship"], 80]);
	};
}
forEach (_data select 4);
[
	"tradeRequest", 
	[
		(_data select 3) select 4, 
		ctrlText _editbox, 
		_containerType, 
		_containerNetID,
		_vehicleNetIDs
	]
] call ExileClient_system_network_send;