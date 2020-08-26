/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_sessionID","_package","_marxetID","_requestedItems","_showName","_playerObject","_entry","_dbPackage","_traderLog","_requestorUID","_tradeClassname"];
_sessionID = _this select 0;
_package = _this select 1;
_marxetID = _package select 0;
_requestedItems = _package select 1;
_showName = _package select 2;
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw "Player is Null";
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
	_entry set [4, _requestedItems];
	(_entry select 1) set [2, _showName];
	MarXetTrading setVariable [_marxetID, _entry, true];
	_dbPackage =
	[
		"marxetUpdateTrade",
		[
			_requestedItems,
			parseNumber(_showName),
			_marxetID
		]
	]
	call ExileServer_util_extDB2_createMessage;
	_dbPackage call ExileServer_system_database_query_insertSingle;
	[_sessionID, "editTradeResponse", [true, ""]] call ExileServer_system_network_send_to;
	MarXetUpdatePending = true;
	publicVariable "MarXetUpdatePending";
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2) UPDATED A TRADE REQUEST. ID: %3. TRADE ITEM/VEHICLE: %4. REQUESTED ITEMS/VEHICLES: %5",
			_playerObject,
			getPlayerUID(_playerObject),
			_marxetID,
			(_entry select 3) select 0,
			_requestedItems
		];
		"extDB3" callExtension format["1:TRADING:%1",_traderLog];
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToDiscord") isEqualTo 1) then
	{
		[
			"success",
			"embed",
			[
				"Trade Updated",
				"",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _marxetID, true],
					["Trading For", (_entry select 3) select 0, true],
					["Requested Items/Vehicles", format["```%1```", _requestedItems], true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
	if (isClass(configFile >> "CfgPatches" >> "exile_server_xm8")) then
	{
		[
			_requestorUID,
			"Trade Created",
			format[
				"Understood!\nYour trade of **%1** has been created!\nThe following items/vehicles have been listed on MarXet:\n%2\nThank you for using **MarXet**, Exile's leading Player Marketplace and Auction House",
				getText(configFile >> (_tradeClassname call ExileClient_util_gear_getConfigNameByClassName) >> _tradeClassname >> "displayName"),
				_requestedItems call ExileClient_marxet_util_array_formatPretty
			]
		]
		call ExileServer_system_xm8_sendCustom;
	};
}
catch
{
	[_sessionID, "editTradeResponse", [false, _exception]] call ExileServer_system_network_send_to;
	_marxetID call ExileServer_marxet_system_request_trading_unlock;
};
if (!isNil "_playerObject") then
{
	_playerObject setVariable ["ExileMutex", false];
};
