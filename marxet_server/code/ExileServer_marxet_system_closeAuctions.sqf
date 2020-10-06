/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
 
{
	(_x select 0) call ExileServer_marxet_system_request_auction_close;
}
forEach ("loadMarxetClosedAuctions" call ExileServer_system_database_query_selectFull);