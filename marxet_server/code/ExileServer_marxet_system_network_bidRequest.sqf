/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_sessionID","_package","_marxetID","_bidAmount","_playerObject","_entry","_ended","_currentBid","_playerMoney","_currentCount","_history","_previousBidderUID","_previousBidAmount","_previousBidderObject","_locker","_classname","_itemDisplayName"];
_sessionID = _this select 0;
_package = _this select 1;
_marxetID = _package select 0;
_bidAmount = parseNumber(_package select 1);
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
		throw "Invalid auction ID";
	};
	if (((_entry select 1) select 0) isEqualTo getPlayerUID(_playerObject)) then
	{
		throw "You cannot bid on your own auction";
	};
	_ended = (((_entry select 4) select 0) call ExileClient_marxet_util_time_sync) <= 0;
	if (_ended) then
	{
		throw "The bidding for this item has closed";
	};
	_currentBid = (_entry select 4) select 1;
	_playerMoney = _playerObject getVariable ["ExileMoney", 0];
	if (_bidAmount > _playerMoney) then
	{
		throw "You do not have enough money";
	};
	if (_bidAmount <= _currentBid) then
	{
		throw "Your bid is too low, please bid at least 1 poptab above the current bid";
	};
	_playerMoney = _playerMoney - _bidAmount;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	_currentCount = ((_entry select 4) select 2) + 1;
	(_entry select 4) set [1, _bidAmount];
	(_entry select 4) set [2, _currentCount];
	(_entry select 4) set [3, getPlayerUID(_playerObject)];
	MarXetAuction setVariable [_marxetID, _entry, true];
	format["marxetAddBid:%1:%2:%3:%4", _bidAmount, _currentCount, getPlayerUID(_playerObject), _marxetID] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "bidResponse", [true, ""]] call ExileServer_system_network_send_to;
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
				[_previousBidderObject, "toastRequest", ["WarningTitleAndText", ["Control Lost", format["You've lost bidding control over %1. Your previous bid of %2 has been added to your locker<br/>Bid more than %3 poptabs to gain control back!", _itemDisplayName, _previousBidAmount, _bidAmount]]]] call ExileServer_system_network_send_to;
			}
			else
			{
				if (isClass(configFile >> "CfgPatches" >> "exile_server_xm8")) then
				{
					[
						_previousBidderUID,
						"Bid Control Lost!",
						format["You've lost bidding control over %1. Your previous bid of %2 has been added to your locker\nBid more than %3 poptabs to gain control back!", _itemDisplayName, _previousBidAmount, _bidAmount]
					]
					call ExileServer_system_xm8_sendCustom;
				};
			};
		};
	};
	_history pushBack ([getPlayerUID(_playerObject), _bidAmount]);
	format["marxetUpdateHistory:%1:%2", _history, _marxetID] call ExileServer_system_database_query_fireAndForget;
}
catch
{
	[_sessionID, "bidResponse", [false, _exception]] call ExileServer_system_network_send_to;
};
_marxetID call ExileServer_marxet_system_request_auction_unlock;
if (!isNil "_playerObject") then
{
	_playerObject setVariable ["ExileMutex", false];
};
