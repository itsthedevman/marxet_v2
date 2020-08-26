/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_texts","_title"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_texts = [
	"<t size='2' shadow='0' align='center'>Junk in your trunk?<br/><t size='1.2'>Sell your junk on Exile's finest inmate Market</t></t>",
	"<t size='2' shadow='0' align='center'>Look no further<br/><t size='1.2'>MarXet is here!</t></t>"
];
_title = _display displayCtrl 22401;
_title ctrlSetStructuredText parseText (selectRandom _texts);
(_display displayCtrl 22402) ctrlSetStructuredText parseText "<t align='center'>Please select an item to list</t>";
false call ExileClient_marxet_gui_auctionCreate_toggleItemInfo;
