/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    if (isText (missionConfigFile >> 'CfgExileCustomCode' >> _function)) then
    {
        _file = getText (missionConfigFile >> 'CfgExileCustomCode' >> _function);
    };

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach
[
	['ExileServer_marxet_object_vehicle_getID', 'marxet_server\code\ExileServer_marxet_object_vehicle_getID.sqf'],
	['ExileServer_marxet_system_closeAuctions', 'marxet_server\code\ExileServer_marxet_system_closeAuctions.sqf'],
	['ExileServer_marxet_system_timeSync', 'marxet_server\code\ExileServer_marxet_system_timeSync.sqf'],
	['ExileServer_marxet_system_network_bidRequest', 'marxet_server\code\ExileServer_marxet_system_network_bidRequest.sqf'],
	['ExileServer_marxet_system_network_createListingRequest', 'marxet_server\code\ExileServer_marxet_system_network_createListingRequest.sqf'],
	['ExileServer_marxet_system_network_createTradeRequest', 'marxet_server\code\ExileServer_marxet_system_network_createTradeRequest.sqf'],
	['ExileServer_marxet_system_network_deleteListingRequest', 'marxet_server\code\ExileServer_marxet_system_network_deleteListingRequest.sqf'],
	['ExileServer_marxet_system_network_deleteTradeRequest', 'marxet_server\code\ExileServer_marxet_system_network_deleteTradeRequest.sqf'],
	['ExileServer_marxet_system_network_editTradeRequest', 'marxet_server\code\ExileServer_marxet_system_network_editTradeRequest.sqf'],
	['ExileServer_marxet_system_network_tradeRequest', 'marxet_server\code\ExileServer_marxet_system_network_tradeRequest.sqf'],
	['ExileServer_marxet_system_process_compileClientPackage', 'marxet_server\code\ExileServer_marxet_system_process_compileClientPackage.sqf'],
	['ExileServer_marxet_system_process_postInit', 'marxet_server\code\ExileServer_marxet_system_process_postInit.sqf'],
	['ExileServer_marxet_system_request_generateID', 'marxet_server\code\ExileServer_marxet_system_request_generateID.sqf'],
	['ExileServer_marxet_system_request_auction_close', 'marxet_server\code\ExileServer_marxet_system_request_auction_close.sqf'],
	['ExileServer_marxet_system_request_auction_isLocked', 'marxet_server\code\ExileServer_marxet_system_request_auction_isLocked.sqf'],
	['ExileServer_marxet_system_request_auction_lock', 'marxet_server\code\ExileServer_marxet_system_request_auction_lock.sqf'],
	['ExileServer_marxet_system_request_auction_unlock', 'marxet_server\code\ExileServer_marxet_system_request_auction_unlock.sqf'],
	['ExileServer_marxet_system_request_trading_complete', 'marxet_server\code\ExileServer_marxet_system_request_trading_complete.sqf'],
	['ExileServer_marxet_system_request_trading_isLocked', 'marxet_server\code\ExileServer_marxet_system_request_trading_isLocked.sqf'],
	['ExileServer_marxet_system_request_trading_lock', 'marxet_server\code\ExileServer_marxet_system_request_trading_lock.sqf'],
	['ExileServer_marxet_system_request_trading_unlock', 'marxet_server\code\ExileServer_marxet_system_request_trading_unlock.sqf'],
	['ExileServer_marxet_util_log', 'marxet_server\code\ExileServer_marxet_util_log.sqf']
];


true
