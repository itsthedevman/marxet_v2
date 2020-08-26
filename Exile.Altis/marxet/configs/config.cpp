/*
    MarXet v2.0
    Written by WolfkillArcadia
    CC BY-NC-SA 4.0
*/

class CfgMarXet
{
    class Settings
    {
        /*
            The factor of the buy price to be charged to the player when they remove a listing from MarXet
            Options:
                Any number from 0 to 1 (Same as sellPriceFactor for trading)
            Note:
                If a item sells for 5000 poptabs, the removal fee would be 2500 poptabs
                5000 * 0.5 = 2500
        */
        removalFeeFactor = 0.5;

        class Vehicles
        {
            /*
                Allow vehicles to be listable.
                Options:
                    0: Disallow
                    1: Allow
                Note:
                    If you set this value to be 0 (disallow), make sure to go through the Requestables below and
                    remove any vehicles as these will not be filtered out automagically.
            */
            allowVehiclesToBeListed = 1;

            /*
                The minimum required overall health for a vehicle in order for it to be listed/tradeable.
                Overall health is an average of a vehicles Hull, Engine, Body and Wheel damages.
                Options:
                    0 - 100 (Percentage)
            */
            overallVehicleHealth = 85;

            /*
                Enables or disables the addition of a Rekey Fee when trading for a vehicle.
                This will automatically be added to the requests list when selecting a vehicle.
                Fees are calculated just like Exile's Rekey system and cost poptabs
                Options:
                    0: Do not add a rekey fee
                    1: Add a rekey fee
                Note:
                    If a trade already has "ExileMoney" as a requested item, the rekey fee will be added to it.
            */
            addRekeyFee = 1;

            /*
                Settings for spawning vehicles statically
            */
            class Static
            {
                /*
                    Enable or disable using a static spawn location
                    Options:
                        0: Disable static spawning (Uses dynamic random spawning like Exile)
                        1: Use the below classnames to find a spawn location within 50m of the trader
                */
                useStaticSpawning = 0;

                /*
                    A classname of an object placed in the world. This one is only for boats
                */
                boatSpawnClassname = "Land_HelipadEmpty_F";

                /*
                    A classname of an object placed in the world. This one is only for Air vehicles (plane, helicopter)
                */
                airSpawnClassname = "Land_HelipadCircle_F";

                /*
                    A classname of an object placed in the world. This is for all other vehicles (land vehicles)
                */
                landSpawnClassname = "Land_HelipadSquare_F";
            };
        };

        class Logging
        {
            /*
                Log trades (create, complete) and auction (create, bid, complete) to trading.log that is generated with extDB
                Options:
                    0: Do not log to file
                    1: Log to file
            */
            logToFile = 1;

            /*
                Log trades (create, complete) and auction (create, bid, complete) to logging channel through Exile Server Manager
                Option:
                    0: Do not log to Discord
                    1: Log to Discord
            */
            logToDiscord = 0;
        };

        class Auction
        {
            maxLength[] = {15, 0, 0};
            minLength[] = {0, 0, 0};
        };
    };

    /*
        A list of categories and items available to players for requests. This is practically a duplicate of CfgTraderCategories.
    */
	class Requestable
    {
        class Currency
        {
            name = "Currency";
            icon = "\exile_assets\texture\ui\poptab_notification_ca.paa";
            items[] =
            {
                "ExileMoney",  // Poptabs
                "ExileScore"   // Respect
            };
        };

        class Uniforms
        {
            name = "Uniforms";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
            items[] =
            {
                "U_C_Journalist",
                "U_C_Poloshirt_blue",
                "U_C_Poloshirt_burgundy",
                "U_C_Poloshirt_salmon",
                "U_C_Poloshirt_stripped",
                "U_C_Poloshirt_tricolour",
                "U_C_Poor_1",
                "U_C_Poor_2",
                "U_C_Poor_shorts_1",
                "U_C_Scientist",
                "U_OrestesBody",
                "U_Rangemaster",
                "U_NikosAgedBody",
                "U_NikosBody",
                "U_Competitor",
                "U_B_CombatUniform_mcam",
                "U_B_CombatUniform_mcam_tshirt",
                "U_B_CombatUniform_mcam_vest",
                "U_B_CombatUniform_mcam_worn",
                "U_B_CTRG_1",
                "U_B_CTRG_2",
                "U_B_CTRG_3",
                "U_I_CombatUniform",
                "U_I_CombatUniform_shortsleeve",
                "U_I_CombatUniform_tshirt",
                "U_I_OfficerUniform",
                "U_O_CombatUniform_ocamo",
                "U_O_CombatUniform_oucamo",
                "U_O_OfficerUniform_ocamo",
                "U_B_SpecopsUniform_sgg",
                "U_O_SpecopsUniform_blk",
                "U_O_SpecopsUniform_ocamo",
                "U_I_G_Story_Protagonist_F",
                "Exile_Uniform_Woodland",
                "U_C_HunterBody_grn",
                "U_IG_Guerilla1_1",
                "U_IG_Guerilla2_1",
                "U_IG_Guerilla2_2",
                "U_IG_Guerilla2_3",
                "U_IG_Guerilla3_1",
                "U_BG_Guerilla2_1",
                "U_IG_Guerilla3_2",
                "U_BG_Guerrilla_6_1",
                "U_BG_Guerilla1_1",
                "U_BG_Guerilla2_2",
                "U_BG_Guerilla2_3",
                "U_BG_Guerilla3_1",
                "U_BG_leader",
                "U_IG_leader",
                "U_I_G_resistanceLeader_F",
                "U_B_FullGhillie_ard",
                "U_B_FullGhillie_lsh",
                "U_B_FullGhillie_sard",
                "U_B_GhillieSuit",
                "U_I_FullGhillie_ard",
                "U_I_FullGhillie_lsh",
                "U_I_FullGhillie_sard",
                "U_I_GhillieSuit",
                "U_O_FullGhillie_ard",
                "U_O_FullGhillie_lsh",
                "U_O_FullGhillie_sard",
                "U_O_GhillieSuit",
                "U_I_Wetsuit",
                "U_O_Wetsuit",
                "U_B_Wetsuit",
                "U_B_survival_uniform",
                "U_B_HeliPilotCoveralls",
                "U_I_HeliPilotCoveralls",
                "U_B_PilotCoveralls",
                "U_I_pilotCoveralls",
                "U_O_PilotCoveralls",
                "U_B_T_Soldier_F",
                "U_B_T_Soldier_AR_F",
                "U_B_T_Soldier_SL_F",
                "U_B_T_Sniper_F",
                "U_B_T_FullGhillie_tna_F",
                "U_B_CTRG_Soldier_F",
                "U_B_CTRG_Soldier_2_F",
                "U_B_CTRG_Soldier_3_F",
                "U_B_GEN_Soldier_F",
                "U_B_GEN_Commander_F",
                "U_O_T_Soldier_F",
                "U_O_T_Officer_F",
                "U_O_T_Sniper_F",
                "U_O_T_FullGhillie_tna_F",
                "U_O_V_Soldier_Viper_F",
                "U_O_V_Soldier_Viper_hex_F",
                "U_I_C_Soldier_Para_1_F",
                "U_I_C_Soldier_Para_2_F",
                "U_I_C_Soldier_Para_3_F",
                "U_I_C_Soldier_Para_4_F",
                "U_I_C_Soldier_Para_5_F",
                "U_I_C_Soldier_Bandit_1_F",
                "U_I_C_Soldier_Bandit_2_F",
                "U_I_C_Soldier_Bandit_3_F",
                "U_I_C_Soldier_Bandit_4_F",
                "U_I_C_Soldier_Bandit_5_F",
                "U_I_C_Soldier_Camo_F",
                "U_C_man_sport_1_F",
                "U_C_man_sport_2_F",
                "U_C_man_sport_3_F",
                "U_C_Man_casual_1_F",
                "U_C_Man_casual_2_F",
                "U_C_Man_casual_3_F",
                "U_C_Man_casual_4_F",
                "U_C_Man_casual_5_F",
                "U_C_Man_casual_6_F",
                "U_B_CTRG_Soldier_urb_1_F",
                "U_B_CTRG_Soldier_urb_2_F",
                "U_B_CTRG_Soldier_urb_3_F"
            };
        };

