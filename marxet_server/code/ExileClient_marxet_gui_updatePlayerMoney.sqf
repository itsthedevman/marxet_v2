/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_playerPopTabs","_popTabsString","_respectString"];
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_playerPopTabs = player getVariable ["ExileMoney", 0];
_popTabsString = _playerPopTabs call ExileClient_util_string_exponentToString;
_respectString = ExileClientPlayerScore call ExileClient_util_string_exponentToString;
(_display displayCtrl 22004) ctrlSetStructuredText parseText format["<t align='right'>%1 <img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /> %2 <img image='\exile_assets\texture\ui\fail_ca.paa' size='1' shadow='true' /></t>", _popTabsString, _respectString];
