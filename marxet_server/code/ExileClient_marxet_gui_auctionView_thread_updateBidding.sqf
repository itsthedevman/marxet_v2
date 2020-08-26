/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_listbox","_i","_entry","_timeLeft","_playerPoptabs"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
if (isNull _display) exitWith
{
	[MarXetBiddingThead] call ExileClient_system_thread_removeTask;
	MarXetBiddingThead = -1;
};
_listbox = _display displayCtrl 22303;
if ((lbSize _listbox) isEqualTo 0) exitWith {};
for "_i" from 0 to ((lbSize _listbox) - 1) do
{
	_entry = parseSimpleArray(_listbox lbData _i);
	_timeLeft = [((_entry select 4) select 0)] call ExileClient_marxet_util_time_sync;
	if (_timeLeft > -10) then
	{
		if (_timeLeft >= -10 && _timeLeft <= 0) then
		{
			_listbox lbSetTextRight [_i, "SOLD"];
			_listbox lbSetColorRight [_i, [0.7, 0.93, 0, 0.6]];
			_listbox lbSetPictureRight [_i, ""];
		}
		else
		{
			if !(((_entry select 1) select 0) isEqualTo (getPlayerUID player)) then
			{
				if (((_entry select 4) select 3) isEqualTo (getPlayerUID player)) then
				{
					_listbox lbSetTextRight [_i, "In Control"];
					_listbox lbSetColorRight [_i, [1, 0.79, 0.07, 0.6]];
				}
				else
				{
					_listbox lbSetTextRight [_i, str((_entry select 4) select 1)];
					_listbox lbSetPictureRight [_i, "exile_assets\texture\ui\poptab_trader_ca.paa"];
					_playerPoptabs = player getVariable ["ExileMoney", -1];
					if (((_entry select 4) select 1) >= _playerPoptabs) then
					{
						_listbox lbSetColorRight [_i, [0.91, 0, 0, 0.6]];
						_listbox lbSetPictureRightColor [_i, [0.91, 0, 0, 0.6]];
					};
				};
			};
		};
	};
};
