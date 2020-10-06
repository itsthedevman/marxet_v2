/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
if (serverTime < 4000 || time > 300) then
{
	MarXetTimeSynced = true;
	publicVariable "MarXetTimeSynced";
	MarXetTimeDifference = abs(parseNumber("extDB3" callExtension "9:UPTIME:SECONDS") - serverTime);
	publicVariable "MarXetTimeDifference";
};
