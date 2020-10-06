/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_year", "_month", "_day", "_hour", "_min", "_sec"];
_this params ["_year", "_month", "_day", "_hour", "_min", "_sec"];
switch (_month) do 
{
	case 1: { _month = "Jan"; };
	case 2: { _month = "Feb"; };
	case 3: { _month = "Mar"; };
	case 4: { _month = "Apr"; };
	case 5: { _month = "May"; };
	case 6: { _month = "Jun"; };
	case 7: { _month = "Jul"; };
	case 8: { _month = "Aug"; };
	case 9: { _month = "Sept"; };
	case 10: { _month = "Oct"; };
	case 11: { _month = "Nov"; };
	case 12: { _month = "Dec"; };
};
format["%1 %2, %3 %4:%5:%6", _month, _day, _year, _hour, _min, _sec]