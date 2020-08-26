/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
class CfgPatches
{
	class marxet_server
	{
		requiredVersion=0.1;
		requiredAddons[]={"exile_server"};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};

class CfgFunctions
{
	class marxet_server
	{
		class Bootstrap
		{
			file="marxet_server\bootstrap";
			class serverPreInit
			{
				preInit = 1;
			};
			class clientPreInit
			{
				preInit = 1;
			};
			class postInit
			{
				postInit = 1;
			};
		};
	};
};
