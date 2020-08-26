/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_listbox","_index","_display","_entry","_timeLeft","_classname","_picture","_title","_createdOnTitle"];
disableSerialization;
_listbox = _this select 0;
_index = _this select 1;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_entry = parseSimpleArray(_listbox lbData _index);
_timeLeft = [((_entry select 4) select 0)] call ExileClient_marxet_util_time_sync;
if (_timeLeft <= 0) exitWith {};
_name = (_entry select 3) select 2;
_classname = (_entry select 3) select 0;
_picture = (_entry select 3) select 3;
_title = _display displayCtrl 22503;
_createdOnTitle = _display displayCtrl 22506;
_title ctrlSetStructuredText parseText format["<t align='center' color='#3FD4FC'>%1</t>", _name];
(_display displayCtrl 22504) ctrlSetText _picture;
(_display displayCtrl 22505) ctrlSetStructuredText parseText format["<t align='center'>%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", (_entry select 4) select 1];
_createdOnTitle ctrlSetStructuredText parseText format ["<t align='center' size='0.8'>Created: %1</t>", (_entry select 2) call ExileClient_marxet_util_time_pretty];
(_display displayCtrl 22510) ctrlSetStructuredText parseText format[
	"<t>Removal Fee: <t color='#C72651'>%1</t><img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>",
	floor((getNumber(missionConfigFile >> "CfgExileArsenal" >> _classname >> "price")) * (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "removalFeeFactor"))) max 1
];
MarXetEntryEndTime = (_entry select 4) select 0;
(_display displayCtrl 22507) ctrlSetStructuredText parseText format["<t align='center' size='0.8'>%1 Bids</t>", (_entry select 4) select 2];
(_display displayCtrl 22508) ctrlSetStructuredText parseText format["<t align='center' size='0.8'>%1</t>", (call ExileClient_marxet_util_time_format)];
{
	(_display displayCtrl _x) ctrlShow true;
}
forEach [22502,22503,22506,22507,22508,22509,22510,22511,22504,22505];
