/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
private["_classname", "_skinName", "_parent"];
_classname = _this;
_skinName = "";
_parent = configName (inheritsFrom (configFile >> "CfgVehicles" >> _classname));
if (isClass(missionConfigFile >> "CfgVehicleCustoms" >> _parent)) then 
{
	_skinName =
	{
		if ((_x select 0) isEqualTo _classname) exitWith 
		{
			_x select 2
		};
	}
	forEach (getArray(missionConfigFile >> "CfgVehicleCustoms" >> _parent >> "skins"));
};
_skinName