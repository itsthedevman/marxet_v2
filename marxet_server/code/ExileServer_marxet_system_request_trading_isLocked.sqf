/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_entry"];
_entry = MarXetTrading getVariable [_this, []];
if (_entry isEqualTo [] || _entry select 0) exitWith { true };
false