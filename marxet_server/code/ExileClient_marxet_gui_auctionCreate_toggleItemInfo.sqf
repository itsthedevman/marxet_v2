/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
(_display displayCtrl 22433) ctrlSetText "1";
(_display displayCtrl 22435) ctrlSetText "0";
(_display displayCtrl 22437) ctrlSetText "0";
(_display displayCtrl 22440) ctrlSetText "";
{
	(_display displayCtrl _x) ctrlShow _this;
}
forEach [22403,22404,22405,22406,22407,22408,22409,22410,22411,22412,22413,22414,22415,22416,22417,22418,22419,22420,22421,22422,22423,22424,22425,22426,22427,22428,22429,22430,22431,22432,22433,22434,22435,22436,22437,22438,22439,22440,22441];