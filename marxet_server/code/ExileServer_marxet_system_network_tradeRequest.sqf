/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_sessionID","_package","_marxetID","_pincode","_containerType","_containerNetID","_vehicleNetIDs","_position","_sentToSafex","_playerObject","_entry","_tradeClassname","_isVehicle","_index","_vehicleCost","_rekeyCost","_amount","_hasAllRequested","_classname","_quantity","_hasItem","_cargo","_overallHealth","_damaged","_vehicleClass","_helipad","_vehiclesModified","_money","_respect","_displayName","_databaseID","_vehicleObject","_added","_vehicle","_requestorUID","_requestorObject","_vehicleInfo","_traderLog"];
_sessionID = _this select 0;
_package = _this select 1;
_marxetID = _package select 0;
_pincode = _package select 1;
_containerType = _package select 2;
_containerNetID = _package select 3;
_vehicleNetIDs = _package select 4;
_position = [];
_sentToSafex = false;
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
	_entry = MarXetTrading getVariable [_marxetID, []];
	if (_entry isEqualTo []) then
	{
		throw "Invalid listing ID";
	};
	if (_marxetID call ExileServer_system_request_trading_isLocked) then
	{
		throw "This item is currently locked. Please try again later";
	};
	_marxetID call ExileServer_marxet_system_request_trading_lock;
	_tradeClassname = (_entry select 3) select 0;
	_isVehicle = _tradeClassname isKindOf "AllVehicles";
	if (_isVehicle) then
	{
		if (_pincode isEqualTo "") then
		{
			throw "Empty Pin Code";
		};
		if !(([_pincode, "1234567890"] call ExileClient_util_string_containsForbiddenCharacter) isEqualTo -1) then
		{
			throw "Pincode contains illegal character";
		};
		if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "addRekeyFee") isEqualTo 1) then
		{
			_index = -1;
			_vehicleCost = getNumber (missionConfigFile >> "CfgExileArsenal" >> _tradeClassname >> "price");
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
	_hasAllRequested = [];
	{
		_classname = _x select 0;
		_quantity = _x select 1;
		switch (_classname) do
		{
			case "ExileMoney":
			{
				_hasItem = (_playerObject getVariable ["ExileMoney", 0]) >= _quantity;
			};
			case "ExileScore":
			{
				_hasItem = ExileClientPlayerScore >= _quantity;
			};
			default
			{
				_cargo = (_playerObject call ExileClient_util_playerCargo_list) call ExileClient_util_array_toLower;
				{
					if ((owner _x) isEqualTo (owner _playerObject) && {alive _x}) then
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
				forEach (nearestObjects [_playerObject, ["LandVehicle", "Air", "Ship"], 80]);
				_hasItem = ({ _x isEqualTo toLower(_classname) } count _cargo) >= _quantity;
			};
		};
		_hasAllRequested pushBack (_hasItem && !_damaged);
	}
	forEach (_entry select 4);
	if !(({_x} count _hasAllRequested) isEqualTo count(_hasAllRequested)) then
	{
		throw "Missing one or more requested items/vehicles";
	};
	if (_isVehicle) then
	{
		if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "Static" >> "useStaticSpawning") isEqualTo 1) then
		{
			if (_vehicleClass isKindOf "Ship") then
            {
                _helipad = nearestObject [(getPosATL _playerObject), getText(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "Static" >> "boatSpawnClassname")];
			}
            else
            {
                if (_vehicleClass isKindOf "Air") then
                {
                    _helipad = nearestObject [(getPosATL _playerObject), getText(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "Static" >> "airSpawnClassname")];
                }
                else
                {
                    _helipad = nearestObject [(getPosATL _playerObject), getText(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "Static" >> "landSpawnClassname")];
                };
            };
			if !(isNull _helipad) then
			{
				_position = (getPosATL _helipad);
				_position set [2,0];
			};
		}
		else
		{
			if (_vehicleClass isKindOf "Ship") then
            {
                _position = [(getPosATL _playerObject), 80, 10] call ExileClient_util_world_findWaterPosition;
            }
            else
            {
                _position = (getPos _playerObject) findEmptyPosition [10, 175, _vehicleClass];
            };
		};
		if (_position isEqualTo []) then
		{
			throw "Unable to find suitable position for spawning";
		};
	};
	_vehiclesModified = [];
	{
		_classname = _x select 0;
		_quantity = _x select 1;
		switch (_classname) do
		{
			case "ExileMoney":
			{
				_money = _playerObject getVariable ["ExileMoney", 0];
				_money = _money - _quantity;
				_playerObject setVariable ["ExileMoney", _money, true];
				format["setPlayerMoney:%1:%2", _money, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
			};
			case "ExileScore":
			{
				_respect = _playerObject getVariable ["ExileScore", 0];
				_respect = _respect - _quantity;
				_playerObject setVariable ["ExileScore", _respect];
				format["setAccountScore:%1:%2", _respect, getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
				[_sessionID, "updateRespect", [_respect]] call ExileServer_system_network_send_to;
			};
			default
			{
				try
				{
					if ([_playerObject, _classname] call ExileClient_util_playerEquipment_contains) then
					{
						throw [_playerObject, _classname] call ExileClient_util_playerEquipment_remove;
					};
					if (_classname in (_playerObject call ExileClient_util_playerCargo_list)) then
					{
						throw [_playerObject, _classname] call ExileClient_util_playerCargo_remove;
					};
					{
						if ((owner _x) isEqualTo (owner _playerObject) && {alive _x}) then
						{
							if (_classname in (_x call ExileClient_util_containerCargo_list)) then
							{
								_vehiclesModified pushBack _x;
								throw [_x, _classname] call ExileClient_util_containerCargo_remove;
							};
						};
					}
					forEach (nearestObjects [_playerObject, ["LandVehicle", "Air", "Ship"], 80]);
				}
				catch {};
			};
		};
	}
	forEach (_entry select 4);
	_playerObject call ExileServer_object_player_database_update;
	{ _x call ExileServer_object_vehicle_database_update } forEach _vehiclesModified;
	_displayName = getText(configFile >> (_tradeClassname call ExileClient_util_gear_getConfigNameByClassName) >> _tradeClassname >> "displayName");
	if (_isVehicle) then
	{
		_databaseID = _marxetID call ExileServer_marxet_object_vehicle_getID;
		_vehicleObject = _databaseID call ExileServer_object_vehicle_database_load;
		_vehicleObject setPosATL _position;
		_vehicleObject setVariable ["ExileAccessCode", _pincode];
		_vehicleObject setVariable ["ExileOwnerUID", getPlayerUID(_playerObject)];
		_vehicleObject call ExileServer_object_vehicle_database_update;
		format["marxetUpdateVehicle:%1:%2", _databaseID, getPlayerUID(_playerObject)] call ExileServer_system_database_query_fireAndForget;
	}
	else
	{
		_added = false;
		switch (_tradeClassname) do
		{
			case "ExileMoney":
			{
				_money = _playerObject getVariable ["ExileMoney", 0];
				_money = _money + (((_entry select 3) select 1) select 0);
				_playerObject setVariable ["ExileMoney", _money, true];
				format["setPlayerMoney:%1:%2", _money, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
				_added = true;
				_displayName = format["%1 Poptabs", (((_entry select 3) select 1) select 0)];
			};
			case "ExileScore":
			{
				_respect = _playerObject getVariable ["ExileScore", 0];
				_respect = _respect + (((_entry select 3) select 1) select 0);
				_playerObject setVariable ["ExileScore", _respect];
				format["setAccountScore:%1:%2", _respect, getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
				[_sessionID, "updateRespect", [_respect]] call ExileServer_system_network_send_to;
				_added = true;
				_displayName = format["%1 Respect", (((_entry select 3) select 1) select 0)];
			};
			default
			{
				switch (_containerType) do
				{
					case 1:
					{
						_added = [_playerObject, _tradeClassname] call ExileClient_util_playerCargo_add;
					};
					case 2:
					{
						_added = [(uniformContainer _playerObject), _tradeClassname] call ExileClient_util_containerCargo_add;
					};
					case 3:
					{
						_added = [(vestContainer _playerObject), _tradeClassname] call ExileClient_util_containerCargo_add;
					};
					case 4:
					{
						_added = [(backpackContainer _playerObject), _tradeClassname] call ExileClient_util_containerCargo_add;
					};
					case 5:
					{
						_vehicle = objectFromNetId _containerNetID;
						_added = [_vehicle, _tradeClassname] call ExileClient_util_containerCargo_add;
					};
				};
			};
		};
		if !(_added) then
		{
			[getPlayerUID(_playerObject), [_tradeClassname]] call ExileServer_system_safex_addItem;
			_sentToSafex = true;
		};
	};
	[_sessionID, "tradeResponse", [true, _tradeClassname, _sentToSafex, _pincode]] call ExileServer_system_network_send_to;
	_entry = MarXetTrading getVariable [_marxetID, []];
	_requestorUID = (_entry select 1) select 0;
	_requestorObject = _requestorUID call ExileClient_util_player_objectFromPlayerUID;
	{
		_classname = _x select 0;
		_quantity = _x select 1;
		if (_classname isKindOf "AllVehicles") then
		{
			_vehicleInfo = { if (toLower(typeOf(objectFromNetID(_x))) isEqualTo toLower(_classname)) exitWith { [_x, _forEachIndex] } } forEach _vehicleNetIDs;
			_vehicle = objectFromNetID(_vehicleInfo select 0);
			[_requestorUID, [_classname, _vehicle getVariable ["ExileDatabaseID", -1]]] call ExileServer_system_safex_addVehicle;
			_vehicleNetIDs deleteAt (_vehicleInfo select 1);
		}
		else
		{
			[_requestorUID, [_classname, _quantity]] call ExileServer_system_safex_addItem;
		};
	}
	forEach (_entry select 4);
	if !(isNull _requestorObject) then
	{
		[
			_requestorObject,
			"toastRequest",
			[
				"SuccessTitleAndText",
				[
					"Trade Complete",
					format[
						"Your trade of %1 has just been completed.<br/>The requested items have been deposited in your SafeX<br/>Thank you for using Mar<t font='PuristaBold' color='#C72651'>X</t>et, Exile's leading Player Marketplace and Auction House",
						_displayName
					]
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
				_requestorUID,
				"Trade Completed",
				format[
					"Greetings!\nYour trade of **%1** has just been completed.\nThe following item(s)/vehicle(s) have been deposited in your **SafeX**:\n%2\nThank you for using **MarXet**, Exile's leading Player Marketplace and Auction House",
					_displayName,
					(_entry select 4) call ExileClient_marxet_util_array_formatPretty
				]
			]
			call ExileServer_system_xm8_sendCustom;
		};
	};
	if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Logging" >> "logToFile") isEqualTo 1) then
	{
		_traderLog = format [
			"PLAYER %1 (%2) COMPLETED A TRADE REQUEST. ID: %3. REQUESTOR UID: %4. TRADE ITEM/VEHICLE: %5. REQUESTED ITEMS/VEHICLES: %6",
			_playerObject,
			getPlayerUID(_playerObject),
			_marxetID,
			_requestorUID,
			_tradeClassname,
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
				"Trade Completed",
				"",
				[
					["Player Name (UID)", format["%1 (%2)", name _playerObject, getPlayerUID(_playerObject)], true],
					["MarXet ID", _marxetID, true],
					["Requestor's UID", _requestorUID, true],
					["Trading For", _tradeClassname, true],
					["Requested Items/Vehicles", format["```%1```", _entry select 4], true]
				]
			]
		]
		call ESM_fnc_logToDiscord;
	};
	[_marxetID, getPlayerUID(_playerObject)] call ExileServer_marxet_system_request_trading_complete;
}
catch
{
	_marxetID call ExileServer_marxet_system_request_trading_unlock;
	[_sessionID, "tradeResponse", [false, _exception, false, ""]] call ExileServer_system_network_send_to;
};
if (!isNil "_playerObject") then
{
	_playerObject setVariable ["ExileMutex", false];
};
