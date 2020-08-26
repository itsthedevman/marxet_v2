/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_sessionID","_package","_marxetID","_playerObject","_entry","_requestorUID","_classname","_playerMoney","_fee","_history","_previousBidderUID","_previousBidAmount","_previousBidderObject","_locker","_itemDisplayName","_traderLog"];
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
	_entry = MarXetAuction getVariable [_marxetID, nil];
	if (isNil "_entry") then
	{
		throw "Invalid Marxet ID";
	};
	if (_marxetID call ExileServer_system_request_trading_isLocked) then
	{
		throw "This item is currently locked. Please try again later";
	};
	_marxetID call ExileServer_marxet_system_request_auction_lock;
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
	format["marxetDeleteListing:%1", _marxetID] call ExileServer_system_database_query_fireAndForget;
	MarxetAuction setVariable [_marxetID, nil, true];
	[_sessionID, "deleteListingResponse", [true, ""]] call ExileServer_system_network_send_to;
	MarXetUpdatePending = true;
	publicVariable "MarXetUpdatePending";
	_history = format["marxetGetHistory:%1", _marxetID] call ExileServer_system_database_query_selectSingleField;
	if !(_history isEqualTo []) then
	{
		_history select (count(_history) - 1) params ["_previousBidderUID", "_previousBidAmount"];
		_previousBidderObject = _previousBidderUID call ExileClient_util_player_objectFromPlayerUID;
		if !(isNull _previousBidderObject) then
		{
			_locker = _previousBidderObject getVariable ["ExileLocker", 0];
			_locker = _locker + _previousBidAmount;
			_previousBidderObject setVariable ["ExileLocker", _locker, true];
			format["updateLocker:%1:%2", _locker, _previousBidderUID] call ExileServer_system_database_query_fireAndForget;
		}
		else
		{
			_locker = format["getLocker:%1", _previousBidderUID] call ExileServer_system_database_query_selectSingleField;
			_locker = _locker + _previousBidAmount;
			format["updateLocker:%1:%2", _locker, _previousBidderUID] call ExileServer_system_database_query_fireAndForget;
		};
		if !(_previousBidderUID isEqualTo getPlayerUID(_playerObject)) then
		{
			_classname = _entry select 3 select 0;
			_itemDisplayName = getText(configFile >> (_classname call ExileClient_util_gear_getConfigNameByClassName) >> _classname >> "displayName");
			if !(isNull _previousBidderObject) then
			{
				[
					_previousBidderObject,
					"toastRequest",
					[
						"WarningTitleAndText",
						[
							"Listing deleted",
							format["Our deepest apologies.<br/>It appears the owner of '%1' decided they did not want to part with said item.<br/>Your current bid of %2 poptabs has been refunded to your locker<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House", _itemDisplayName, _previousBidAmount]
						]
					]
				] call ExileServer_system_network_send_to;
			}
			else
			{
				if (isClass(configFile >> "CfgPatches" >> "exile_server_xm8")) then
				{
					[
						_previousBidderUID,
						"Listing deleted",
						format["Our deepest apologies.\nIt appears the owner of '%1' decided they did not want to part with said item.\nYour current bid of %2 poptabs has been refunded to your locker\nThank you for using MarXet, Exile's leading Player Marketplace and Auction House", _itemDisplayName, _previousBidAmount]
					]
					call ExileServer_system_xm8_sendCustom;
				};
			};
		};
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2) DELETED A TRADE LISTING. ID: %3. TRADE ITEM/VEHICLE: %4.",
			_playerObject,
			getPlayerUID(_playerObject),
			_marxetID,
			_classname
		];
		"extDB3" callExtension format["1:TRADING:%1",_traderLog];
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToDiscord") isEqualTo 1) then
	{
		[
			"success",
			"embed",
			[
				"Listing Deleted",
				"",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _marxetID, true],
					["Auction For", _classname, true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
}
catch
{
	_marxetID call ExileServer_marxet_system_request_auction_unlock;
	[_sessionID, "deleteListingResponse", [false, _exception]] call ExileServer_system_network_send_to;
};
if (!isNil "_playerObject") then
{
	_playerObject setVariable ["ExileMutex", false];
};
