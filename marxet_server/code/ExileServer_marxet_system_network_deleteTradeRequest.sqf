/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_sessionID","_package","_marxetID","_playerObject","_entry","_requestorUID","_classname","_playerMoney","_fee","_traderLog"];
_sessionID = _this select 0;
_package = _this select 1;
_marxetID = _package select 0;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player is null";
	};
	if (_playerObject getVariable ["ExileMutex", false]) then
	{
		throw "Player is Mutex";
	};
	_playerObject setVariable ["ExileMutex", true];
	_entry = MarXetTrading getVariable [_marxetID, nil];
	if (isNil "_entry") then
	{
		throw "Invalid Marxet ID";
	};
	if (_marxetID call ExileServer_system_request_trading_isLocked) then
	{
		throw "This item is currently locked. Please try again later";
	};
	_marxetID call ExileServer_marxet_system_request_trading_lock;
	_requestorUID = (_entry select 1) select 0;
	if !(getPlayerUID(_playerObject) isEqualTo _requestorUID) then
	{
		throw "MMMMM, nice try";
	};
	_classname = (_entry select 3) select 0;
	_playerMoney = _playerObject getVariable ["ExileMoney", 0];
	_fee = floor((getNumber(missionConfigFile >> "CfgExileArsenal" >> _classname >> "price")) * (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "removalFeeFactor"))) max 1;
	if (_fee > _playerMoney) then
	{
		throw "You do not have enough money for the removal fee";
	};
	_playerMoney = _playerMoney - _fee;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	if (_classname isKindOf "AllVehicles") then
	{
		[_requestorUID, [_classname, _marxetID call ExileServer_marxet_object_vehicle_getID]] call ExileServer_system_safex_addVehicle;
	}
	else
	{
		[_requestorUID, [_classname]] call ExileServer_system_safex_addItem;
	};
	format["marxetDeleteTrade:%1", _marxetID] call ExileServer_system_database_query_fireAndForget;
	MarxetTrading setVariable [_marxetID, nil, true];
	[_sessionID, "deleteTradeResponse", [true, ""]] call ExileServer_system_network_send_to;
	MarXetUpdatePending = true;
	publicVariable "MarXetUpdatePending";
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2) DELETED A TRADE REQUEST. ID: %3. TRADE ITEM/VEHICLE: %4. REQUESTED ITEMS/VEHICLES: %5",
			_playerObject,
			getPlayerUID(_playerObject),
			_marxetID,
			_classname,
			_entry select 4
		];
		"extDB3" callExtension format["1:TRADING:%1",_traderLog];
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToDiscord") isEqualTo 1) then
	{
		[
			"success",
			"embed",
			[
				"Trade Deleted",
				"",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _marxetID, true],
					["Trading For", _classname, true],
					["Requested Items/Vehicles", format["```%1```", _entry select 4], true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
}
catch
{
	_marxetID call ExileServer_marxet_system_request_trading_unlock;
	[_sessionID, "deleteTradeResponse", [false, _exception]] call ExileServer_system_network_send_to;
};
if (!isNil "_playerObject") then
{
	_playerObject setVariable ["ExileMutex", false];
};
