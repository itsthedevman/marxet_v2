/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_id", "_entry", "_classname", "_finalBid", "_displayName", "_configName", "_playerUID", "_playerObject", "_respect", "_quantity", "_traderLog", "_tradeClassname", "_locker", "_winningBidderUID", "_winningBidderObject"];
_id = _this;
_entry = MarXetAuction getVariable [_id, []];
if (_entry isEqualTo []) exitWith {};
_classname = (_entry select 3) select 0;
_finalBid = (_entry select 4) select 1;
_displayName = "";
switch (_classname) do 
{
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
_playerUID = (_entry select 1) select 0;
_playerObject = _playerUID call ExileClient_util_player_objectFromPlayerUID;
if (((_entry select 4) select 2) isEqualTo 0 && ((_entry select 4) select 3) isEqualTo "") then 
{
	switch (_classname) do 
	{
		case "ExileScore": 
		{
			_respect = 0;
			if (isNull _playerObject) then 
			{
				_respect = format["getAccountScore:%1", _playerUID] call ExileServer_system_database_query_selectSingleField;
				_respect = _respect + _quantity;
			}
			else
			{
				_respect = _playerObject getVariable ["ExileScore", 0];
				_respect = _respect + _quantity;
				_playerObject setVariable ["ExileScore", _respect];
				[_playerObject, "updateRespect", [_respect]] call ExileServer_system_network_send_to;
			};
			format["setAccountScore:%1:%2", _respect, _playerUID] call ExileServer_system_database_query_fireAndForget;
		};
		default
		{
			format["%1. Sending to %2's SafeX: %3", _id, _playerUID, _classname] call ExileServer_marxet_util_log;
			[_playerUID, [_classname]] call ExileServer_system_safex_addItem;
		};
	};
	if !(isNull _playerObject) then 
	{
		[
			_playerObject, 
			"toastRequest", 
			[
				"SuccessTitleAndText", 
				[
					"Listing closed", 
					format["Our deepest apologies, it appears nobody took interest in your listing. %1 has been deposited in your SafeX (or Respect)<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House", _displayName]
				]
			] 
		]
		call ExileServer_system_network_send_to;
	}
	else
	{
		if (isClass(configFile >> "CfgPatches" >> "exile_server_xm8")) then 
		{
			[
				_playerUID,
				"Listing Closed",
				format["Our deepest apologies, it appears nobody took interest in your listing. %1 has been deposited in your SafeX (or Respect)\nThank you for using MarXet, Exile's leading Player Marketplace and Auction House", _displayName]
			] 
			call ExileServer_system_xm8_sendCustom;
		};
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2)'S LISTING HAS CLOSED OUT. ID: %3. TRADE ITEM/VEHICLE: %4. NOBODY TOOK INTEREST", 
			format["getPlayerName:%1", _playerUID] call ExileServer_system_database_query_selectSingleField, 
			_playerUID,
			_id,
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
				"Listing Closed",
				"This item was returned to the creator",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _id, true],
					["Trading For", _tradeClassname, true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
}
else
{
	_locker = 0;
	if !(isNull _playerObject) then 
	{
		_locker = _playerObject getVariable ["ExileLocker", 0];
		_locker = _locker + _finalBid;
		_playerObject setVariable ["ExileLocker", _locker, true];
		[
			_playerObject, 
			"toastRequest", 
			[
				"SuccessTitleAndText", 
				[
					"Listing Closed!", 
					format["Congrats!<br/>Your listing of '%1' has closed. %2 poptabs have been deposited in your Locker<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House", _displayName, _finalBid]
				]
			] 
		]
		call ExileServer_system_network_send_to;
	}
	else
	{
		_locker = format["getLocker:%1", _playerUID] call ExileServer_system_database_query_selectSingleField;
		_locker = _locker + _finalBid;
		if (isClass(configFile >> "CfgPatches" >> "exile_server_xm8")) then 
		{
			[
				_playerUID,
				"Listing Closed",
				format["Congrats!\nYour listing of '%1' has closed. %2 poptabs have been deposited in your Locker\nThank you for using MarXet, Exile's leading Player Marketplace and Auction House", _displayName, _finalBid]
			] 
			call ExileServer_system_xm8_sendCustom;
		};
	};
	format["updateLocker:%1:%2", _locker, _playerUID] call ExileServer_system_database_query_fireAndForget;
	_winningBidderUID = (_entry select 4) select 3;
	_winningBidderObject = _winningBidderUID call ExileClient_util_player_objectFromPlayerUID;
	switch (_classname) do 
	{
		case "ExileScore": 
		{
			_respect = 0;
			if (isNull _winningBidderObject) then 
			{
				_respect = format["getAccountScore:%1", _winningBidderUID] call ExileServer_system_database_query_selectSingleField;
				_respect = _respect + _quantity;
			}
			else
			{
				_respect = _winningBidderObject getVariable ["ExileScore", 0];
				_respect = _respect + _quantity;
				_winningBidderObject setVariable ["ExileScore", _respect];
				[_winningBidderObject, "updateRespect", [_respect]] call ExileServer_system_network_send_to;
			};
			format["setAccountScore:%1:%2", _respect, _winningBidderUID] call ExileServer_system_database_query_fireAndForget;
		};
		default
		{
			format["%1. Sending to %2's SafeX: %3", _id, _winningBidderUID, _classname] call ExileServer_marxet_util_log;
			[_winningBidderUID, [_classname]] call ExileServer_system_safex_addItem;
		};
	};
	if !(isNull _winningBidderObject) then 
	{
		[
			_winningBidderObject, 
			"toastRequest", 
			[
				"SuccessTitleAndText", 
				[
					"Listing Won!", 
					format["Congrats!<br/>An item you bidded on closed and you won! %1 has been deposited in your SafeX<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House", _displayName]
				]
			] 
		]
		call ExileServer_system_network_send_to;
	}
	else
	{
		if (isClass(configFile >> "CfgPatches" >> "exile_server_xm8")) then 
		{
			[
				_playerUID,
				"Listing Closed",
				format["Congrats!\nAn item you bidded on closed and you won! %1 has been deposited in your SafeX\nThank you for using MarXet, Exile's leading Player Marketplace and Auction House", _displayName]
			] 
			call ExileServer_system_xm8_sendCustom;
		};
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2)'S LISTING HAS CLOSED OUT. ID: %3. TRADE ITEM/VEHICLE: %4. WINNER UID: %5. FINAL BID: %6", 
			format["getPlayerName:%1", _playerUID] call ExileServer_system_database_query_selectSingleField, 
			_playerUID,
			_id,
			_classname,
			_winningBidderUID,
			_finalBid
		];
		"extDB3" callExtension format["1:TRADING:%1",_traderLog];
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToDiscord") isEqualTo 1) then
	{
		[
			"success", 
			"embed", 
			[
				"Listing Closed",
				"",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _id, true],
					["Trading For", _tradeClassname, true],
					["Winner UID", _winningBidderUID, true],
					["Final Bid", _finalBid, true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
};
format["marxetCloseAuction:%1", _id] call ExileServer_system_database_query_fireAndForget;
MarXetAuction setVariable [_id, nil, true];
MarXetUpdatePending = true;
publicVariable "MarXetUpdatePending";