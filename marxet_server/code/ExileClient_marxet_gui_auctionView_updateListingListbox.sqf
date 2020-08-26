/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_listbox","_entry","_quality","_qualityColor","_classname","_timeLeft","_index","_playerPoptabs"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_listbox = _display displayCtrl 22303;
lbClear _listbox;
false call ExileClient_marxet_gui_auctionView_toggleItemInfo;
{
	_entry = _x;
	_quality = getNumber(missionConfigFile >> "CfgExileArsenal" >> ((_entry select 3) select 0) >> "quality");
	_qualityColor = [1, 1, 1, 1];
	switch (_quality) do
	{
		case 2: 		 { _qualityColor = [0.62, 0.87 ,0.23, 1]; };
		case 3:		 { _qualityColor = [0, 0.78, 0.92, 1]; };
		case 4:		 { _qualityColor = [0.62, 0.27, 0.58, 1]; };
		case 5:		 { _qualityColor = [1, 0.7, 0.09, 1]; };
		case 6:		 { _qualityColor = [0.93, 0, 0.48, 1]; };
	};
	_name = (_entry select 3) select 2;
	_classname = (_entry select 3) select 0;
	_timeLeft = [((_entry select 4) select 0)] call ExileClient_marxet_util_time_sync;
	if (_timeLeft > -10) then
	{
		_index = _listbox lbAdd _name;
		_listbox lbSetPicture [_index, ((_entry select 3) select 3)];
		_listbox lbSetData [_index, str(_entry)];
		_listbox lbSetColor [_index, _qualityColor];
		_listbox lbSetValue [_index, 0];
		if (MarXetCurrentSelectedID isEqualTo ((_entry select 3) select 4)) then
		{
			MarXetSelectedIndex = _index;
		};
		if (((_entry select 1) select 0) isEqualTo (getPlayerUID player)) then
		{
			_listbox lbSetTextRight [_index, "Mine"];
			_listbox lbSetValue [_index, 1];
			_listbox lbSetColor [_index, [0.5, 0.5, 0.5, 1]];
			_listbox lbSetColorRight [_index, [0.5, 0.5, 0.5, 1]];
		}
		else
		{
			if (_timeLeft >= -10 && _timeLeft <= 0) then
			{
				_listbox lbSetTextRight [_index, "SOLD"];
				_listbox lbSetColorRight [_index, [0.7, 0.93, 0, 0.6]];
			}
			else
			{
				if (((_entry select 4) select 3) isEqualTo (getPlayerUID player)) then
				{
					_listbox lbSetTextRight [_index, "In Control"];
					_listbox lbSetColorRight [_index, [1, 0.79, 0.07, 0.6]];
				}
				else
				{
					_listbox lbSetTextRight [_index, str((_entry select 4) select 1)];
					_listbox lbSetPictureRight [_index, "exile_assets\texture\ui\poptab_trader_ca.paa"];
					_playerPoptabs = player getVariable ["ExileMoney", -1];
					if (((_entry select 4) select 1) >= _playerPoptabs) then
					{
						_listbox lbSetColorRight [_index, [0.91, 0, 0, 0.6]];
						_listbox lbSetPictureRightColor [_index, [0.91, 0, 0, 0.6]];
					};
				};
			};
		};
	};
}
forEach (call ExileClient_marxet_gui_auctionView_sortListings);
