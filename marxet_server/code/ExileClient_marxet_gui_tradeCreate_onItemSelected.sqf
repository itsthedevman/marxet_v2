/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_control", "_index", "_display"];
disableSerialization;
_control = _this select 0;
_index = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (_control isEqualTo (_display displayCtrl 22152)) then 
{
	if !(ctrlText (_display displayCtrl 22153) isEqualTo "") then 
	{
		(_display displayCtrl 22154) ctrlEnable true;
	};
}
else
{
	(_display displayCtrl 22158) ctrlEnable true;
};