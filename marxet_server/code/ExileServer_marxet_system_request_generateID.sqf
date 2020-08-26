/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_numbers","_alpha","_listingID","_generatingListingID","_i"];
_numbers = "1234567890";
_alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
_listingID = "";
_generatingListingID = true;
while {_generatingListingID} do
{
	_listingID = "";
	for "_i" from 1 to 4 do
	{
		_listingID = _listingID + (_alpha select [floor (random 51), 1]);
	};
    for "_i" from 1 to 6 do
	{
		_listingID = _listingID + (_numbers select [floor (random 9), 1]);
	};
	if !(_listingID in MarXetIDs) then
	{
		_generatingListingID = false;
	};
};
_listingID
