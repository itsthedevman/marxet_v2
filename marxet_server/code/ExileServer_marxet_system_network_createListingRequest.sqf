/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_sessionID","_package","_listingClassname","_listingInfo","_startingAmount","_auctionLength","_containerType","_containerNetID","_playerObject","_id","_itemProperties","_removed","_respect","_vehicle","_endTime","_dbPackage","_traderLog"];
_sessionID = _this select 0;
_package = _this select 1;
_listingClassname = (_package select 0) select 0;
_listingInfo = (_package select 0) select 1;
_startingAmount = _package select 1;
_auctionLength = _package select 2;
_containerType = _package select 3;
_containerNetID = _package select 4;
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
	_id = [] call ExileServer_marxet_system_request_generateID;
	if (_id isEqualTo "") then
	{
		throw "Failed to generate ID";
	};
	_itemProperties = [];
	_removed = false;
	switch (_listingClassname) do
	{
		case "ExileScore":
		{
			_respect = _playerObject getVariable ["ExileScore", 0];
			_respect = _respect - parseNumber(_listingInfo);
			_playerObject setVariable ["ExileScore", _respect];
			_itemProperties = [parseNumber(_listingInfo)];
			format["setAccountScore:%1:%2", _respect, getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
			[_sessionID, "updateRespect", [_respect]] call ExileServer_system_network_send_to;
			_removed = true;
		};
		default
		{
			switch (_containerType) do
			{
				case 1:
				{
					_removed = [_playerObject, _listingClassname] call ExileClient_util_playerCargo_remove;
				};
				case 2:
				{
					_removed = [(uniformContainer _playerObject), _listingClassname] call ExileClient_util_containerCargo_remove;
				};
				case 3:
				{
					_removed = [(vestContainer _playerObject), _listingClassname] call ExileClient_util_containerCargo_remove;
				};
				case 4:
				{
					_removed = [(backpackContainer _playerObject), _listingClassname] call ExileClient_util_containerCargo_remove;
				};
				case 5:
				{
					_vehicle = objectFromNetId _containerNetID;
					_removed = [_vehicle, _listingClassname] call ExileClient_util_containerCargo_add;
				};
			};
		};
	};
	if !(_removed) then
	{
		throw "Failed to remove trade item/money/respect";
	};
	_endTime = parseSimpleArray ("extDB3" callExtension format[
		"9:DATEADD:%1:[%2,%3,%4,0]",
		"marxetCurrentDate" call ExileServer_system_database_query_selectSingleField,
		_auctionLength select 0,
		_auctionLength select 1,
		_auctionLength select 2
	]) select 1;
	MarXetAuction setVariable
	[
		_id,
		[
			false,
			[
				getPlayerUID(_playerObject),
				name(_playerObject)
			],
			[] call ExileServer_util_time_currentTime,
			[
				_listingClassname,
				_itemProperties
			],
			[
				_endTime call ExileClient_marxet_util_time_convert,
				_startingAmount,
				0,
				""
			]
		],
		true
	];
	_dbPackage =
	[
		"marxetCreateListing",
		[
			_id,
			getPlayerUID(_playerObject),
			_listingClassname,
			_itemProperties,
			_startingAmount,
			_startingAmount,
			_endTime
		]
	]
	call ExileServer_util_extDB2_createMessage;
	_dbPackage call ExileServer_system_database_query_insertSingle;
	[_sessionID, "createListingResponse", [true, _listingClassname]] call ExileServer_system_network_send_to;
	MarXetUpdatePending = true;
	publicVariable "MarXetUpdatePending";
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2) CREATED A LISTING. ID: %3. LISTING ITEM: %4. STARTING PRICE %5. ENDING DATE: %6",
			_playerObject,
			getPlayerUID(_playerObject),
			_id,
			_startingAmount,
			_endTime call ExileClient_marxet_util_time_pretty
		];
		"extDB3" callExtension format["1:TRADING:%1",_traderLog];
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToDiscord") isEqualTo 1) then
	{
		[
			"success",
			"embed",
			[
				"Listing Created",
				"",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _id, true],
					["Trading For", _listingClassname, true],
					["Starting Price", _startingAmount, true],
					["End date", _endTime call ExileClient_marxet_util_time_pretty, true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
}
catch
{
	[_sessionID, "createListingResponse", [false, _exception]] call ExileServer_system_network_send_to;
};
if (!isNil "_playerObject") then
{
	_playerObject setVariable ["ExileMutex", false];
};
