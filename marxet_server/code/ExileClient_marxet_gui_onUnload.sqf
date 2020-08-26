/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_var"];
false call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
{
	_var = missionNameSpace getVariable [_x, -1];
	if !(_var isEqualTo -1) then
	{
		[_var] call ExileClient_system_thread_removeTask;
		missionNameSpace setVariable [_x, -1];
	};
}
forEach
[
	"MarXetBiddingThead",
	"MarXetAuctionTimeThread",
	"MarXetUpdateThread"
];
