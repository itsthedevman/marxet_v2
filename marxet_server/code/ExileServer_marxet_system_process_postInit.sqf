/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_entries"];
"Starting initialization" call ExileServer_marxet_util_log;
MarXetTrading = createSimpleObject ["Static", [-1000, -1000, 0]];
MarXetAuction = createSimpleObject ["Static", [-1000, -1000, 0]];
MarXetIDs = [];
{
	MarXetIDs pushBack (_x select 0);
}
forEach ("marxetLoadIDs" call ExileServer_system_database_query_selectFull);
_entries = "marxetLoadTrading" call ExileServer_system_database_query_selectFull;
{
	MarXetTrading setVariable
	[
		_x select 1,
		[
			false,
			[
				_x select 2,
				format["getPlayerName:%1", _x select 2] call ExileServer_system_database_query_selectSingleField,
				_x select 3
			],
			_x select 8,
			[
				_x select 4,
				_x select 5
			],
			_x select 6
		],
		true
	];
}
forEach _entries;
format["%1 entries loaded into trading inventory", count(_entries)] call ExileServer_marxet_util_log;
_entries = "marxetLoadAuction" call ExileServer_system_database_query_selectFull;
{
	MarXetAuction setVariable
	[
		_x select 1,
		[
			false,
			[
				_x select 2,
				format["getPlayerName:%1", _x select 2] call ExileServer_system_database_query_selectSingleField
			],
			_x select 11,
			[
				_x select 3,
				_x select 4
			],
			[
				(_x select 10) call ExileClient_marxet_util_time_convert,
				_x select 6,
				_x select 7,
				_x select 8
			]
		],
		true
	];
}
forEach _entries;
format["%1 entries loaded into auction inventory", count(_entries)] call ExileServer_marxet_util_log;
publicVariable "MarXetTrading";
publicVariable "MarXetAuction";
[] call ExileServer_marxet_system_process_compileClientPackage;
MarXetTimeDifference = 0;
publicVariable "MarXetTimeDifference";
MarXetTimeSynced = false;
publicVariable "MarXetTimeSynced";
[60, ExileServer_marxet_system_timeSync, [], true] call ExileServer_system_thread_addTask;
[1, ExileServer_marxet_system_closeAuctions, [], true] call ExileServer_system_thread_addTask;
"Initialization completed" call ExileServer_marxet_util_log;