        class Vests
        {
            name = "Vests";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa";
            items[] =
            {
                "V_Press_F",
                "V_Rangemaster_belt",
                "V_TacVest_blk",
                "V_TacVest_blk_POLICE",
                "V_TacVest_brn",
                "V_TacVest_camo",
                "V_TacVest_khk",
                "V_TacVest_oli",
                "V_TacVestCamo_khk",
                "V_TacVestIR_blk",
                "V_I_G_resistanceLeader_F",
                "V_BandollierB_blk",
                "V_BandollierB_cbr",
                "V_BandollierB_khk",
                "V_BandollierB_oli",
                "V_BandollierB_rgr",
                "V_Chestrig_blk",
                "V_Chestrig_khk",
                "V_Chestrig_oli",
                "V_Chestrig_rgr",
                "V_HarnessO_brn",
                "V_HarnessO_gry",
                "V_HarnessOGL_brn",
                "V_HarnessOGL_gry",
                "V_HarnessOSpec_brn",
                "V_HarnessOSpec_gry",
                "V_PlateCarrier1_blk",
                "V_PlateCarrier1_rgr",
                "V_PlateCarrier2_rgr",
                "V_PlateCarrier3_rgr",
                "V_PlateCarrierGL_blk",
                "V_PlateCarrierGL_mtp",
                "V_PlateCarrierGL_rgr",
                "V_PlateCarrierH_CTRG",
                "V_PlateCarrierIA1_dgtl",
                "V_PlateCarrierIA2_dgtl",
                "V_PlateCarrierIAGL_dgtl",
                "V_PlateCarrierIAGL_oli",
                "V_PlateCarrierL_CTRG",
                "V_PlateCarrierSpec_blk",
                "V_PlateCarrierSpec_mtp",
                "V_PlateCarrierSpec_rgr",
                "V_TacChestrig_grn_F",
                "V_TacChestrig_oli_F",
                "V_TacChestrig_cbr_F",
                "V_PlateCarrier1_tna_F",
                "V_PlateCarrier2_tna_F",
                "V_PlateCarrierSpec_tna_F",
                "V_PlateCarrierGL_tna_F",
                "V_HarnessO_ghex_F",
                "V_HarnessOGL_ghex_F",
                "V_BandollierB_ghex_F",
                "V_TacVest_gen_F",
                "V_PlateCarrier1_rgr_noflag_F",
                "V_PlateCarrier2_rgr_noflag_F",
                "V_DeckCrew_yellow_F",
                "V_DeckCrew_blue_F",
                "V_DeckCrew_green_F",
                "V_DeckCrew_red_F",
                "V_DeckCrew_white_F",
                "V_DeckCrew_brown_F",
                "V_DeckCrew_violet_F"
            };
        };

        class Headgear
        {
            name = "Headgear";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
            items[] =
            {
                "Exile_Headgear_SantaHat",
                "Exile_Headgear_SafetyHelmet",
                "H_Cap_blk",
                "H_Cap_blk_Raven",
                "H_Cap_blu",
                "H_Cap_brn_SPECOPS",
                "H_Cap_grn",
                "H_Cap_headphones",
                "H_Cap_khaki_specops_UK",
                "H_Cap_oli",
                "H_Cap_press",
                "H_Cap_red",
                "H_Cap_tan",
                "H_Cap_tan_specops_US",
                "H_Watchcap_blk",
                "H_Watchcap_camo",
                "H_Watchcap_khk",
                "H_Watchcap_sgg",
                "H_MilCap_blue",
                "H_MilCap_dgtl",
                "H_MilCap_mcamo",
                "H_MilCap_ocamo",
                "H_MilCap_oucamo",
                "H_MilCap_rucamo",
                "H_Bandanna_camo",
                "H_Bandanna_cbr",
                "H_Bandanna_gry",
                "H_Bandanna_khk",
                "H_Bandanna_khk_hs",
                "H_Bandanna_mcamo",
                "H_Bandanna_sgg",
                "H_Bandanna_surfer",
                "H_Booniehat_dgtl",
                "H_Booniehat_dirty",
                "H_Booniehat_grn",
                "H_Booniehat_indp",
                "H_Booniehat_khk",
                "H_Booniehat_khk_hs",
                "H_Booniehat_mcamo",
                "H_Booniehat_tan",
                "H_Hat_blue",
                "H_Hat_brown",
                "H_Hat_camo",
                "H_Hat_checker",
                "H_Hat_grey",
                "H_Hat_tan",
                "H_StrawHat",
                "H_StrawHat_dark",
                "H_Beret_02",
                "H_Beret_blk",
                "H_Beret_blk_POLICE",
                "H_Beret_brn_SF",
                "H_Beret_Colonel",
                "H_Beret_grn",
                "H_Beret_grn_SF",
                "H_Beret_ocamo",
                "H_Beret_red",
                "H_Shemag_khk",
                "H_Shemag_olive",
                "H_Shemag_olive_hs",
                "H_Shemag_tan",
                "H_ShemagOpen_khk",
                "H_ShemagOpen_tan",
                "H_TurbanO_blk",
                "H_HelmetB",
                "H_HelmetB_black",
                "H_HelmetB_camo",
                "H_HelmetB_desert",
                "H_HelmetB_grass",
                "H_HelmetB_light",
                "H_HelmetB_light_black",
                "H_HelmetB_light_desert",
                "H_HelmetB_light_grass",
                "H_HelmetB_light_sand",
                "H_HelmetB_light_snakeskin",
                "H_HelmetB_paint",
                "H_HelmetB_plain_blk",
                "H_HelmetB_sand",
                "H_HelmetB_snakeskin",
                "H_HelmetCrew_B",
                "H_HelmetCrew_I",
                "H_HelmetCrew_O",
                "H_HelmetIA",
                "H_HelmetIA_camo",
                "H_HelmetIA_net",
                "H_HelmetLeaderO_ocamo",
                "H_HelmetLeaderO_oucamo",
                "H_HelmetO_ocamo",
                "H_HelmetO_oucamo",
                "H_HelmetSpecB",
                "H_HelmetSpecB_blk",
                "H_HelmetSpecB_paint1",
                "H_HelmetSpecB_paint2",
                "H_HelmetSpecO_blk",
                "H_HelmetSpecO_ocamo",
                "H_CrewHelmetHeli_B",
                "H_CrewHelmetHeli_I",
                "H_CrewHelmetHeli_O",
                "H_HelmetCrew_I",
                "H_HelmetCrew_B",
                "H_HelmetCrew_O",
                "H_PilotHelmetHeli_B",
                "H_PilotHelmetHeli_I",
                "H_PilotHelmetHeli_O",
                "H_Helmet_Skate",
                "H_HelmetB_TI_tna_F",
                "H_HelmetO_ViperSP_hex_F",
                "H_HelmetO_ViperSP_ghex_F",
                "H_HelmetB_tna_F",
                "H_HelmetB_Enh_tna_F",
                "H_HelmetB_Light_tna_F",
                "H_HelmetSpecO_ghex_F",
                "H_HelmetLeaderO_ghex_F",
                "H_HelmetO_ghex_F",
                "H_HelmetCrew_O_ghex_F",
                "H_MilCap_tna_F",
                "H_MilCap_ghex_F",
                "H_Booniehat_tna_F",
                "H_Beret_gen_F",
                "H_MilCap_gen_F",
                "H_Cap_oli_Syndikat_F",
                "H_Cap_tan_Syndikat_F",
                "H_Cap_blk_Syndikat_F",
                "H_Cap_grn_Syndikat_F"
            };
        };

