/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_display","_dropdown","_sortables","_index"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_dropdown = _display displayCtrl 22100;
lbClear _dropdown;
_sortables = [
	["All", 0],
	["All (Newest-Oldest)", 1],
	["All (Oldest-Newest)", 2],
	["Rifles", 3],
	["Handguns", 4],
	["Machine Guns", 5],
	["Sub Machine Guns", 6],
	["Sniper Rifles", 7],
	["Launchers", 8],
	["Misc Weapons", 9],
	["Magazines", 10],
	["Magazines (Grenades)", 11],
	["Magazines (Explosives)", 12],
	["Consumables", 13],
	["Medical", 14],
	["Construction", 15],
	["Items", 16],
	["Attachments", 17],
	["Clothing", 18],
	["Misc", 19]
];
if (getNumber(missionConfigFile >> "CfgMarXet" >> "Settings" >> "Vehicles" >> "allowVehiclesToBeListed") isEqualTo 1) then
{
	_sortables = _sortables + [
		["Vehicle (Car)", 20],
		["Vehicle (Tank)", 21],
		["Vehicle (Helicopter)", 22],
		["Vehicle (Plane)", 23],
		["Vehicle (Boat)", 24],
		["Vehicle (Misc)", 25]
	];
};
{
	_index = _dropdown lbAdd (_x select 0);
	_dropdown lbSetValue [_index, _x select 1];
}
forEach _sortables;
_dropdown lbSetCurSel 0;
