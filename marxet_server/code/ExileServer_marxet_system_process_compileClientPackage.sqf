/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/
private["_code"];
MarXetClientPackage = compileFinal ('
{
    private _code = compileFinal (_x select 1);
    missionNamespace setVariable [_x select 0, _code];
}
forEach ' + str(MarXetClientFunctions) + ';
call ExileClient_marxet_system_process_preInit;');
publicVariable "MarXetClientPackage";
MarXetClientFunctions = nil;
