/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_entry"];
_entry = MarXetTrading getVariable [_this, []];
if (_entry isEqualTo []) exitWith {};
_entry set [0, true];
MarXetTrading setVariable [_this, _entry, true];