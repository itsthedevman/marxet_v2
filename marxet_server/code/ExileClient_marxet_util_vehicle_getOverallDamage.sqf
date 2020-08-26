/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_overallDamage","_count","_hitpoints","_damages"];
_overallDamage = 0;
_count = 0;
_hitpoints = _this select 0;
_damages = _this select 2;
{
	if (
		(_x find "wheel") > -1
		|| (_x find "fuel") > -1
		|| (_x find "hull") > -1
		|| (_x find "body") > -1
		|| (_x find "engine") > -1
	) then
	{
		_overallDamage = _overallDamage + (_damages select _forEachIndex);
		_count = _count + 1;
	};
}
forEach _hitpoints;
_overallDamage / _count
