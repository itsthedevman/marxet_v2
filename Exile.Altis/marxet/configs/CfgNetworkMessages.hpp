/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/

class updateRespect
{
    module = "marxet_system";
    parameters[] = {
        "SCALAR"
    };
};

class createTradeRequest
{
    module = "marxet_system";
    parameters[] = {
        "ARRAY",
        "ARRAY",
        "BOOL",
        "SCALAR",
        "STRING"
    };
};

class createTradeResponse
{
    module = "marxet_system";
    parameters[] = {
        "BOOL",
        "STRING"
    };
};

class deleteTradeRequest
{
    module = "marxet_system";
    parameters[] = {
        "STRING"
    };
};

class deleteTradeResponse
{
    module = "marxet_system";
    parameters[] = {
        "BOOL",
        "STRING"
    };
};

class editTradeRequest
{
    module = "marxet_system";
    parameters[] = {
        "STRING",
        "ARRAY",
        "BOOL"
    };
};

class editTradeResponse
{
    module = "marxet_system";
    parameters[] = {
        "BOOL",
        "STRING"
    };
};

class tradeRequest
{
    module = "marxet_system";
    parameters[] = {
        "STRING",
        "STRING",
        "SCALAR",
        "STRING",
        "ARRAY"
    };
};

class tradeResponse
{
    module = "marxet_system";
    parameters[] = {
        "BOOL",
        "STRING",
        "BOOL",
        "STRING"
    };
};

class bidRequest
{
    module = "marxet_system";
    parameters[] = {
        "STRING",
        "STRING"
    };
};

class bidResponse
{
    module = "marxet_system";
    parameters[] = {
        "BOOL",
        "STRING"
    };
};

class createListingRequest
{
    module = "marxet_system";
    parameters[] = {
        "ARRAY",
        "STRING",
        "ARRAY",
        "SCALAR",
        "STRING"
    };
};

class createListingResponse
{
    module = "marxet_system";
    parameters[] = {
        "BOOL",
        "STRING"
    };
};

class deleteListingRequest
{
    module = "marxet_system";
    parameters[] = {
        "STRING"
    };
};

class deleteListingResponse
{
    module = "marxet_system";
    parameters[] = {
        "BOOL",
        "STRING"
    };
};
