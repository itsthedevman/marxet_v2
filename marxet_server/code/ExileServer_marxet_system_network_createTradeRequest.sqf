/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_sessionID", "_package", "_tradeClassname", "_tradeInfo", "_requestedItems", "_showName", "_containerType", "_containerNetID", "_playerObject", "_id", "_itemProperties", "_vehicleObject", "_vehiclePosition", "_items", "_magazines", "_weapons", "_containers", "_popTabs", "_groundHolder", "_popTabsObject", "_removed", "_money", "_respect", "_vehicle", "_dbPackage", "_traderLog"];
_sessionID = _this select 0;
_package = _this select 1;
_tradeClassname = (_package select 0) select 0;
_tradeInfo = (_package select 0) select 1;
_requestedItems = _package select 1;
_showName = _package select 2;
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
	if (_tradeClassname isKindOf "AllVehicles") then 
	{
		_vehicleObject = objectFromNetId(_tradeInfo);
		if (isNull(_vehicleObject) || !(alive _vehicleObject)) then 
		{
			throw "Vehicle is null or destroyed";
		};
		_itemProperties = getAllHitPointsDamage(_vehicleObject);
		_vehiclePosition = getPosATL _vehicleObject;
		_items = _vehicleObject call ExileServer_util_getItemCargo;
		_magazines = magazinesAmmoCargo _vehicleObject;
		_weapons = weaponsItemsCargo _vehicleObject;
		_containers =_vehicleObject call ExileServer_util_getObjectContainerCargo;
		_popTabs = _vehicleObject getVariable ["ExileMoney", 0];
		_groundHolder = createVehicle ["GroundWeaponHolder",_vehiclePosition, [], 0, "CAN_COLLIDE"];
		_groundHolder setPosATL _vehiclePosition;
		if (_popTabs > 0 ) then
		{
			_popTabsObject = createVehicle ["Exile_PopTabs", _vehiclePosition, [], 0, "CAN_COLLIDE"];
			_popTabsObject setVariable ["ExileMoney", _popTabs, true];
			_vehicleObject setVariable ["ExileMoney", 0, true];
		};
		[_groundHolder, _items] call ExileServer_util_fill_fillItems;
		[_groundHolder, _magazines] call ExileServer_util_fill_fillMagazines;
		[_groundHolder, _weapons] call ExileServer_util_fill_fillWeapons;
		[_groundHolder, _containers] call ExileServer_util_fill_fillContainers;
		_vehicleObject call ExileClient_util_containerCargo_clear;
		_vehicleObject call ExileServer_object_vehicle_database_update;
		format["marxetRestrictVehicle:%1:%2", _id, _vehicleObject getVariable ["ExileDatabaseID", -1]] call ExileServer_system_database_query_fireAndForget;
		_vehicleObject call ExileServer_system_vehicleSaveQueue_removeVehicle;
		_vehicleObject call ExileServer_system_simulationMonitor_removeVehicle;
		deleteVehicle _vehicleObject;
	}
	else
	{
		_removed = false;
		switch (_tradeClassname) do 
		{
			case "ExileMoney": 
			{
				_money = _playerObject getVariable ["ExileMoney", 0];
				_money = _money - parseNumber(_tradeInfo);
				_playerObject setVariable ["ExileMoney", _money, true];
				_itemProperties = [parseNumber(_tradeInfo)];
				format["setPlayerMoney:%1:%2", _money, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
				_removed = true;
			};
			case "ExileScore": 
			{
				_respect = _playerObject getVariable ["ExileScore", 0];
				_respect = _respect - parseNumber(_tradeInfo);
				_playerObject setVariable ["ExileScore", _respect];
				_itemProperties = [parseNumber(_tradeInfo)];
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
						_removed = [_playerObject, _tradeClassname] call ExileClient_util_playerCargo_remove;
					};
					case 2:
					{
						_removed = [(uniformContainer _playerObject), _tradeClassname] call ExileClient_util_containerCargo_remove;
					};
					case 3:
					{
						_removed = [(vestContainer _playerObject), _tradeClassname] call ExileClient_util_containerCargo_remove;
					};
					case 4:
					{
						_removed = [(backpackContainer _playerObject), _tradeClassname] call ExileClient_util_containerCargo_remove;
					};
					case 5:
					{
						_vehicle = objectFromNetId _containerNetID;
						_removed = [_vehicle, _tradeClassname] call ExileClient_util_containerCargo_remove;
					};
				};
			};
		};
		if !(_removed) then 
		{
			throw "Failed to remove trade item/money/respect";
		};
	};
	MarXetTrading setVariable 
	[
		_id, 
		[
			false,
			[
				getPlayerUID(_playerObject),
				name(_playerObject),
				_showName
			],
			[] call ExileServer_util_time_currentTime,
			[
				_tradeClassname,
				_itemProperties
			],
			_requestedItems
		], 
		true
	];
	_dbPackage = 
	[
		"marxetCreateTrade", 
		[
			_id,
			getPlayerUID(_playerObject),
			parseNumber(_showName),
			_tradeClassname,
			_itemProperties,
			_requestedItems
		]
	] 
	call ExileServer_util_extDB2_createMessage;
	_dbPackage call ExileServer_system_database_query_insertSingle;
	[_sessionID, "createTradeResponse", [true, _tradeClassname]] call ExileServer_system_network_send_to;
	MarXetUpdatePending = true;
	publicVariable "MarXetUpdatePending";
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2) CREATED A TRADE REQUEST. ID: %3. TRADE ITEM/VEHICLE: %4. REQUESTED ITEMS/VEHICLES: %5", 
			_playerObject, 
			getPlayerUID(_playerObject),
			_id,
			_tradeClassname,
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
				"Trade Created",
				"",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _id, true],
					["Trading For", _tradeClassname, true],
					["Requested Items/Vehicles", format["```%1```", _requestedItems], true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
	if (isClass(configFile >> "CfgPatches" >> "exile_server_xm8")) then 
	{
		[
			getPlayerUID(_playerObject),
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
	[_sessionID, "createTradeResponse", [false, _exception]] call ExileServer_system_network_send_to;
};
if (!isNil "_playerObject") then 
{
	_playerObject setVariable ["ExileMutex", false];
};