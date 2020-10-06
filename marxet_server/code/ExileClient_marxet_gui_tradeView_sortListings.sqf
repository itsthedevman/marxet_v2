/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_display", "_inventory", "_items", "_temp", "_direction", "_sortingDropdown", "_sortOption", "_entry", "_classname", "_displayName", "_picture", "_configName", "_config", "_itemInformation", "_category", "_category1", "_sortBy", "_allowed", "_effects", "_effectNumbers"];
disableSerialization;
_display = uiNamespace getVariable ["RscMarXet", displayNull];
_inventory = allVariables MarXetTrading;
_items = [];
_temp = [];
_direction = true;
_sortingDropdown = _display displayCtrl 22100;
_sortOption = _sortingDropdown lbValue (lbCurSel _sortingDropdown);
{
	_entry = MarXetTrading getVariable [_x, nil];
	if !(isNil "_entry") then 
	{
		_entry = +_entry;
		_classname = ((_entry select 3) select 0);
		_displayName = "";
		_picture = "";
		switch (_classname) do
		{
			case "ExileMoney":
			{
				_displayName = format["%1 Poptabs", (_entry select 3) select 1 select 0];
				_picture = "\exile_assets\texture\ui\poptab_notification_ca.paa";
			};
			case "ExileScore": 
			{
				_displayName = format["%1 Respect", (_entry select 3) select 1 select 0];
				_picture = "\exile_assets\texture\ui\fail_ca.paa";
			};
			default 
			{
				_configName = _classname call ExileClient_util_gear_getConfigNameByClassName;
				_config = configFile >> _configName >> _classname;
				_displayName = getText(_config >> "displayName");
				_picture = getText(_config >> "picture");
			};
		};
		(_entry select 3) pushBack _displayName;
		(_entry select 3) pushBack _picture;
		(_entry select 3) pushBack _x;
		_itemInformation = [_classname] call BIS_fnc_itemType;
		_category = _itemInformation select 0;
		_category1 = _itemInformation select 1;
		_sortBy = _displayName;
		_allowed = false;
		switch (_sortOption) do 
		{
			default 
			{
				_allowed = true;
			};
			case 1,
			case 2:
			{
				_sortBy = _entry select 2;
				_direction = (_sortOption isEqualTo 1);
				_allowed = true;
			};
			case 3: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Weapon"} && {_category1 in ["Rifle", "AssaultRifle"]});
			};
			case 4: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Weapon"} && {_category1 isEqualTo "Handgun"});
			};
			case 5: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Weapon"} && {_category1 isEqualTo "MachineGun"});
			};
			case 6: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Weapon"} && {_category1 isEqualTo "SubmachineGun"});
			};
			case 7: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Weapon"} && {_category1 isEqualTo "SniperRifle"});
			};
			case 8: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Weapon"} && {_category1 in ["Cannon","BombLauncher","MissileLauncher","RocketLauncher","Mortar","Launcher","GrenadeLauncher"]});
			};
			case 9: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Weapon"} && {!(_category1 in ["Rifle", "AssaultRifle", "Handgun", "MachineGun", "SubmachineGun", "SniperRifle", "Cannon","BombLauncher","MissileLauncher","RocketLauncher","Mortar","Launcher","GrenadeLauncher"])});
			};
			case 10: 
			{
				_allowed = _configName isEqualTo "CfgMagazines" && {!(_category in ["Magazine", "Mine"])} || (_category isEqualTo "Magazine" && {(_classname find "Exile_Item") isEqualTo -1});
			};
			case 11: 
			{
				_allowed = (_configName isEqualTo "CfgMagazines" && {_category isEqualTo "Magazine"} && {_category1 in ["Shell","SmokeShell","Grenade","Flare"]});
			};
			case 12: 
			{
				_allowed = ((_configName isEqualTo "CfgMagazines" && {_category isEqualTo "Mine"}) || (_configName isEqualTo "CfgMagazines" && {_category isEqualTo "Magazine"} && {_category1 in ["Missile","Rocket"]}));
			};
			case 13: 
			{
				if (isClass(_config >> "Interactions" >> "Consuming")) then 
				{
					_effects = getArray(_config >> "Interactions" >> "Consuming" >> "effects");
					if !(_effects isEqualTo []) then 
					{
						private _effectNumbers = [];
						{
							_effectNumbers pushBackUnique (_x select 0);
						}
						foreach _effects;
						if (count(_effectNumbers arrayIntersect [2, 3]) > 0) then 
						{
							_allowed = true;
						};
					};
				};
			};
			case 14: 
			{
				if (isClass(_config >> "Interactions" >> "Consuming")) then 
				{
					_effects = getArray(_config >> "Interactions" >> "Consuming" >> "effects");
					if !(_effects isEqualTo []) then 
					{
						private _effectNumbers = [];
						{
							_effectNumbers pushBackUnique (_x select 0);
						}
						foreach _effects;
						if (count(_effectNumbers arrayIntersect [2, 3]) isEqualTo 0) then 
						{
							_allowed = true;
						};
					};
				};
			};
			case 15: 
			{
				_allowed = isClass(_config >> "Interactions" >> "Constructing");
			};
			case 16: 
			{
				_allowed = (_configName isEqualTo "CfgMagazines" && {_category isEqualTo "Item"} && {!(_category1 in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"])});
			};
			case 17: 
			{
				_allowed = (_configName isEqualTo "CfgMagazines" && {_category isEqualTo "Item"} && {_category1 in ["AccessoryMuzzle","AccessoryPointer","AccessorySights","AccessoryBipod"]});
			};
			case 18: 
			{
				_allowed = (_configName isEqualTo "CfgWeapons" && {_category isEqualTo "Equipment"} && {_category1 in ["Uniform","Vest","Headgear"]});
			};
			case 19: 
			{
				_allowed = (_configName isEqualTo "CfgMagazines" && {_category isEqualTo "Item"} && {(_classname find "Exile_Item") > -1}) || (isClass(_config >> "Interactions" >> "Consuming") && {getArray(_config >> "Interactions" >> "Consuming" >> "effects") isEqualTo []});
			};
			case 20: 
			{
				_allowed = (_configName isEqualTo "CfgVehicles" && {(toLower(getText (_config >> "simulation")) in ["car","carx"])});
			};
			case 21: 
			{
				_allowed = (_configName isEqualTo "CfgVehicles" && {(toLower(getText (_config >> "simulation")) in ["tank","tankx"])} && {getnumber (_config >> "maxspeed") > 0});
			};
			case 22: 
			{
				_allowed = (_configName isEqualTo "CfgVehicles" && {toLower(getText (_config >> "simulation")) in ["helicopter","helicopterx","helicopterrtd"]});
			};
			case 23: 
			{
				_allowed = (_configName isEqualTo "CfgVehicles" && {toLower(getText (_config >> "simulation")) in ["airplane","airplanex"]});
			};
			case 24: 
			{
				_allowed = (_configName isEqualTo "CfgVehicles" && {toLower(getText (_config >> "simulation")) in ["ship","shipx","submarinex"]});
			};
			case 25: 
			{
				_allowed = (_configName isEqualTo "CfgVehicles" && {!(toLower(getText (_config >> "simulation")) in ["car","carx","tank","tankx","helicopter","helicopterx","helicopterrtd","airplane","airplanex","ship","shipx","submarinex"])});
			};
		};
		if (_allowed) then 
		{
			_temp pushBack [_sortBy, _entry];
		};
	}
	else
	{	
		if (MarXetCurrentSelectedID isEqualTo _x) then 
		{
			MarXetSelectedIndex = -1;
			MarXetCurrentSelectedID = "";
		};
	};
}
forEach _inventory;
_temp sort _direction;
{
	_items pushBack (_x select 1);
}
forEach _temp;
_items