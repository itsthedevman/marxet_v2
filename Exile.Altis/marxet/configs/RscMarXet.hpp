/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/

class MarXetScrollBar
{
	color[] = {1,1,1,0.6};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.3};
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	shadow = 0;
	scrollSpeed = 0.06;
	width = 0;
	height = 0;
	autoScrollEnabled = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class RscMarXetText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	colorShadow[] = {0,0,0,0.5};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 1;
	font = "RobotoCondensed";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
};
class RscMarXetStructuredText
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {1,1,1,1};
	class Attributes
	{
		font = "RobotoCondensed";
		color = "#ffffff";
		colorLink = "#D09B43";
		align = "left";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 1;
};
class RscMarXetPicture
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};
class RscMarXetEdit
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",1};
	autocomplete = "";
	text = "";
	size = 0.2;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	style = "0x00 + 0x40";
	font = "RobotoCondensed";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	canModify = 1;
};
class RscMarXetCombo
{
	style = "0x10 + 0x200";
	font = "RobotoCondensed";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	shadow = 0;
	type = 4;
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	colorSelect[] = {0,0,0,1};
	colorText[] = {1,1,1,1.0};
	colorBackground[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorScrollbar[] = {1,0,0,1};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	colorActive[] = {1,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,0.25};
	colorPictureRight[] = {1,1,1,1};
	colorPictureRightSelected[] = {1,1,1,1};
	colorPictureRightDisabled[] = {1,1,1,0.25};
	colorTextRight[] = {1,1,1,1};
	colorSelectRight[] = {0,0,0,1};
	colorSelect2Right[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	class ComboScrollBar: MarXetScrollBar {};
	maxHistoryDelay = 1;
};
class RscMarXetListBox
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = 5;
	sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	sizeEx2 = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	rowHeight = "2 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	colorText[] ={1,1,1,1};
	colorDisabled[] ={1,1,1,0.25};
	colorScrollbar[] ={1,0,0,0};
	colorSelect[] ={0,0.698,0.804,1};
	colorSelect2[] ={0,0.698,0.804,1};
	colorSelectBackground[] ={1,1,1,0.3};
	colorSelectBackground2[] ={1,1,1,0.3};
	colorBackground[] = {0.161,0.161,0.161,0.9};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorPicture[] ={1,1,1,1};
	colorPictureSelected[] ={1,1,1,1};
	colorPictureDisabled[] ={1,1,1,0.25};
	colorPictureRight[] ={1,1,1,1};
	colorPictureRightSelected[] ={1,1,1,1};
	colorPictureRightDisabled[] ={1,1,1,0.25};
	colorTextRight[] ={1,1,1,1};
	colorSelectRight[] ={0,0.698,0.804,1};
	colorSelect2Right[] ={0,0.698,0.804,1};
	tooltipColorText[] ={1,1,1,1};
	tooltipColorBox[] ={1,1,1,1};
	tooltipColorShade[] ={0,0,0,0.65};
	class ListScrollBar: MarXetScrollBar {};
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.3;
	style = 16;
	font = "PuristaMedium";
	shadow = 0;
	colorShadow[] ={0,0,0,0.5};
	period = 1.2;
	maxHistoryDelay = 1;
};
class RscMarXetButtonMenu
{
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorSecondary[] = {1,1,1,1};
	colorFocusedSecondary[] = {0,0,0,1};
	color2Secondary[] = {0,0,0,1};
	colorDisabledSecondary[] = {1,1,1,0.25};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos
	{
		left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "5.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		top = 0;
		w = "1 * (((safezoneW / safezoneH) min 1.2) / 40)";
		h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};
	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	textSecondary = "";
	sizeExSecondary = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	fontSecondary = "PuristaLight";
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	textureNoShortcut = "";
};
class RscMarXetControlsGroup
{
	deletable = 0;
	fade = 0;
	class VScrollbar
	{
		color[] = {1,1,1,1};
		width = 0.021;
		autoScrollEnabled = 1;
	};
	class HScrollbar
	{
		color[] = {1,1,1,0};
		height = 0;
	};
	class Controls {};
	type = 15;
	idc = -1;
	x = 0;
	y = 0;
	w = 1;
	h = 1;
	shadow = 0;
	style = 16;
};
class RscMarXetActiveText
{
	idc = -1;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.035;
	type = 0;
	font = "RobotoCondensed";
	shadow = 2;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	url = "";
	color[] = {0,0,0,1};
	colorActive[] = {0.3,0.4,0,1};
	colorDisabled[] = {1,1,1,0.25};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	colorBackground[] = {0,0,0,0};
};
class RscMarXetProgress
{
	type = 8;
	style = 0;
	x = 0.344;
	y = 0.619;
	w = 0.3137255;
	h = 0.0261438;
	shadow = 2;
	texture = "#(argb,8,8,3)color(1,1,1,1)";
	colorFrame[] = {0,0,0,0};
	colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
};
class RscMarXetPictureKeepAspect: RscMarXetPicture
{
	style = "0x30 + 0x800";
};
class RscMarXetCheckBox
{
	idc = -1;
	type = 77;
	deletable = 0;
	style = 0;
	checked = 0;
	x = "0.375 * safezoneW + safezoneX";
	y = "0.36 * safezoneH + safezoneY";
	w = "0.025 * safezoneW";
	h = "0.04 * safezoneH";
	color[] = {1,1,1,0.7};
	colorFocused[] = {1,1,1,1};
	colorHover[] = {1,1,1,1};
	colorPressed[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.2};
	colorBackground[] = {0,0,0,0};
	colorBackgroundFocused[] = {0,0,0,0};
	colorBackgroundHover[] = {0,0,0,0};
	colorBackgroundPressed[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	soundEnter[] = {"",0.1,1};
	soundPush[] = {"",0.1,1};
	soundClick[] = {"",0.1,1};
	soundEscape[] = {"",0.1,1};
};







class RscMarXet
{
	idd = 22000;
    onLoad = "uiNamespace setVariable ['RscMarXet', _this select 0]; call ExileClient_marxet_gui_onLoad";
	onUnload = "uiNamespace setVariable ['RscMarXet', displayNull]; call ExileClient_marxet_gui_onUnload";
    movingenable=false;
	class Controls
	{
		class TitleLeft: RscMarXetText
		{
			idc = 22001;
			text = "WELCOME TO MARXET";
			x = -10.5 * (0.025) + (0);
			y = -1.2 * (0.04) + (0);
			w = 13.5 * (0.025);
			h = 1 * (0.04);
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TitleCenter: RscMarXetText
		{
			idc = 22002;
			x = 4 * (0.025) + (0);
			y = -1.2 * (0.04) + (0);
			w = 32 * (0.025);
			h = 1 * (0.04);
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class TitleRight: RscMarXetText
		{
			idc = 22003;
			text = "MY INVENTORY";
			x = 37 * (0.025) + (0);
			y = -1.2 * (0.04) + (0);
			w = 13.5 * (0.025);
			h = 1 * (0.04);
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class PlayerMoney: RscMarXetStructuredText
		{
			idc = 22004;
			text = "<t align=""right"">0</t>";
			x = 26.5 * (0.025) + (0);
			y = -1.2 * (0.04) + (0);
			w = 9.5 * (0.025);
			h = 1 * (0.04);
			colorBackground[] = {-1,-1,-1,0};
		};
		class BackgroundPanelLeft: RscMarXetText
		{
			idc = 22006;
			x = -10.5 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 13.5 * (0.025);
			h = 25 * (0.04);
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class BackgroundPanelCenter: RscMarXetText
		{
			idc = 22007;
			x = 4 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 32 * (0.025);
			h = 25 * (0.04);
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class BackgroundPanelRight: RscMarXetText
		{
			idc = 22008;
			x = 37 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 13.5 * (0.025);
			h = 25 * (0.04);
			colorBackground[] = {0.05,0.05,0.05,0.7};
		};
		class MainLogo: RscMarXetPicture
		{
			idc = 22009;
			text = "marxet\logo.paa";
			x = -10 * (0.025) + (0);
			y = 0.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 9 * (0.04);
		};
		class TitleTrade: RscMarXetStructuredText
		{
			idc = 22010;
			text = "<t shadow='0' size='1.2'>Trade</t>";
			x = -10.4 * (0.025) + (0);
			y = 10.2 * (0.04) + (0);
			w = 6.5 * (0.025);
			h = 1.5 * (0.04);
			colorBackground[] = {-1,-1,-1,0};
		};
		class ButtonTradeView: RscMarXetButtonMenu
		{
			idc = 22011;
			text = "View Requests";
			x = -10 * (0.025) + (0);
			y = 11.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1.5 * (0.04);
			onButtonClick = "_this call ExileClient_marxet_gui_onPanelSwitch";
		};
		class ButtonTradeCreate: RscMarXetButtonMenu
		{
			idc = 22012;
			text = "Create a Trade";
			x = -10 * (0.025) + (0);
			y = 13.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1.5 * (0.04);
			onButtonClick = "_this call ExileClient_marxet_gui_onPanelSwitch";
		};
		class ButtonTradeMine: RscMarXetButtonMenu
		{
			idc = 22013;
			text = "My Requests";
			x = -10 * (0.025) + (0);
			y = 15.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1.5 * (0.04);
			onButtonClick = "_this call ExileClient_marxet_gui_onPanelSwitch";
		};
		class TitleAuction: RscMarXetStructuredText
		{
			idc = 22014;
			text = "<t shadow='0' size='1.2'>Auction</t>";
			x = -10.3 * (0.025) + (0);
			y = 17.7 * (0.04) + (0);
			w = 6.5 * (0.025);
			h = 1.5 * (0.04);
			colorBackground[] = {-1,-1,-1,0};
		};
		class ButtonAuctionView: RscMarXetButtonMenu
		{
			idc = 22015;
			text = "View Listings";
			x = -10 * (0.025) + (0);
			y = 19 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1.5 * (0.04);
			onButtonClick = "_this call ExileClient_marxet_gui_onPanelSwitch";
		};
		class ButtonAuctionCreate: RscMarXetButtonMenu
		{
			idc = 22016;
			text = "Create a Listing";
			x = -10 * (0.025) + (0);
			y = 21 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1.5 * (0.04);
			onButtonClick = "_this call ExileClient_marxet_gui_onPanelSwitch";
		};
		class ButtonAuctionMine: RscMarXetButtonMenu
		{
			idc = 22017;
			text = "My Listings";
			x = -10 * (0.025) + (0);
			y = 23 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1.5 * (0.04);
			onButtonClick = "_this call ExileClient_marxet_gui_onPanelSwitch";
		};
		class ButtonTradeEditClose: RscMarXetButtonMenu
		{
			idc = 22018;
			text = "Close without Saving";
			x = -10 * (0.025) + (0);
			y = 23 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1.5 * (0.04);
			onButtonClick = "call ExileClient_marxet_gui_tradeMine_onCloseEditButtonClick";
			show = 0;
		};
		class InventoryDropdown: RscMarXetCombo
		{
			idc = 22019;
			x = 37.5 * (0.025) + (0);
			y = 0.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1 * (0.04);
			onLBSelChanged = "_this call ExileClient_marxet_gui_updateInventoryListBox";
		};
		class InventoryListbox: RscMarXetListBox
		{
			idc = 22020;
			x = 37.5 * (0.025) + (0);
			y = 2 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 21 * (0.04);
			onLBSelChanged = "call ExileClient_marxet_gui_onInventorySelected";
		};
		class PlayerLoadBackground: RscMarXetText
		{
			idc = 22021;
			x = 37.5 * (0.025) + (0);
			y = 23.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1 * (0.04);
			colorBackground[] = {0,0,0,0.5};
		};
		class PlayerLoadProgress: RscMarXetProgress
		{
			idc = 22022;
			x = 37.5 * (0.025) + (0);
			y = 23.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1 * (0.04);
			colorText[] = {1,1,1,0.25};
			colorBackground[] = {1,1,1,0.25};
		};
		class PlayerLoadLabel: RscMarXetText
		{
			idc = 22023;
			text = "LOAD";
			x = 37.5 * (0.025) + (0);
			y = 23.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1 * (0.04);
		};
		class PlayerLoadValue: RscMarXetStructuredText
		{
			idc = 22024;
			text = "100%";
			x = 37.5 * (0.025) + (0);
			y = 23.5 * (0.04) + (0);
			w = 12.5 * (0.025);
			h = 1 * (0.04);
		};
		class InventoryPopTabsEdit: RscMarXetEdit
		{
			idc = 22025;
			x = 41.5 * (0.025) + (0);
			y = 23.5 * (0.04) + (0);
			w = 8.5 * (0.025);
			h = 1 * (0.04);
			show = 0;
			tooltip = "Select Poptabs from your inventory and input the amount here";
			onChar = "_this spawn ExileClient_marxet_gui_onPoptabChar";
			onKeyDown = "_this spawn ExileClient_marxet_gui_onPoptabKeyDown";
		};
		class InventoryPoptabsText: RscMarXetText
		{
			idc = 22026;
			text = "Poptabs:";
			x = 37.2 * (0.025) + (0);
			y = 23.5 * (0.04) + (0);
			w = 4 * (0.025);
			h = 1 * (0.04);
			show = 0;
		};

		class TradeView: RscMarXetControlsGroup
		{
			idc = 22027;
			x = 4 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 32 * (0.025);
			h = 25 * (0.04);
			show = 0;
			class controls
			{
				class SortDropdown: RscMarXetCombo
				{
					idc = 22100;
					x = 0.5 * (0.025) + (0);
					y = 0.5 * (0.04) + (0);
					w = 16.5 * (0.025);
					h = 1 * (0.04);
					onLBSelChanged = "call ExileClient_marxet_gui_tradeView_updateListingListbox";
				};
				class ListingListbox: RscMarXetListBox
				{
					idc = 22101;
					x = 0.5 * (0.025) + (0);
					y = 2 * (0.04) + (0);
					w = 16.5 * (0.025);
					h = 22.5 * (0.04);
					onLBSelChanged = "_this call ExileClient_marxet_gui_tradeView_updateListingInfo";
				};
				class TradingForTitle: RscMarXetStructuredText
				{
					idc = 22102;
					text = "<t align='center' size='1.2'>Please select an Item</t>";
					x = 17 * (0.025) + (0);
					y = 2 * (0.04) + (0);
					w = 15 * (0.025);
					h = 2.5 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class RequestedByText: RscMarXetStructuredText
				{
					idc = 22103;
					text = "<t size='0.8' align='center'>Requested by: WolfkillArcadia</t>";
					x = 17 * (0.025) + (0);
					y = 4.5 * (0.04) + (0);
					w = 15 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class RequestedItemsText: RscMarXetText
				{
					idc = 22104;
					text = "Requested Items";
					x = 17.2 * (0.025) + (0);
					y = 5.4 * (0.04) + (0);
					w = 7 * (0.025);
					h = 1 * (0.04);
				};
				class RequestedListbox: RscMarXetListBox
				{
					idc = 22105;
					x = 17.5 * (0.025) + (0);
					y = 6.5 * (0.04) + (0);
					w = 14 * (0.025);
					h = 15 * (0.04);
				};
				class NewPincodeText: RscMarXetText
				{
					idc = 22106;
					text = "New Pincode:";
					x = 20.2 * (0.025) + (0);
					y = 22 * (0.04) + (0);
					w = 5.5 * (0.025);
					h = 1 * (0.04);
				};
				class NewPincodeEdit: RscMarXetEdit
				{
					idc = 22107;
					x = 25.5 * (0.025) + (0);
					y = 22 * (0.04) + (0);
					w = 6 * (0.025);
					h = 1 * (0.04);
					onChar = "_this spawn ExileClient_marxet_gui_tradeView_onPincodeChar";
					onKeyDown = "_this spawn ExileClient_marxet_gui_tradeView_onPincodeKeyDown";
				};
				class ButtonTrade: RscMarXetButtonMenu
				{
					idc = 22108;
					text = "Trade";
					x = 17.5 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_tradeView_onTradeButtonClick";
					tooltip = "Any requested vehicles will have their contents deleted. This includes items and poptabs";
				};
			};
		};

		class TradeCreate: RscMarXetControlsGroup
		{
			idc = 22028;
			x = 4 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 32 * (0.025);
			h = 25 * (0.04);
			show = 0;
			class Controls
			{
				class SearchText: RscMarXetText
				{
					idc = -1;
					text = "Search:";
					x = 0.2 * (0.025) + (0);
					y = 0.5 * (0.04) + (0);
					w = 3.5 * (0.025);
					h = 1 * (0.04);
				};
				class SearchEdit: RscMarXetEdit
				{
					idc = 22150;
					x = 3.5 * (0.025) + (0);
					y = 0.5 * (0.04) + (0);
					w = 12.5 * (0.025);
					h = 1 * (0.04);
					onKeyDown = "call ExileClient_marxet_gui_tradeCreate_updateAvailableListbox";
				};
				class SortDropdown: RscMarXetCombo
				{
					idc = 22151;
					x = 0.5 * (0.025) + (0);
					y = 2 * (0.04) + (0);
					w = 15.5 * (0.025);
					h = 1 * (0.04);
					onLBSelChanged = "_this call ExileClient_marxet_gui_tradeCreate_updateAvailableListbox";
				};
				class AvailableListbox: RscMarXetListBox
				{
					idc = 22152;
					x = 0.5 * (0.025) + (0);
					y = 3.5 * (0.04) + (0);
					w = 15.5 * (0.025);
					h = 19.5 * (0.04);
					onLBSelChanged = "_this call ExileClient_marxet_gui_tradeCreate_onItemSelected";
				};
				class QuantityText: RscMarXetText
				{
					idc = -1;
					text = "Quantity:";
					x = 0.2 * (0.025) + (0);
					y = 23.4 * (0.04) + (0);
					w = 4 * (0.025);
					h = 1 * (0.04);
				};
				class QuantityEdit: RscMarXetEdit
				{
					idc = 22153;
					x = 4 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 6.5 * (0.025);
					h = 1 * (0.04);
					onChar = "_this spawn ExileClient_marxet_gui_tradeCreate_onQuantityChar";
					onKeyDown = "_this spawn ExileClient_marxet_gui_tradeCreate_onQuantityKeyDown";
				};
				class ButtonAdd: RscMarXetButtonMenu
				{
					idc = 22154;
					text = "Add";
					x = 11 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 5 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_tradeCreate_onAddButtonClick";
				};
				class CreatingTradeText: RscMarXetStructuredText
				{
					idc = 22155;
					text = "<t align='center' size='1.2'>Creating a Trade For<br/><t color='#ff0000'>DISPLAY_NAME</t></t>";
					x = 16 * (0.025) + (0);
					y = 1 * (0.04) + (0);
					w = 16 * (0.025);
					h = 2.5 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class RequestedItemsText: RscMarXetText
				{
					idc = -1;
					text = "Requested Items";
					x = 16.2 * (0.025) + (0);
					y = 4 * (0.04) + (0);
					w = 6.5 * (0.025);
					h = 1 * (0.04);
				};
				class RequestedListbox: RscMarXetListBox
				{
					idc = 22156;
					x = 16.5 * (0.025) + (0);
					y = 5 * (0.04) + (0);
					w = 15 * (0.025);
					h = 17 * (0.04);
					onLBSelChanged = "_this call ExileClient_marxet_gui_tradeCreate_onItemSelected";
				};
				class ShowCheckbox: RscMarXetCheckbox
				{
					idc = 22157;
					x = 16.4 * (0.025) + (0);
					y = 22.1 * (0.04) + (0);
					w = 1 * (0.025);
					h = 1 * (0.04);
					tooltip = "Enabling this shows your name as the requestor when viewing a request. This is useful if you want players to barter with you";
				};
				class CheckboxText: RscMarXetStructuredText
				{
					idc = -1;
					text = "<t size='0.8' align='left' shadow='0'>Show my name as requestor</t>";
					x = 17.3 * (0.025) + (0);
					y = 22.25 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class ButtonRemove: RscMarXetButtonMenu
				{
					idc = 22158;
					text = "Remove";
					x = 16.5 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 5 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_tradeCreate_onRemoveButtonClick";
				};
				class ButtonCreate: RscMarXetButtonMenu
				{
					idc = 22159;
					text = "Create";
					x = 22 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 9.5 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_tradeCreate_onCreatebuttonClick";
				};
			};
		};

		class TradeMine: RscMarXetControlsGroup
		{
			idc = 22029;
			x = 4 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 32 * (0.025);
			h = 25 * (0.04);
			show = 0;
			class Controls
			{
				class MyTradeTitle: RscMarXetText
				{
					idc = -1;
					text = "My Trade Listings";
					x = 0.2 * (0.025) + (0);
					y = 0.4 * (0.04) + (0);
					w = 9 * (0.025);
					h = 1 * (0.04);
				};
				class MyListingListbox: RscMarXetListBox
				{
					idc = 22201;
					x = 0.5 * (0.025) + (0);
					y = 1.5 * (0.04) + (0);
					w = 17 * (0.025);
					h = 23 * (0.04);
					onLBSelChanged = "_this call ExileClient_marxet_gui_tradeMine_updateListingInfo";
				};
				class ItemVehicleTitle: RscMarXetStructuredText
				{
					idc = 22202;
					text = "<t size='1.2' align='center'>Listed Item/Vehicle<br/><t color='#ff0000'>DISPLAY_NAME</t></t>";
					x = 17.5 * (0.025) + (0);
					y = 1 * (0.04) + (0);
					w = 14.5 * (0.025);
					h = 2.5 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class CreatedOnTitle: RscMarXetStructuredText
				{
					idc = 22203;
					text = "<t align='center' size='0.8'>Created: Aug 19 2018</t>";
					x = 17 * (0.025) + (0);
					y = 3.4 * (0.04) + (0);
					w = 15 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class RequestedItemsTitle: RscMarXetText
				{
					idc = 22204;
					text = "Requested Items/Vehicles";
					x = 17.7 * (0.025) + (0);
					y = 4.5 * (0.04) + (0);
					w = 9.5 * (0.025);
					h = 1 * (0.04);
				};
				class RequestedListbox: RscMarXetListBox
				{
					idc = 22205;
					x = 18 * (0.025) + (0);
					y = 5.5 * (0.04) + (0);
					w = 13.5 * (0.025);
					h = 13.5 * (0.04);
				};
				class ButtonEdit: RscMarXetButtonMenu
				{
					idc = 22206;
					text = "Edit Listing";
					x = 18 * (0.025) + (0);
					y = 19.5 * (0.04) + (0);
					w = 13.5 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_tradeMine_onEditButtonClick";
				};
				class DangerZoneTitle: RscMarXetStructuredText
				{
					idc = 22207;
					text = "<t size='1.2' align='center' color='#C72651'>DANGER ZONE</t>";
					x = 17.5 * (0.025) + (0);
					y = 21 * (0.04) + (0);
					w = 14.5 * (0.025);
					h = 1.5 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class RemovalFeeTitle: RscMarXetStructuredText
				{
					idc = 22208;
					text = "<t>Removal Fee: 1000</t>";
					x = 17.7 * (0.025) + (0);
					y = 22.5 * (0.04) + (0);
					w = 14.5 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class ButtonDelete: RscMarXetButtonMenu
				{
					idc = 22209;
					text = "Delete Listing";
					x = 18 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 13.5 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_tradeMine_onDeleteButtonClick";
					tooltip = "Removing a listing will refund the listed item/vehicle and you will be charged the removal fee above";
				};
			};
		};

		class AutionView: RscMarXetControlsGroup
		{
			idc = 22030;
			x = 4 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 32 * (0.025);
			h = 25 * (0.04);
			show = 0;
			class Controls
			{
				class CategoryDropdown: RscMarXetCombo
				{
				    idc = 22301;

				    x = 0.5 * (0.025) + (0);
				    y = 0.5 * (0.04) + (0);
				    w = 19.5  * (0.025);
				    h = 1 * (0.04);
					onLBSelChanged = "call ExileClient_marxet_gui_auctionView_updateListingListbox";
				};
				class ViewListingsListbox: RscMarXetListBox
				{
				    idc = 22303;

				    x = 0.5 * (0.025) + (0);
				    y = 2 * (0.04) + (0);
				    w = 19.5 * (0.025);
				    h = 22.5 * (0.04);
					onLBSelChanged = "_this call ExileClient_marxet_gui_auctionView_updateListingInfo";
				};
				class ItemPicture: RscMarXetPictureKeepAspect
				{
				    idc = 22304;

				    text = "#(argb,8,8,3)color(1,1,1,1)";
				    x = 20.5 * (0.025) + (0);
				    y = 0.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 9 * (0.04);
				};
				class Stat01Background: RscMarXetText
				{
				    idc = 22305;

				    x = 20.5 * (0.025) + (0);
				    y = 10 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {0,0,0,0.5};
				};
				class Stat01Progress: RscMarXetProgress
				{
				    idc = 22306;

				    x = 20.5 * (0.025) + (0);
				    y = 10 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorText[] = {1,1,1,0.25};
				    colorBackground[] = {1,1,1,0.25};
				};
				class Stat01Label: RscMarXetText
				{
				    idc = 22307;

				    text = "ARMOR";
				    x = 20.5 * (0.025) + (0);
				    y = 10 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat01Value: RscMarXetStructuredText
				{
				    idc = 22308;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 10 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat02Background: RscMarXetText
				{
				    idc = 22309;

				    x = 20.5 * (0.025) + (0);
				    y = 11.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {0,0,0,0.5};
				};
				class Stat02Progress: RscMarXetProgress
				{
				    idc = 22310;

				    x = 20.5 * (0.025) + (0);
				    y = 11.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorText[] = {1,1,1,0.25};
				    colorBackground[] = {1,1,1,0.25};
				};
				class Stat02Label: RscMarXetText
				{
				    idc = 22311;

				    text = "ARMOR";
				    x = 20.5 * (0.025) + (0);
				    y = 11.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat02Value: RscMarXetStructuredText
				{
				    idc = 22312;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 11.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat03Background: RscMarXetText
				{
				    idc = 22313;

				    x = 20.5 * (0.025) + (0);
				    y = 13 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {0,0,0,0.5};
				};
				class Stat03Progress: RscMarXetProgress
				{
				    idc = 22314;

				    x = 20.5 * (0.025) + (0);
				    y = 13 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorText[] = {1,1,1,0.25};
				    colorBackground[] = {1,1,1,0.25};
				};
				class Stat03Label: RscMarXetText
				{
				    idc = 22315;

				    text = "ARMOR";
				    x = 20.5 * (0.025) + (0);
				    y = 13 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat03Value: RscMarXetStructuredText
				{
				    idc = 22316;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 13 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat04Background: RscMarXetText
				{
				    idc = 22317;

				    x = 20.5 * (0.025) + (0);
				    y = 14.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {0,0,0,0.5};
				};
				class Stat04Progress: RscMarXetProgress
				{
				    idc = 22318;

				    x = 20.5 * (0.025) + (0);
				    y = 14.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorText[] = {1,1,1,0.25};
				    colorBackground[] = {1,1,1,0.25};
				};
				class Stat04Label: RscMarXetText
				{
				    idc = 22319;

				    text = "ARMOR";
				    x = 20.5 * (0.025) + (0);
				    y = 14.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat04Value: RscMarXetStructuredText
				{
				    idc = 22320;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 14.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat05Background: RscMarXetText
				{
				    idc = 22321;

				    x = 20.5 * (0.025) + (0);
				    y = 16 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {0,0,0,0.5};
				};
				class Stat05Progress: RscMarXetProgress
				{
				    idc = 22322;

				    x = 20.5 * (0.025) + (0);
				    y = 16 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorText[] = {1,1,1,0.25};
				    colorBackground[] = {1,1,1,0.25};
				};
				class Stat05Label: RscMarXetText
				{
				    idc = 22323;

				    text = "ARMOR";
				    x = 20.5 * (0.025) + (0);
				    y = 16 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat05Value: RscMarXetStructuredText
				{
				    idc = 22324;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 16 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat06Background: RscMarXetText
				{
				    idc = 22325;

				    x = 20.5 * (0.025) + (0);
				    y = 17.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {0,0,0,0.5};
				};
				class Stat06Progress: RscMarXetProgress
				{
				    idc = 22326;

				    x = 20.5 * (0.025) + (0);
				    y = 17.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorText[] = {1,1,1,0.25};
				    colorBackground[] = {1,1,1,0.25};
				};
				class Stat06Label: RscMarXetText
				{
				    idc = 22327;

				    text = "ARMOR";
				    x = 20.5 * (0.025) + (0);
				    y = 17.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat06Value: RscMarXetStructuredText
				{
				    idc = 22328;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 17.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat07Background: RscMarXetText
				{
				    idc = 22329;

				    x = 20.5 * (0.025) + (0);
				    y = 19 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {0,0,0,0.5};
				};
				class Stat07Progress: RscMarXetProgress
				{
				    idc = 22330;

				    x = 20.5 * (0.025) + (0);
				    y = 19 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				    colorText[] = {1,1,1,0.25};
				    colorBackground[] = {1,1,1,0.25};
				};
				class Stat07Label: RscMarXetText
				{
				    idc = 22331;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 19 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class Stat07Value: RscMarXetStructuredText
				{
				    idc = 22332;

				    text = "0";
				    x = 20.5 * (0.025) + (0);
				    y = 19 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
				};
				class TimeLeftText: RscMarXetText
				{
				    idc = 22333;

				    text = "Time Left: ";
				    x = 20.1 * (0.025) + (0);
				    y = 20.5 * (0.04) + (0);
				    w = 4.5 * (0.025);
				    h = 1 * (0.04);
				};
				class TimeLeftActual: RscMarXetStructuredText
				{
				    idc = 22334;

				    text = "<t align='right'>99d 24h 60m 60s</t>";
				    x = 24 * (0.025) + (0);
				    y = 20.5 * (0.04) + (0);
				    w = 7.5 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {-1,-1,-1,0};
				};
				class NewBidEdit: RscMarXetEdit
				{
				    idc = 22335;

				    x = 24 * (0.025) + (0);
				    y = 22 * (0.04) + (0);
				    w = 7.5 * (0.025);
				    h = 1 * (0.04);
					onChar = "_this spawn ExileClient_marxet_gui_auctionView_onBidChar";
					onKeyDown = "_this spawn ExileClient_marxet_gui_auctionView_onBidKeyDown";
				};
				class NewBidText: RscMarXetStructuredText
				{
				    idc = 22336;

				    text = "<t size='1'>New bid:</t>";
				    x = 20.1 * (0.025) + (0);
				    y = 22 * (0.04) + (0);
				    w = 4.5 * (0.025);
				    h = 1 * (0.04);
				    colorBackground[] = {-1,-1,-1,0};
				};
				class ButtonAddBid: RscMarXetButtonMenu
				{
				    idc = 22337;

				    text = "ADD BID";
				    x = 20.5 * (0.025) + (0);
				    y = 23.5 * (0.04) + (0);
				    w = 11 * (0.025);
				    h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_auctionView_onBidButtonClick";
				};
			};
		};

		class AuctionCreate: RscMarXetControlsGroup
		{
			idc = 22031;
			x = 4 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 32 * (0.025);
			h = 25 * (0.04);
			show = 0;
			class Controls
			{
				class Title: RscMarXetStructuredText
				{
					idc = 22401;

					text = "<t size='2' shadow='0' align='center'>Junk in your trunk?<br/><t size='1.2'>Sell your junk on Exile's finest inmate Market</t></t>";
					x = 0 * (0.025) + (0);
					y = 1 * (0.04) + (0);
					w = 32 * (0.025);
					h = 6 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class NewListingCreatingText: RscMarXetStructuredText
				{
					idc = 22402;

					text = "<t shadow='0' align='center'>Creating new listing for <t color='#ff0000'>DISPLAY_NAME</t></t>";
					x = 0 * (0.025) + (0);
					y = 7.5 * (0.04) + (0);
					w = 32 * (0.025);
					h = 1.5 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class ItemPicture: RscMarXetPictureKeepAspect
				{
					idc = 22403;

					text = "#(argb,8,8,3)color(1,1,1,1)";
					x = 4 * (0.025) + (0);
					y = 9 * (0.04) + (0);
					w = 12.5 * (0.025);
					h = 10 * (0.04);
				};
				class Stat01Background: RscMarXetText
				{
					idc = 22404;

					x = 17 * (0.025) + (0);
					y = 9 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {0,0,0,0.5};
				};
				class Stat01Progress: RscMarXetProgress
				{
					idc = 22405;

					x = 17 * (0.025) + (0);
					y = 9 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorText[] = {1,1,1,0.25};
					colorBackground[] = {1,1,1,0.25};
				};
				class Stat01Label: RscMarXetText
				{
					idc = 22406;

					text = "ARMOR";
					x = 17 * (0.025) + (0);
					y = 9 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat01Value: RscMarXetStructuredText
				{
					idc = 22407;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 9 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat02Background: RscMarXetText
				{
					idc = 22408;

					x = 17 * (0.025) + (0);
					y = 10.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {0,0,0,0.5};
				};
				class Stat02Progress: RscMarXetProgress
				{
					idc = 22409;

					x = 17 * (0.025) + (0);
					y = 10.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorText[] = {1,1,1,0.25};
					colorBackground[] = {1,1,1,0.25};
				};
				class Stat02Label: RscMarXetText
				{
					idc = 22410;

					text = "ARMOR";
					x = 17 * (0.025) + (0);
					y = 10.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat02Value: RscMarXetStructuredText
				{
					idc = 22411;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 10.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat03Background: RscMarXetText
				{
					idc = 22412;

					x = 17 * (0.025) + (0);
					y = 12 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {0,0,0,0.5};
				};
				class Stat03Progress: RscMarXetProgress
				{
					idc = 22413;

					x = 17 * (0.025) + (0);
					y = 12 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorText[] = {1,1,1,0.25};
					colorBackground[] = {1,1,1,0.25};
				};
				class Stat03Label: RscMarXetText
				{
					idc = 22414;

					text = "ARMOR";
					x = 17 * (0.025) + (0);
					y = 12 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat03Value: RscMarXetStructuredText
				{
					idc = 22415;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 12 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat04Background: RscMarXetText
				{
					idc = 22416;

					x = 17 * (0.025) + (0);
					y = 13.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {0,0,0,0.5};
				};
				class Stat04Progress: RscMarXetProgress
				{
					idc = 22417;

					x = 17 * (0.025) + (0);
					y = 13.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorText[] = {1,1,1,0.25};
					colorBackground[] = {1,1,1,0.25};
				};
				class Stat04Label: RscMarXetText
				{
					idc = 22418;

					text = "ARMOR";
					x = 17 * (0.025) + (0);
					y = 13.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat04Value: RscMarXetStructuredText
				{
					idc = 22419;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 13.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat05Background: RscMarXetText
				{
					idc = 22420;

					x = 17 * (0.025) + (0);
					y = 15 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {0,0,0,0.5};
				};
				class Stat05Progress: RscMarXetProgress
				{
					idc = 22421;

					x = 17 * (0.025) + (0);
					y = 15 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorText[] = {1,1,1,0.25};
					colorBackground[] = {1,1,1,0.25};
				};
				class Stat05Label: RscMarXetText
				{
					idc = 22422;

					text = "ARMOR";
					x = 17 * (0.025) + (0);
					y = 15 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat05Value: RscMarXetStructuredText
				{
					idc = 22423;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 15 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat06Background: RscMarXetText
				{
					idc = 22424;

					x = 17 * (0.025) + (0);
					y = 16.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {0,0,0,0.5};
				};
				class Stat06Progress: RscMarXetProgress
				{
					idc = 22425;

					x = 17 * (0.025) + (0);
					y = 16.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorText[] = {1,1,1,0.25};
					colorBackground[] = {1,1,1,0.25};
				};
				class Stat06Label: RscMarXetText
				{
					idc = 22426;

					text = "ARMOR";
					x = 17 * (0.025) + (0);
					y = 16.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat06Value: RscMarXetStructuredText
				{
					idc = 22427;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 16.5 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat07Background: RscMarXetText
				{
					idc = 22428;

					x = 17 * (0.025) + (0);
					y = 18 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {0,0,0,0.5};
				};
				class Stat07Progress: RscMarXetProgress
				{
					idc = 22429;

					x = 17 * (0.025) + (0);
					y = 18 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
					colorText[] = {1,1,1,0.25};
					colorBackground[] = {1,1,1,0.25};
				};
				class Stat07Label: RscMarXetText
				{
					idc = 22430;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 18 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class Stat07Value: RscMarXetStructuredText
				{
					idc = 22431;

					text = "0";
					x = 17 * (0.025) + (0);
					y = 18 * (0.04) + (0);
					w = 11 * (0.025);
					h = 1 * (0.04);
				};
				class AuctionLengthText: RscMarXetText
				{
					idc = 22432;

					text = "Auction Length:";
					x = 18.3 * (0.025) + (0);
					y = 19.5 * (0.04) + (0);
					w = 6 * (0.025);
					h = 1 * (0.04);
				};
				class DayEdit: RscMarXetEdit
				{
					idc = 22433;
					text = "1";
					x = 18.7 * (0.025) + (0);
					y = 20.5 * (0.04) + (0);
					w = 2 * (0.025);
					h = 1 * (0.04);
					onChar = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceChar";
					onKeyDown = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceKeyDown";
				};
				class DayText: RscMarXetText
				{
					idc = 22434;
					text = "days";
					x = 20.5 * (0.025) + (0);
					y = 20.5 * (0.04) + (0);
					w = 2 * (0.025);
					h = 1 * (0.04);
				};
				class HourEdit: RscMarXetEdit
				{
					idc = 22435;
					text = "1";
					x = 22.7 * (0.025) + (0);
					y = 20.5 * (0.04) + (0);
					w = 2 * (0.025);
					h = 1 * (0.04);
					onChar = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceChar";
					onKeyDown = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceKeyDown";
				};
				class HourText: RscMarXetText
				{
					idc = 22436;
					text = "hours";
					x = 24.5 * (0.025) + (0);
					y = 20.5 * (0.04) + (0);
					w = 2.5 * (0.025);
					h = 1 * (0.04);
				};
				class MinEdit: RscMarXetEdit
				{
					idc = 22437;
					text = "1";
					x = 27.1 * (0.025) + (0);
					y = 20.5 * (0.04) + (0);
					w = 2 * (0.025);
					h = 1 * (0.04);
					onChar = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceChar";
					onKeyDown = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceKeyDown";
				};
				class MinText: RscMarXetText
				{
					idc = 22438;
					text = "mins";
					x = 29 * (0.025) + (0);
					y = 20.5 * (0.04) + (0);
					w = 2.5 * (0.025);
					h = 1 * (0.04);
				};
				class ListPriceText: RscMarXetText
				{
					idc = 22439;

					text = "Starting Price:";
					x = 18.3 * (0.025) + (0);
					y = 22 * (0.04) + (0);
					w = 5.5 * (0.025);
					h = 1 * (0.04);
				};
				class ListPriceEdit: RscMarXetEdit
				{
					idc = 22440;

					x = 24 * (0.025) + (0);
					y = 22 * (0.04) + (0);
					w = 7.5 * (0.025);
					h = 1 * (0.04);
					onChar = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceChar";
					onKeyDown = "_this spawn ExileClient_marxet_gui_auctionCreate_onPriceKeyDown";
				};
				class ButtonCreateNewListing: RscMarXetButtonMenu
				{
					idc = 22441;

					text = "Create New Listing";
					x = 18.5 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 13 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_auctionCreate_onCreateButtonClick";
				};
			};
		};
		class AuctionMine: RscMarXetControlsGroup
		{
			idc = 22032;
			x = 4 * (0.025) + (0);
			y = 0 * (0.04) + (0);
			w = 32 * (0.025);
			h = 25 * (0.04);
			show = 0;
			class Controls
			{
				class MyListingsListbox: RscMarXetListBox
				{
				    idc = 22501;

				    x = 0.5 * (0.025) + (0);
				    y = 0.5 * (0.04) + (0);
				    w = 17.5 * (0.025);
				    h = 24 * (0.04);
					onLBSelChanged = "_this call ExileClient_marxet_gui_auctionMine_updateListingInfo";
				};
				class ListingInformation: RscMarXetStructuredText
				{
				    idc = 22502;

				    text = "<t shadow='0' size='1.2' align='center'>Listed Item</t>";
				    x = 18 * (0.025) + (0);
					y = 0.5 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1.5 * (0.04);
				    colorBackground[] = {-1,-1,-1,0};
				};
				class DisplayName: RscMarXetStructuredText
				{
				    idc = 22503;

				    text = "<t shadow='0' align='center'>DISPLAY_NAME</t>";
					x = 18 * (0.025) + (0);
					y = 2 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class ItemPicture: RscMarXetPictureKeepAspect
				{
					idc = 22504;
					text = "";
					x = 20 * (0.025) + (0);
					y = 3 * (0.04) + (0);
					w = 10 * (0.025);
					h = 8 * (0.04);
				};
				class CurrentBidPrice: RscMarXetStructuredText
				{
					idc = 22505;

					text = "<t shadow='0' align='center'>150 poptabs</t>";
					x = 18 * (0.025) + (0);
					y = 12 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class CreatedOnDate: RscMarXetStructuredText
				{
				    idc = 22506;

				    text = "<t shadow='0' align='center'>Created: Aug,18 2018</t>";
				    x = 18 * (0.025) + (0);
					y = 11 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1 * (0.04);
				    colorBackground[] = {-1,-1,-1,0};
				};
				class Bids: RscMarXetStructuredText
				{
				    idc = 22507;

				    text = "<t shadow='0' align='center'>0 Bids</t>";
				    x = 18 * (0.025) + (0);
					y = 13 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1 * (0.04);
				    colorBackground[] = {-1,-1,-1,0};
				};
				class Timeleft: RscMarXetStructuredText
				{
				    idc = 22508;

				    text = "<t shadow='0' align='center'>99d 24h 60m 60s</t>";
				    x = 18 * (0.025) + (0);
					y = 14 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1 * (0.04);
				    colorBackground[] = {-1,-1,-1,0};
				};
				class DangerZoneTitle: RscMarXetStructuredText
				{
					idc = 22509;
					text = "<t size='1.2' align='center' color='#C72651'>DANGER ZONE</t>";
					x = 18 * (0.025) + (0);
					y = 21 * (0.04) + (0);
					w = 14.5 * (0.025);
					h = 1.5 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class RemovalFeeTitle: RscMarXetStructuredText
				{
					idc = 22510;
					text = "<t>Removal Fee: 1000</t>";
					x = 18.2 * (0.025) + (0);
					y = 22.5 * (0.04) + (0);
					w = 14 * (0.025);
					h = 1 * (0.04);
					colorBackground[] = {-1,-1,-1,0};
				};
				class ButtonDelete: RscMarXetButtonMenu
				{
					idc = 22511;
					text = "Delete Listing";
					x = 18.5 * (0.025) + (0);
					y = 23.5 * (0.04) + (0);
					w = 13 * (0.025);
					h = 1 * (0.04);
					onButtonClick = "call ExileClient_marxet_gui_tradeMine_onDeleteButtonClick";
					tooltip = "Removing a listing will refund the listed item/vehicle and you will be charged the removal fee above";
				};
			};
		};
	};
};
