/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_inputBox", "_character", "_display", "_tradeButton", "_ctrlText"];
disableSerialization;
_inputBox = _this select 0;
_character = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_tradeButton = _display displayCtrl 22108;
_ctrlText = ctrlText _inputBox;
if (!(_character in [48,49,50,51,52,53,54,55,56,57]) || ((count _ctrlText) > 4)) then
{
	_ctrlText = _ctrlText select [0, (count _ctrlText) - 1];
	_inputBox ctrlSetText _ctrlText;
	_inputBox ctrlCommit 0;
};
try 
{
	if !((count _ctrlText) isEqualTo 4) then
	{
		throw false;
	};
	{
		if !(_x in [48, 49, 50, 51, 52, 53, 54, 55, 56, 57]) then
		{
			throw false;
		};
	}
	forEach (toArray _ctrlText);
	_tradeButton ctrlEnable true;
}
catch 
{
	_tradeButton ctrlEnable false;
};