/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_control", "_display", "_panelTitle"];
disableSerialization;
_control = _this select 0;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_panelTitle = _display displayCtrl 22002;
if !(MarXetUpdateThread isEqualTo -1) then 
{
	[MarXetUpdateThread] call ExileClient_system_thread_removeTask;
	MarXetUpdateThread = -1;
};
{
	(_display displayCtrl _x) ctrlShow false;
}
forEach [
	22027,
	22028,
	22029,
	22030,
	22031,
	22032
];
ctrlSetFocus _control;
switch (_control) do 
{
	case (_display displayCtrl 22011):
	{
		MarXetCurrentPanel = 22027;
		_panelTitle ctrlSetText "TRADE: VIEW REQUESTS";
		call ExileClient_Marxet_gui_tradeView_preInit;
		(_display displayCtrl 22027) ctrlShow true;
		call ExileClient_marxet_gui_tradeView_postInit;
	};
	case (_display displayCtrl 22012):
	{
		MarXetCurrentPanel = 22028;
		_panelTitle ctrlSetText "TRADE: CREATE A TRADE";
		call ExileClient_Marxet_gui_tradeCreate_preInit;
		(_display displayCtrl 22028) ctrlShow true;
		call ExileClient_marxet_gui_tradeCreate_postInit;
	};
	case (_display displayCtrl 22013):
	{	
		MarXetCurrentPanel = 22029;
		_panelTitle ctrlSetText "TRADE: VIEW MY REQUESTS";
		call ExileClient_marxet_gui_tradeMine_preInit;
		(_display displayCtrl 22029) ctrlShow true;
		call ExileClient_marxet_gui_tradeMine_postInit;
	};
	case (_display displayCtrl 22015):
	{
		MarXetCurrentPanel = 22030;
		_panelTitle ctrlSetText "AUCTION: VIEW LISTINGS";
		call ExileClient_marxet_gui_auctionView_preInit;
		(_display displayCtrl 22030) ctrlShow true;
		call ExileClient_marxet_gui_auctionView_postInit;
	};
	case (_display displayCtrl 22016):
	{
		MarXetCurrentPanel = 22031;
		_panelTitle ctrlSetText "AUCTION: CREATE LISTING";
		call ExileClient_marxet_gui_auctionCreate_preInit;
		(_display displayCtrl 22031) ctrlShow true;
		call ExileClient_marxet_gui_auctionCreate_postInit;
	};
	case (_display displayCtrl 22017):
	{
		MarXetCurrentPanel = 22032;
		_panelTitle ctrlSetText "AUCTION: VIEW MY LISTINGS";
		call ExileClient_marxet_gui_auctionMine_preInit;
		(_display displayCtrl 22032) ctrlShow true;
		call ExileClient_marxet_gui_auctionMine_postInit;
	};
};
call ExileClient_marxet_gui_updatePlayerMoney;
call ExileClient_marxet_gui_updateInventoryDropdown;