        class Glasses
        {
            name = "Glasses";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\Goggles_ca.paa";
            items[] =
            {
                "G_Spectacles",
                "G_Spectacles_Tinted",
                "G_Combat",
                "G_Lowprofile",
                "G_Shades_Black",
                "G_Shades_Green",
                "G_Shades_Red",
                "G_Squares",
                "G_Squares_Tinted",
                "G_Sport_BlackWhite",
                "G_Sport_Blackyellow",
                "G_Sport_Greenblack",
                "G_Sport_Checkered",
                "G_Sport_Red",
                "G_Tactical_Black",
                "G_Aviator",
                "G_Lady_Mirror",
                "G_Lady_Dark",
                "G_Lady_Red",
                "G_Lady_Blue",
                "G_Diving",
                "G_B_Diving",
                "G_O_Diving",
                "G_I_Diving",
                "G_Goggles_VR",
                "G_Balaclava_blk",
                "G_Balaclava_oli",
                "G_Balaclava_combat",
                "G_Balaclava_lowprofile",
                "G_Bandanna_blk",
                "G_Bandanna_oli",
                "G_Bandanna_khk",
                "G_Bandanna_tan",
                "G_Bandanna_beast",
                "G_Bandanna_shades",
                "G_Bandanna_sport",
                "G_Bandanna_aviator",
                "G_Shades_Blue",
                "G_Sport_Blackred",
                "G_Tactical_Clear",
                "G_Balaclava_TI_blk_F",
                "G_Balaclava_TI_tna_F",
                "G_Balaclava_TI_G_blk_F",
                "G_Balaclava_TI_G_tna_F",
                "G_Combat_Goggles_tna_F"
            };
        };

        class PointerAttachments
        {
            name = "Pointer Attachments";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "acc_flashlight",
                "acc_pointer_IR"
            };
        };

        class BipodAttachments
        {
            name = "Bipod Attachments";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itembipod_ca.paa";
            items[] =
            {
                "bipod_01_F_blk",
                "bipod_01_F_mtp",
                "bipod_01_F_snd",
                "bipod_02_F_blk",
                "bipod_02_F_hex",
                "bipod_02_F_tan",
                "bipod_03_F_blk",
                "bipod_03_F_oli",
                "bipod_01_F_khk"
            };
        };

        class MuzzleAttachments
        {
            name = "Suppressor Attachments";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa";
            items[] =
            {
                "muzzle_snds_338_black",
                "muzzle_snds_338_green",
                "muzzle_snds_338_sand",
                "muzzle_snds_93mmg",
                "muzzle_snds_93mmg_tan",
                "muzzle_snds_acp",
                "muzzle_snds_B",
                "muzzle_snds_H",
                "muzzle_snds_H_MG",
                "muzzle_snds_H_SW",
                "muzzle_snds_L",
                "muzzle_snds_M",
                "muzzle_snds_H_khk_F",
                "muzzle_snds_H_snd_F",
                "muzzle_snds_58_blk_F",
                "muzzle_snds_m_khk_F",
                "muzzle_snds_m_snd_F",
                "muzzle_snds_B_khk_F",
                "muzzle_snds_B_snd_F",
                "muzzle_snds_58_wdm_F",
                "muzzle_snds_65_TI_blk_F",
                "muzzle_snds_65_TI_hex_F",
                "muzzle_snds_65_TI_ghex_F",
                "muzzle_snds_H_MG_blk_F",
                "muzzle_snds_H_MG_khk_F"
            };
        };

        class UAVs
        {
            name = "Unmanned Aerial Vehicles";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\gps_ca.paa";
            items[] =
            {
                "I_UavTerminal",
                "I_UAV_01_backpack_F"
            };
        };

