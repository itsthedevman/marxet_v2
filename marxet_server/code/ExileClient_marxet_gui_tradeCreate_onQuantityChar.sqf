/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_inputBox","_character","_display","_addButton","_ctrlText"];
disableSerialization;
_inputBox = _this select 0;
_character = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_addButton = _display displayCtrl 22154;
_ctrlText = ctrlText _inputBox;
if (!(_character in [48,49,50,51,52,53,54,55,56,57])) then
{
	_ctrlText = _ctrlText select [0, (count _ctrlText) - 1];
	_inputBox ctrlSetText _ctrlText;
	_inputBox ctrlCommit 0;
};
try
{
	{
		if !(_x in [48, 49, 50, 51, 52, 53, 54, 55, 56, 57]) then
		{
			throw false;
		};
	}
	forEach (toArray _ctrlText);
	_addButton ctrlEnable true;
}
catch
{
	_addButton ctrlEnable false;
};
