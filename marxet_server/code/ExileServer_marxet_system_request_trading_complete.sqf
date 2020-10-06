/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_entry"];
_entry = MarXetTrading getVariable [_this select 0, []];
if (_entry isEqualTo []) exitWith {};
format["marxetCompleteTrade:%1:%2", _this select 1, _this select 0] call ExileServer_system_database_query_fireAndForget;
MarXetTrading setVariable [_this select 0, nil, true];
MarXetUpdatePending = true;
publicVariable "MarXetUpdatePending";