        class StaticMGs
        {
            name = "Static Machine Guns";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "O_HMG_01_support_F",
                "O_HMG_01_weapon_F"
            };
        };

        class OpticAttachments
        {
            name = "Scopes";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
            items[] =
            {
                "optic_Aco",
                "optic_ACO_grn",
                "optic_ACO_grn_smg",
                "optic_Aco_smg",
                "optic_AMS",
                "optic_AMS_khk",
                "optic_AMS_snd",
                "optic_Arco",
                "optic_DMS",
                "optic_Hamr",
                "optic_Holosight",
                "optic_Holosight_smg",
                "optic_KHS_blk",
                "optic_KHS_hex",
                "optic_KHS_old",
                "optic_KHS_tan",
                "optic_LRPS",
                "optic_MRCO",
                "optic_MRD",
                "optic_Nightstalker",
                "optic_NVS",
                "optic_SOS",
                "optic_tws",
                "optic_tws_mg",
                "optic_Yorris",
                "optic_Arco_blk_F",
                "optic_Arco_ghex_F",
                "optic_DMS_ghex_F",
                "optic_Hamr_khk_F",
                "optic_ERCO_blk_F",
                "optic_ERCO_khk_F",
                "optic_ERCO_snd_F",
                "optic_SOS_khk_F",
                "optic_LRPS_tna_F",
                "optic_LRPS_ghex_F",
                "optic_Holosight_blk_F",
                "optic_Holosight_khk_F",
                "optic_Holosight_smg_blk_F"
            };
        };

        class Hardware
        {
            name = "Hardware";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {

                "Exile_Item_DuctTape",
                "Exile_Item_ExtensionCord",
                "Exile_Item_FuelCanisterEmpty",
                "Exile_Item_JunkMetal",
                "Exile_Item_LightBulb",
                "Exile_Item_MetalBoard",
                "Exile_Item_MetalPole",
                "Exile_Item_SafeKit",
                "Exile_Item_CamoTentKit",
                "Exile_Item_CodeLock",
                "Exile_Item_MetalScrews",
                "Exile_Item_MetalWire",
                "Exile_Item_Laptop",
                "Exile_Item_BaseCameraKit",
                "Exile_Item_MetalHedgehogKit",
                "Exile_Item_Cement",
                "Exile_Item_Sand",
                "Exile_Item_MobilePhone",
                "Exile_Item_SprayCan_Black",
                "Exile_Item_SprayCan_Red",
                "Exile_Item_SprayCan_Green",
                "Exile_Item_SprayCan_White",
                "Exile_Item_SprayCan_Blue",
                "Exile_Item_CordlessScrewdriver",
                "Exile_Item_FireExtinguisher",
                "Exile_Item_OilCanister",
                "Exile_Item_Hammer",
                "Exile_Item_Carwheel",
                "Exile_Item_SleepingMat",
                "Exile_Item_Defibrillator",
                "Exile_Item_Wrench",
                "Exile_Item_Rope"
            };
        };

        class Food
        {
            name = "Fast Food";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Item_EMRE",
                "Exile_Item_GloriousKnakworst",
                "Exile_Item_Surstromming",
                "Exile_Item_SausageGravy",
                "Exile_Item_Catfood",
                "Exile_Item_ChristmasTinner",
                "Exile_Item_BBQSandwich",
                "Exile_Item_MacasCheese",
                "Exile_Item_Dogfood",
                "Exile_Item_BeefParts",
                "Exile_Item_Cheathas",
                "Exile_Item_Noodles",
                "Exile_Item_SeedAstics",
                "Exile_Item_Raisins",
                "Exile_Item_Moobar",
                "Exile_Item_InstantCoffee",
                "Exile_Item_SheepSteak_Cooked",
                "Exile_Item_AlsatianSteak_Cooked",
                "Exile_Item_CatSharkFilet_Cooked",
                "Exile_Item_FinSteak_Cooked",
                "Exile_Item_GoatSteak_Cooked",
                "Exile_Item_TurtleFilet_Cooked",
                "Exile_Item_TunaFilet_Cooked",
                "Exile_Item_RabbitSteak_Cooked",
                "Exile_Item_ChickenFilet_Cooked",
                "Exile_Item_RoosterFilet_Cooked",
                "Exile_Item_MulletFilet_Cooked",
                "Exile_Item_SalemaFilet_Cooked",
                "Exile_Item_MackerelFilet_Cooked",
                "Exile_Item_OrnateFilet_Cooked",
                "Exile_Item_SnakeFilet_Cooked",
                "Exile_Item_CatSharkFilet_Raw",
                "Exile_Item_TunaFilet_Raw",
                "Exile_Item_AlsatianSteak_Raw",
                "Exile_Item_TurtleFilet_Raw",
                "Exile_Item_SheepSteak_Raw",
                "Exile_Item_FinSteak_Raw",
                "Exile_Item_GoatSteak_Raw",
                "Exile_Item_ChickenFilet_Raw",
                "Exile_Item_RoosterFilet_Raw",
                "Exile_Item_MackerelFilet_Raw",
                "Exile_Item_MulletFilet_Raw",
                "Exile_Item_OrnateFilet_Raw",
                "Exile_Item_RabbitSteak_Raw",
                "Exile_Item_SalemaFilet_Raw",
                "Exile_Item_SnakeFilet_Raw"
            };
        };

        class NonVeganFood
        {
            name = "Non-Vegan Food";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Item_CatSharkFilet_Raw",
                "Exile_Item_TunaFilet_Raw",
                "Exile_Item_AlsatianSteak_Raw",
                "Exile_Item_TurtleFilet_Raw",
                "Exile_Item_SheepSteak_Raw",
                "Exile_Item_FinSteak_Raw",
                "Exile_Item_GoatSteak_Raw",
                "Exile_Item_ChickenFilet_Raw",
                "Exile_Item_RoosterFilet_Raw",
                "Exile_Item_MackerelFilet_Raw",
                "Exile_Item_MulletFilet_Raw",
                "Exile_Item_OrnateFilet_Raw",
                "Exile_Item_RabbitSteak_Raw",
                "Exile_Item_SalemaFilet_Raw",
                "Exile_Item_SnakeFilet_Raw"
            };
        };


        class Drinks
        {
            name = "Drinks";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Item_PlasticBottleCoffee",
                "Exile_Item_PowerDrink",
                "Exile_Item_PlasticBottleFreshWater",
                "Exile_Item_Beer",
                "Exile_Item_EnergyDrink",
                "Exile_Item_ChocolateMilk",
                "Exile_Item_MountainDupe",
                "Exile_Item_PlasticBottleEmpty"
            };
        };

        class Tools
        {
            name = "Tools";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Item_Matches",
                "Exile_Item_CookingPot",
                "Exile_Item_CanOpener",
                "Exile_Item_Handsaw",
                "Exile_Item_Pliers",
                "Exile_Item_Grinder",
                "Exile_Item_Foolbox",
                "Exile_Item_CordlessScrewdriver",
                "Exile_Item_FireExtinguisher",
                "Exile_Item_Hammer",
                "Exile_Item_OilCanister",
                "Exile_Item_Screwdriver",
                "Exile_Item_Shovel",
                "Exile_Item_Wrench",
                "Exile_Item_SleepingMat",
                "Exile_Item_ToiletPaper",
                "Exile_Item_ZipTie",
                "Exile_Item_BurlapSack",
                "Exile_Item_Bullets_556",
                "Exile_Item_Bullets_762",
                "Exile_Item_WeaponParts",
                "Binocular",
                "Rangefinder",
                "Laserdesignator",
                "Laserdesignator_02",
                "Laserdesignator_03",
                "ItemGPS",
                "ItemMap",
                "ItemCompass",
                "ItemRadio",
                "ItemWatch",
                "Exile_Item_XM8"
            };
        };

        class FirstAid
        {
            name = "FirstAid";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Item_InstaDoc",
                "Exile_Item_Bandage",
                "Exile_Item_Vishpirin",
                "Exile_Item_Heatpack",
                "Exile_Item_Defibrillator"
            };
        };

        class Navigation
        {
            name = "Special Environment";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "B_Parachute",
                "V_RebreatherB",
                "V_RebreatherIA",
                "V_RebreatherIR",
                "Exile_Headgear_GasMask",
                "G_Diving",
                "G_B_Diving",
                "G_O_Diving",
                "G_I_Diving",
                "NVGoggles",
                "NVGoggles_INDEP",
                "NVGoggles_OPFOR",
                "O_NVGoggles_hex_F",
                "O_NVGoggles_urb_F",
                "O_NVGoggles_ghex_F",
                "NVGoggles_tna_F"
            };
        };

        class Backpacks
        {
            name = "Backpacks";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
            items[] =
            {
                "B_AssaultPack_blk",
                "B_AssaultPack_cbr",
                "B_AssaultPack_dgtl",
                "B_AssaultPack_khk",
                "B_AssaultPack_mcamo",
                "B_AssaultPack_rgr",
                "B_AssaultPack_sgg",
                "B_Bergen_blk",
                "B_Bergen_mcamo",
                "B_Bergen_rgr",
                "B_Bergen_sgg",
                "B_Carryall_cbr",
                "B_Carryall_khk",
                "B_Carryall_mcamo",
                "B_Carryall_ocamo",
                "B_Carryall_oli",
                "B_Carryall_oucamo",
                "B_FieldPack_blk",
                "B_FieldPack_cbr",
                "B_FieldPack_ocamo",
                "B_FieldPack_oucamo",
                "B_HuntingBackpack",
                "B_Kitbag_cbr",
                "B_Kitbag_mcamo",
                "B_Kitbag_sgg",
                "B_OutdoorPack_blk",
                "B_OutdoorPack_blu",
                "B_OutdoorPack_tan",
                "B_TacticalPack_blk",
                "B_TacticalPack_mcamo",
                "B_TacticalPack_ocamo",
                "B_TacticalPack_oli",
                "B_TacticalPack_rgr",
                "B_Bergen_mcamo_F",
                "B_Bergen_dgtl_F",
                "B_Bergen_hex_F",
                "B_Bergen_tna_F",
                "B_AssaultPack_tna_F",
                "B_Carryall_ghex_F",
                "B_FieldPack_ghex_F",
                "B_ViperHarness_blk_F",
                "B_ViperHarness_ghex_F",
                "B_ViperHarness_hex_F",
                "B_ViperHarness_khk_F",
                "B_ViperHarness_oli_F",
                "B_ViperLightHarness_blk_F",
                "B_ViperLightHarness_ghex_F",
                "B_ViperLightHarness_hex_F",
                "B_ViperLightHarness_khk_F",
                "B_ViperLightHarness_oli_F"
            };
        };

        class Ammunition
        {
            name = "Ammunition";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\CargoMag_ca.paa";
            items[] =
            {
                "100Rnd_65x39_caseless_mag",
                "100Rnd_65x39_caseless_mag_Tracer",
                "10Rnd_127x54_Mag",
                "10Rnd_338_Mag",
                "10Rnd_762x54_Mag",
                "10Rnd_93x64_DMR_05_Mag",
                "11Rnd_45ACP_Mag",
                "130Rnd_338_Mag",
                "150Rnd_762x54_Box",
                "150Rnd_762x54_Box_Tracer",
                "150Rnd_93x64_Mag",
                "16Rnd_9x21_Mag",
                "200Rnd_65x39_cased_Box",
                "200Rnd_65x39_cased_Box_Tracer",
                "20Rnd_556x45_UW_mag",
                "20Rnd_762x51_Mag",
                "30Rnd_45ACP_Mag_SMG_01",
                "30Rnd_45ACP_Mag_SMG_01_tracer_green",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
                "30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
                "30Rnd_556x45_Stanag",
                "30Rnd_556x45_Stanag_Tracer_Green",
                "30Rnd_556x45_Stanag_Tracer_Red",
                "30Rnd_556x45_Stanag_Tracer_Yellow",
                "30Rnd_65x39_caseless_green",
                "30Rnd_65x39_caseless_green_mag_Tracer",
                "30Rnd_65x39_caseless_mag",
                "30Rnd_65x39_caseless_mag_Tracer",
                "30Rnd_9x21_Mag",
                "30Rnd_9x21_Yellow_Mag",
                "30Rnd_9x21_Green_Mag",
                "30Rnd_9x21_Red_Mag",
                "5Rnd_127x108_APDS_Mag",
                "5Rnd_127x108_Mag",
                "6Rnd_45ACP_Cylinder",
                "6Rnd_GreenSignal_F",
                "6Rnd_RedSignal_F",
                "7Rnd_408_Mag",
                "9Rnd_45ACP_Mag",
                "Exile_Magazine_30Rnd_762x39_AK",
                "Exile_Magazine_30Rnd_545x39_AK_Green",
                "Exile_Magazine_30Rnd_545x39_AK_Red",
                "Exile_Magazine_30Rnd_545x39_AK_White",
                "Exile_Magazine_30Rnd_545x39_AK_Yellow",
                "Exile_Magazine_45Rnd_545x39_RPK_Green",
                "Exile_Magazine_75Rnd_545x39_RPK_Green",
                "Exile_Magazine_20Rnd_762x51_DMR",
                "Exile_Magazine_20Rnd_762x51_DMR_Yellow",
                "Exile_Magazine_20Rnd_762x51_DMR_Red",
                "Exile_Magazine_20Rnd_762x51_DMR_Green",
                "Exile_Magazine_10Rnd_303",
                "Exile_Magazine_100Rnd_762x54_PK_Green",
                "Exile_Magazine_7Rnd_45ACP",
                "Exile_Magazine_8Rnd_9x18",
                "Exile_Magazine_30Rnd_545x39_AK",
                "Exile_Magazine_6Rnd_45ACP",
                "Exile_Magazine_5Rnd_22LR",
                "Exile_Magazine_10Rnd_762x54",
                "Exile_Magazine_10Rnd_9x39",
                "Exile_Magazine_20Rnd_9x39",
                "Exile_Magazine_8Rnd_74Pellets",
                "Exile_Magazine_8Rnd_74Slug",
                "30Rnd_9x21_Mag_SMG_02",
                "30Rnd_9x21_Mag_SMG_02_Tracer_Red",
                "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
                "30Rnd_9x21_Mag_SMG_02_Tracer_Green",
                "30Rnd_580x42_Mag_F",
                "30Rnd_580x42_Mag_Tracer_F",
                "100Rnd_580x42_Mag_F",
                "100Rnd_580x42_Mag_Tracer_F",
                "20Rnd_650x39_Cased_Mag_F",
                "10Rnd_50BW_Mag_F",
                "150Rnd_556x45_Drum_Mag_F",
                "150Rnd_556x45_Drum_Mag_Tracer_F",
                "30Rnd_762x39_Mag_F",
                "30Rnd_762x39_Mag_Green_F",
                "30Rnd_762x39_Mag_Tracer_F",
                "30Rnd_762x39_Mag_Tracer_Green_F",
                "30Rnd_545x39_Mag_F",
                "30Rnd_545x39_Mag_Green_F",
                "30Rnd_545x39_Mag_Tracer_F",
                "30Rnd_545x39_Mag_Tracer_Green_F",
                "200Rnd_556x45_Box_F",
                "200Rnd_556x45_Box_Red_F",
                "200Rnd_556x45_Box_Tracer_F",
                "200Rnd_556x45_Box_Tracer_Red_F",
                "10Rnd_9x21_Mag",
                "Exile_Magazine_5Rnd_127x108_Bullet_Cam_Mag",
                "Exile_Magazine_5Rnd_127x108_APDS_Bullet_Cam_Mag",
                "Exile_Magazine_10Rnd_93x64_DMR_05_Bullet_Cam_Mag",
                "Exile_Magazine_7Rnd_408_Bullet_Cam_Mag",
                "Exile_Magazine_10Rnd_338_Bullet_Cam_Mag",
                "Exile_Magazine_10Rnd_127x99_m107_Bullet_Cam_Mag",
                "Exile_Magazine_5Rnd_127x108_KSVK_Bullet_Cam_Mag",
                "Exile_Magazine_5Rnd_127x108_APDS_KSVK_Bullet_Cam_Mag",
                "Exile_Magazine_10Rnd_765x17_SA61",
                "Exile_Magazine_20Rnd_765x17_SA61",
                "Exile_Magazine_10Rnd_127x99_m107",
                "Exile_Magazine_5Rnd_127x108_APDS_KSVK",
                "Exile_Magazine_5Rnd_127x108_KSVK"
            };
        };

        class Flares
        {
            name = "Flares";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Chemlight_blue",
                "Chemlight_green",
                "Chemlight_red",
                "FlareGreen_F",
                "FlareRed_F",
                "FlareWhite_F",
                "FlareYellow_F",
                "UGL_FlareGreen_F",
                "UGL_FlareRed_F",
                "UGL_FlareWhite_F",
                "UGL_FlareYellow_F",
                "3Rnd_UGL_FlareGreen_F",
                "3Rnd_UGL_FlareRed_F",
                "3Rnd_UGL_FlareWhite_F",
                "3Rnd_UGL_FlareYellow_F"
            };
        };

        class Smokes
        {
            name = "Smokes";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "SmokeShell",
                "SmokeShellBlue",
                "SmokeShellGreen",
                "SmokeShellOrange",
                "SmokeShellPurple",
                "SmokeShellRed",
                "SmokeShellYellow",
                "1Rnd_Smoke_Grenade_shell",
                "1Rnd_SmokeBlue_Grenade_shell",
                "1Rnd_SmokeGreen_Grenade_shell",
                "1Rnd_SmokeOrange_Grenade_shell",
                "1Rnd_SmokePurple_Grenade_shell",
                "1Rnd_SmokeRed_Grenade_shell",
                "1Rnd_SmokeYellow_Grenade_shell",
                "3Rnd_Smoke_Grenade_shell",
                "3Rnd_SmokeBlue_Grenade_shell",
                "3Rnd_SmokeGreen_Grenade_shell",
                "3Rnd_SmokeOrange_Grenade_shell",
                "3Rnd_SmokePurple_Grenade_shell",
                "3Rnd_SmokeRed_Grenade_shell",
                "3Rnd_SmokeYellow_Grenade_shell"
            };
        };

        class Explosives
        {
            name = "Explosives";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargothrow_ca.paa";
            items[] =
            {
                "HandGrenade",
                "MiniGrenade",
                "B_IR_Grenade",
                "O_IR_Grenade",
                "I_IR_Grenade",
                "1Rnd_HE_Grenade_shell",
                "3Rnd_HE_Grenade_shell",
                "APERSBoundingMine_Range_Mag",
                "APERSMine_Range_Mag",
                "APERSTripMine_Wire_Mag",
                "ClaymoreDirectionalMine_Remote_Mag",
                "DemoCharge_Remote_Mag",
                "IEDLandBig_Remote_Mag",
                "IEDLandSmall_Remote_Mag",
                "IEDUrbanBig_Remote_Mag",
                "IEDUrbanSmall_Remote_Mag",
                "SatchelCharge_Remote_Mag",
                "SLAMDirectionalMine_Wire_Mag"
            };
        };

        class Pistols
        {
            name = "Pistols";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";
            items[] =
            {
                "hgun_ACPC2_F",
                "hgun_P07_F",
                "hgun_Pistol_heavy_01_F",
                "hgun_Pistol_heavy_02_F",
                "hgun_Pistol_Signal_F",
                "hgun_Rook40_F",
                "Exile_Weapon_Colt1911",
                "Exile_Weapon_Makarov",
                "Exile_Weapon_Taurus",
                "Exile_Weapon_TaurusGold",
                "hgun_Pistol_01_F",
                "hgun_P07_khk_F",
                "Exile_Weapon_SA61"
            };
        };

        class SubMachineGuns
        {
            name = "Sub Machine Guns";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "hgun_PDW2000_F",
                "SMG_01_F",
                "SMG_02_F",
                "SMG_05_F"
            };
        };

        class LightMachineGuns
        {
            name = "Light Machine Guns";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "arifle_MX_SW_Black_F",
                "arifle_MX_SW_F",
                "LMG_Mk200_F",
                "LMG_Zafir_F",
                "LMG_03_F",
                "Exile_Weapon_RPK",
                "Exile_Weapon_PK",
                "Exile_Weapon_PKP",
                "MMG_01_hex_F",
                "MMG_01_tan_F",
                "MMG_02_black_F",
                "MMG_02_camo_F",
                "MMG_02_sand_F"
            };
        };

        class AssaultRifles
        {
            name = "Assault Rifles";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "arifle_Katiba_C_F",
                "arifle_Katiba_F",
                "arifle_Katiba_GL_F",
                "arifle_Mk20_F",
                "arifle_Mk20_GL_F",
                "arifle_Mk20_GL_plain_F",
                "arifle_Mk20_plain_F",
                "arifle_Mk20C_F",
                "arifle_Mk20C_plain_F",
                "arifle_MX_Black_F",
                "arifle_MX_F",
                "arifle_MX_GL_Black_F",
                "arifle_MX_GL_F",
                "arifle_MXC_Black_F",
                "arifle_MXC_F",
                "arifle_SDAR_F",
                "arifle_TRG20_F",
                "arifle_TRG21_F",
                "arifle_TRG21_GL_F",
                "Exile_Weapon_AK107",
                "Exile_Weapon_AK107_GL",
                "Exile_Weapon_AK74",
                "Exile_Weapon_AK74_GL",
                "Exile_Weapon_AK47",
                "Exile_Weapon_AKS_Gold",
                "arifle_AK12_F",
                "arifle_AK12_GL_F",
                "arifle_AKM_F",
                "arifle_AKM_FL_F",
                "arifle_AKS_F",
                "arifle_ARX_blk_F",
                "arifle_ARX_ghex_F",
                "arifle_ARX_hex_F",
                "arifle_CTAR_blk_F",
                "arifle_CTAR_hex_F",
                "arifle_CTAR_ghex_F",
                "arifle_CTAR_GL_blk_F",
                "arifle_CTARS_blk_F",
                "arifle_CTARS_hex_F",
                "arifle_CTARS_ghex_F",
                "arifle_SPAR_01_blk_F",
                "arifle_SPAR_01_khk_F",
                "arifle_SPAR_01_snd_F",
                "arifle_SPAR_01_GL_blk_F",
                "arifle_SPAR_01_GL_khk_F",
                "arifle_SPAR_01_GL_snd_F",
                "arifle_SPAR_02_blk_F",
                "arifle_SPAR_02_khk_F",
                "arifle_SPAR_02_snd_F",
                "arifle_SPAR_03_blk_F",
                "arifle_SPAR_03_khk_F",
                "arifle_SPAR_03_snd_F",
                "arifle_MX_khk_F",
                "arifle_MX_GL_khk_F",
                "arifle_MXC_khk_F",
                "arifle_MXM_khk_F",
                "Exile_Weapon_M4",
                "Exile_Weapon_M16A4",
                "Exile_Weapon_M16A2"
            };
        };

        class Shotguns
        {
            name = "Shotguns";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Weapon_M1014"
            };
        };

        class SniperRifles
        {
            name = "Sniper Rifles";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "arifle_MXM_Black_F",
                "arifle_MXM_F",
                "srifle_DMR_01_F",
                "srifle_DMR_02_camo_F",
                "srifle_DMR_02_F",
                "srifle_DMR_02_sniper_F",
                "srifle_DMR_03_F",
                "srifle_DMR_03_khaki_F",
                "srifle_DMR_03_multicam_F",
                "srifle_DMR_03_tan_F",
                "srifle_DMR_03_woodland_F",
                "srifle_DMR_04_F",
                "srifle_DMR_04_Tan_F",
                "srifle_DMR_05_blk_F",
                "srifle_DMR_05_hex_F",
                "srifle_DMR_05_tan_f",
                "srifle_DMR_06_camo_F",
                "srifle_DMR_06_olive_F",
                "srifle_EBR_F",
                "srifle_GM6_camo_F",
                "srifle_GM6_F",
                "srifle_LRR_camo_F",
                "srifle_LRR_F",
                "Exile_Weapon_CZ550",
                "Exile_Weapon_SVD",
                "Exile_Weapon_SVDCamo",
                "Exile_Weapon_VSSVintorez",
                "Exile_Weapon_DMR",
                "Exile_Weapon_LeeEnfield",
                "srifle_LRR_tna_F",
                "srifle_GM6_ghex_F",
                "srifle_DMR_07_blk_F",
                "srifle_DMR_07_hex_F",
                "srifle_DMR_07_ghex_F",
                "Exile_Weapon_m107",
                "Exile_Weapon_ksvk"
            };
        };

        class Bikes
        {
            name = "Bikes";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Bike_OldBike",
                "Exile_Bike_MountainBike"
            };
        };

        class Cars
        {
            name = "Cars";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Car_BRDM2_HQ", // BRDM-2 (HQ)
                "Exile_Car_BTR40_MG_Green", // BTR 40 MG
                "Exile_Car_BTR40_MG_Camo", // BTR 40 MG
                "Exile_Car_BTR40_Green", // BTR 40
                "Exile_Car_BTR40_Camo", // BTR 40
                "Exile_Car_Golf_Red", // Golf
                "Exile_Car_Golf_Black", // Golf
                "Exile_Car_Hatchback_Beige", // Hatchback
                "Exile_Car_Hatchback_Green", // Hatchback
                "Exile_Car_Hatchback_Blue", // Hatchback
                "Exile_Car_Hatchback_BlueCustom", // Hatchback
                "Exile_Car_Hatchback_BeigeCustom", // Hatchback
                "Exile_Car_Hatchback_Yellow", // Hatchback
                "Exile_Car_Hatchback_Grey", // Hatchback
                "Exile_Car_Hatchback_Black", // Hatchback
                "Exile_Car_Hatchback_Dark", // Hatchback
                "Exile_Car_Hatchback_Rusty1", // Hatchback
                "Exile_Car_Hatchback_Rusty2", // Hatchback
                "Exile_Car_Hatchback_Rusty3", // Hatchback
                "Exile_Car_Hatchback_Sport_Red", // Hatchback (Sport)
                "Exile_Car_Hatchback_Sport_Blue", // Hatchback (Sport)
                "Exile_Car_Hatchback_Sport_Orange", // Hatchback (Sport)
                "Exile_Car_Hatchback_Sport_White", // Hatchback (Sport)
                "Exile_Car_Hatchback_Sport_Beige", // Hatchback (Sport)
                "Exile_Car_Hatchback_Sport_Green", // Hatchback (Sport)
                "Exile_Car_Hatchback_Sport_Admin", // Hatchback (Sport)
                "Exile_Car_HEMMT", // HEMMT (Transport)
                "Exile_Car_HMMWV_M134_Green", // HMMWV (M134)
                "Exile_Car_HMMWV_M134_Desert", // HMMWV (M134)
                "Exile_Car_HMMWV_M2_Green", // HMMWV (M2)
                "Exile_Car_HMMWV_M2_Desert", // HMMWV (M2)
                "Exile_Car_HMMWV_MEV_Green", // HMMWV (MEV)
                "Exile_Car_HMMWV_MEV_Desert", // HMMWV (MEV)
                "Exile_Car_HMMWV_UNA_Green", // HMMWV (Unarmed)
                "Exile_Car_HMMWV_UNA_Desert", // HMMWV (Unarmed)
                "Exile_Car_Hunter", // Hunter
                "Exile_Car_Ifrit", // Ifrit
                "Exile_Car_Ikarus_Blue", // Ikarus
                "Exile_Car_Ikarus_Red", // Ikarus
                "Exile_Car_Ikarus_Party", // Ikarus
                "Exile_Car_Kart_BluKing", // Kart
                "Exile_Car_Kart_RedStone", // Kart
                "Exile_Car_Kart_Vrana", // Kart
                "Exile_Car_Kart_Green", // Kart
                "Exile_Car_Kart_Blue", // Kart
                "Exile_Car_Kart_Orange", // Kart
                "Exile_Car_Kart_White", // Kart
                "Exile_Car_Kart_Yellow", // Kart
                "Exile_Car_Kart_Black", // Kart
                "Exile_Car_Lada_Green", // Lada
                "Exile_Car_Lada_Taxi", // Lada
                "Exile_Car_Lada_Red", // Lada
                "Exile_Car_Lada_White", // Lada
                "Exile_Car_Lada_Hipster", // Lada
                "Exile_Car_LandRover_Red", // Land Rover
                "Exile_Car_LandRover_Urban", // Land Rover
                "Exile_Car_LandRover_Green", // Land Rover
                "Exile_Car_LandRover_Sand", // Land Rover
                "Exile_Car_LandRover_Desert", // Land Rover
                "Exile_Car_LandRover_Ambulance_Green", // Land Rover (Ambulance)
                "Exile_Car_LandRover_Ambulance_Desert", // Land Rover (Ambulance)
                "Exile_Car_LandRover_Ambulance_Sand", // Land Rover (Ambulance)
                "Exile_Car_MB4WD", // MB 4WD
                "Exile_Car_MB4WDOpen", // MB 4WD (Open)
                "Exile_Car_Octavius_White", // Octavius
                "Exile_Car_Octavius_Black", // Octavius
                "Exile_Car_OldTractor_Red", // Old Tractor
                "Exile_Car_ProwlerLight", // Prowler (Light)
                "Exile_Car_ProwlerUnarmed", // Prowler (Unarmed)
                "Exile_Car_QilinUnarmed", // Qilin (Unarmed)
                "Exile_Car_Strider", // Strider
                "Exile_Car_SUV_Red", // SUV
                "Exile_Car_SUV_Black", // SUV
                "Exile_Car_SUV_Grey", // SUV
                "Exile_Car_SUV_Orange", // SUV
                "Exile_Car_SUV_Rusty1", // SUV
                "Exile_Car_SUV_Rusty2", // SUV
                "Exile_Car_SUV_Rusty3", // SUV
                "Exile_Car_SUVXL_Black", // SUV (Classic)
                "Exile_Car_SUV_Armed_Black", // SUV (Armed)
                "Exile_Car_Tempest", // Tempest (Transport)
                "Exile_Car_TowTractor_White", // Tow Tractor
                "Exile_Car_Tractor_Red", // Tractor
                "Exile_Car_UAZ_Green", // UAZ
                "Exile_Car_UAZ_Open_Green", // UAZ (Open)
                "Exile_Car_Volha_Blue", // Volha
                "Exile_Car_Volha_White", // Volha
                "Exile_Car_Volha_Black", // Volha
                "Exile_Bike_QuadBike_Black", // Quad Bike
                "Exile_Bike_QuadBike_Blue", // Quad Bike
                "Exile_Bike_QuadBike_Red", // Quad Bike
                "Exile_Bike_QuadBike_White", // Quad Bike
                "Exile_Bike_QuadBike_Nato", // Quad Bike
                "Exile_Bike_QuadBike_Csat", // Quad Bike
                "Exile_Bike_QuadBike_Fia", // Quad Bike
                "Exile_Bike_QuadBike_Guerilla01", // Quad Bike
                "Exile_Bike_QuadBike_Guerilla02" // Quad Bike
            };
        };

        class Trucks
        {
            name = "Trucks";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Car_Offroad_Red", // Offroad
                "Exile_Car_Offroad_Beige", // Offroad
                "Exile_Car_Offroad_White", // Offroad
                "Exile_Car_Offroad_Blue", // Offroad
                "Exile_Car_Offroad_DarkRed", // Offroad
                "Exile_Car_Offroad_BlueCustom", // Offroad
                "Exile_Car_Offroad_Guerilla01", // Offroad
                "Exile_Car_Offroad_Guerilla02", // Offroad
                "Exile_Car_Offroad_Guerilla03", // Offroad
                "Exile_Car_Offroad_Guerilla04", // Offroad
                "Exile_Car_Offroad_Guerilla05", // Offroad
                "Exile_Car_Offroad_Guerilla06", // Offroad
                "Exile_Car_Offroad_Guerilla07", // Offroad
                "Exile_Car_Offroad_Guerilla08", // Offroad
                "Exile_Car_Offroad_Guerilla09", // Offroad
                "Exile_Car_Offroad_Guerilla10", // Offroad
                "Exile_Car_Offroad_Guerilla11", // Offroad
                "Exile_Car_Offroad_Guerilla12", // Offroad
                "Exile_Car_Offroad_Rusty1", // Offroad
                "Exile_Car_Offroad_Rusty2", // Offroad
                "Exile_Car_Offroad_Rusty3", // Offroad
                "Exile_Car_Offroad_Armed_Guerilla01", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla02", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla03", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla04", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla05", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla06", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla07", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla08", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla09", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla10", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla11", // Offroad (Armed)
                "Exile_Car_Offroad_Armed_Guerilla12", // Offroad (Armed)
                "Exile_Car_Offroad_Repair_Civillian", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Red", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Beige", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_White", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Blue", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_DarkRed", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_BlueCustom", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla01", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla02", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla03", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla04", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla05", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla06", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla07", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla08", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla09", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla10", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla11", // Offroad (Repair)
                "Exile_Car_Offroad_Repair_Guerilla12", // Offroad (Repair)
                "Exile_Car_Ural_Covered_Blue", // Ural (Covered)
                "Exile_Car_Ural_Covered_Yellow", // Ural (Covered)
                "Exile_Car_Ural_Covered_Worker", // Ural (Covered)
                "Exile_Car_Ural_Covered_Military", // Ural (Covered)
                "Exile_Car_Ural_Open_Blue", // Ural (Open)
                "Exile_Car_Ural_Open_Yellow", // Ural (Open)
                "Exile_Car_Ural_Open_Worker", // Ural (Open)
                "Exile_Car_Ural_Open_Military", // Ural (Open)
                "Exile_Car_V3S_Covered", // V3S (Covered)
                "Exile_Car_V3S_Open", // V3S (Open)
                "Exile_Car_Zamak", // Zamak (Transport)
                "Exile_Car_Van_Black", // Van
                "Exile_Car_Van_White", // Van
                "Exile_Car_Van_Red", // Van
                "Exile_Car_Van_Guerilla01", // Van
                "Exile_Car_Van_Guerilla02", // Van
                "Exile_Car_Van_Guerilla03", // Van
                "Exile_Car_Van_Guerilla04", // Van
                "Exile_Car_Van_Guerilla05", // Van
                "Exile_Car_Van_Guerilla06", // Van
                "Exile_Car_Van_Guerilla07", // Van
                "Exile_Car_Van_Guerilla08", // Van
                "Exile_Car_Van_Box_Black", // Van (Box)
                "Exile_Car_Van_Box_White", // Van (Box)
                "Exile_Car_Van_Box_Red", // Van (Box)
                "Exile_Car_Van_Box_Guerilla01", // Van (Box)
                "Exile_Car_Van_Box_Guerilla02", // Van (Box)
                "Exile_Car_Van_Box_Guerilla03", // Van (Box)
                "Exile_Car_Van_Box_Guerilla04", // Van (Box)
                "Exile_Car_Van_Box_Guerilla05", // Van (Box)
                "Exile_Car_Van_Box_Guerilla06", // Van (Box)
                "Exile_Car_Van_Box_Guerilla07", // Van (Box)
                "Exile_Car_Van_Box_Guerilla08", // Van (Box)
                "Exile_Car_Van_Fuel_Black", // Van (Fuel)
                "Exile_Car_Van_Fuel_White", // Van (Fuel)
                "Exile_Car_Van_Fuel_Red", // Van (Fuel)
                "Exile_Car_Van_Fuel_Guerilla01", // Van (Fuel)
                "Exile_Car_Van_Fuel_Guerilla02", // Van (Fuel)
                "Exile_Car_Van_Fuel_Guerilla03" // Van (Fuel)
            };
        };

        class Choppers
        {
            name = "Helicopters";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Chopper_Hellcat_Green", // WY-55 Hellcat
                "Exile_Chopper_Hellcat_FIA", // WY-55 Hellcat
                "Exile_Chopper_Huey_Green", // UH-1H Huey
                "Exile_Chopper_Huey_Desert", // UH-1H Huey
                "Exile_Chopper_Huey_Armed_Green", // UH-1H Huey (Armed)
                "Exile_Chopper_Huey_Armed_Desert", // UH-1H Huey (Armed)
                "Exile_Chopper_Hummingbird_Green", // MH-9 Hummingbird
                "Exile_Chopper_Hummingbird_Civillian_Blue", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Red", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_ION", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_BlueLine", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Digital", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Elliptical", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Furious", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_GrayWatcher", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Jeans", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Light", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Shadow", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Sheriff", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Speedy", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Sunset", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Vrana", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Wasp", // M-900 (Civillian)
                "Exile_Chopper_Hummingbird_Civillian_Wave", // M-900 (Civillian)
                "Exile_Chopper_Huron_Black", // CH-67 Huron
                "Exile_Chopper_Huron_Green", // CH-67 Huron
                "Exile_Chopper_Mohawk_FIA", // CH-49 Mohawk
                "Exile_Chopper_Orca_CSAT", // PO-30 Orca
                "Exile_Chopper_Orca_Black", // PO-30 Orca
                "Exile_Chopper_Orca_BlackCustom", // PO-30 Orca
                "Exile_Chopper_Taru_CSAT", // MI-280 Taru
                "Exile_Chopper_Taru_Black", // MI-280 Taru
                "Exile_Chopper_Taru_Covered_CSAT", // MI-280 Taru (Covered)
                "Exile_Chopper_Taru_Covered_Black", // MI-280 Taru (Covered)
                "Exile_Chopper_Taru_Transport_CSAT", // MI-280 Taru (Transport)
                "Exile_Chopper_Taru_Transport_Black" // MI-280 Taru (Transport)
            };
        };

        class Boats
        {
            name = "Boats";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Boat_MotorBoat_Police", // Motor Boat (Police)
                "Exile_Boat_MotorBoat_Orange", // Motor Boat (Orange)
                "Exile_Boat_MotorBoat_White", // Motor Boat (White)
                "Exile_Boat_RHIB", // RHIB
                "Exile_Boat_RubberDuck_CSAT", // Rubber Duck (CSAT)
                "Exile_Boat_RubberDuck_Digital", // Rubber Duck (Digital)
                "Exile_Boat_RubberDuck_Orange", // Rubber Duck (Orange)
                "Exile_Boat_RubberDuck_Blue", // Rubber Duck (Blue)
                "Exile_Boat_RubberDuck_Black", // Rubber Duck (Black)
                "Exile_Boat_SDV_CSAT", // SDV (CSAT)
                "Exile_Boat_SDV_Digital", // SDV (Digital)
                "Exile_Boat_SDV_Grey", // SDV (Grey)
                "Exile_Boat_WaterScooter" // Water Scooter
            };
        };

        class Planes
        {
            name = "Planes";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "Exile_Plane_AN2_Green", // An-2
                "Exile_Plane_AN2_White", // An-2
                "Exile_Plane_AN2_Stripe", // An-2
                "Exile_Plane_BlackfishInfantry", // V-44 X Blackfish (Infantry Transport)
                "Exile_Plane_BlackfishVehicle", // V-44 X Blackfish (Vehicle Transport)
                "Exile_Plane_Ceasar", // Ceasar BTT
                "Exile_Plane_Cessna" // Cessna 185 Skywagon
            };
        };

        class Diving
        {
            name = "Diving";
            icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
            items[] =
            {
                "G_B_Diving",
                "G_O_Diving",
                "G_I_Diving",
                "V_RebreatherB",
                "V_RebreatherIA",
                "V_RebreatherIR",
                "U_I_Wetsuit",
                "U_O_Wetsuit",
                "U_B_Wetsuit"
            };
        };

    };
};
