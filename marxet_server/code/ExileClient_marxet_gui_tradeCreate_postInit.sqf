/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
(_display displayCtrl 22155) ctrlSetStructuredText parseText "<t align='center' size='1.2'>Please select an Item or vehicle from the right</t>";
(_display displayCtrl 22150) ctrlSetText "";
(_display displayCtrl 22153) ctrlSetText "";
{
	(_display displayCtrl _x) ctrlEnable false;
}
forEach [22152, 22159, 22154, 22158, 22153];