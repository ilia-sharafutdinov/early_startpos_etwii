local advice = require "export_advice"
local historic_events = require "export_historic_events"
local scripting = require "EpisodicScripting"
local camera_pan = 0

local function OnFactionTurnStart(context)
	--if hasRegionBuilding("army_encampment") then
		--scripting.game_interface:add_restricted_building_level_record("army_encampment")
	--end
	
	--scripting.game_interface:show_shroud(false)  
	if conditions.TurnNumber(context) == 1 then
		if conditions.FactionName("cherokee", context) and conditions.FactionIsHuman("cherokee", context) then
			scripting.game_interface:trigger_custom_mission("britain_protectorate", "cherokee", "capture_city", 0, "Acadia", "", "main_mission_capture_city_text", "main_protectorate_new_spain_reward", 2000, "", context)
		end
	elseif conditions.TurnNumber(context) == 2 then
		--if conditions.FactionName("britain", context) and conditions.FactionIsHuman("britain", context) then
			--scripting.game_interface:trigger_custom_mission("britain_protectorate", "britain", "protectorate_region_capture", 0, "georgia_usa+cherokee_territory+new_france", "", "mission_text_text_main_protectorate_thirteen_colonies_text", "mission_text_text_main_protectorate_thirteen_colonies_reward", 0, "thirteen_colonies", context)
		--elseif conditions.FactionName("spain", context) and conditions.FactionIsHuman("spain", context) then
			--scripting.game_interface:trigger_custom_mission("spain_protectorate", "spain", "protectorate_region_capture", 0, "trinidad_tobago+tejas+curacao", "", "mission_text_text_main_protectorate_new_spain_text", "mission_text_text_main_protectorate_new_spain_reward", 0, "new_spain", context)
		--elseif conditions.FactionName("france", context) and conditions.FactionIsHuman("france", context) then
			--scripting.game_interface:trigger_custom_mission("france_protectorate", "france", "protectorate_region_capture", 0, "michigan_territory+algonquin_territory+cherokee_territory", "", "mission_text_text_main_protectorate_louisiana_text", "mission_text_text_main_protectorate_louisiana_reward", 0, "louisiana", context)
		--end
	elseif conditions.TurnNumber(context) == 5 then
		scripting.game_interface:enable_auto_generated_missions(true)
	end
	
	if conditions.FactionName("thirteen_colonies", context) and not conditions.FactionIsHuman("thirteen_colonies", context) then
		scripting.game_interface:grant_faction_handover("britain", "thirteen_colonies", 0, 0, context)
	elseif conditions.FactionName("new_spain", context)  and not conditions.FactionIsHuman("new_spain", context) then
		scripting.game_interface:grant_faction_handover("spain", "new_spain", 0, 0, context)
	elseif conditions.FactionName("louisiana", context) and not conditions.FactionIsHuman("louisiana", context) then
		scripting.game_interface:grant_faction_handover("france", "louisiana", 0, 0, context)
	end
	
	if conditions.FactionName("scotland", context) and not conditions.FactionIsHuman("scotland", context) then
		scripting.game_interface:grant_faction_handover("britain", "scotland", 0, 0, context)
	end
	
end

local function OnAdviceIssued(context)
		-- 0013_Battle_Advice_Missile_Superiority_Thread
	if conditions.AdviceJustDisplayed("-1875830202", context) then
		scripting.HighlightComponent("button_melee", true)

	-- 0065_Battle_Advice_Outnumbered_By_The_Enemy_Thread
	elseif conditions.AdviceJustDisplayed("-758254518", context) then
		scripting.HighlightComponent("button_withdraw", true)

	-- 0077_Battle_Advice_Fire_At_Will_Button_Thread 
	elseif conditions.AdviceJustDisplayed("737354545", context) then
		scripting.HighlightComponent("button_fire_at_will", true)

  	--0079_Battle_Advice_Group_Formations_Button_Thread 
	elseif conditions.AdviceJustDisplayed("2029281479", context) then
		scripting.HighlightComponent("button_groupforms", true)

	--0080_Battle_Advice_Withdraw_Button_Thread 
	elseif conditions.AdviceJustDisplayed("1621609724", context) then
		scripting.HighlightComponent("button_withdraw", true)

	--0081_Battle_Advice_Cancel_Order_Button_Thread 
	elseif conditions.AdviceJustDisplayed("313094221", context) then
		scripting.HighlightComponent("button_halt", true)

	--0082_Battle_Advice_Group_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-722605174", context) then
		scripting.HighlightComponent("button_group", true)

	--0083_Battle_Advice_Group_Formations_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-537894077", context) then
		scripting.HighlightComponent("button_groupforms", true)

	--0100_Battle_Advice_Radar_Map_Thread
 	elseif conditions.AdviceJustDisplayed("-1755835367", context) then
		scripting.HighlightComponent("radar", true)

	--0103_Battle_Advice_Melee_Button_Thread
 	elseif conditions.AdviceJustDisplayed("1424352004", context) then
		scripting.HighlightComponent("button_melee", true)

	--0104_Battle_Advice_Run_Button_Thread
 	elseif conditions.AdviceJustDisplayed("593395637", context) then
		scripting.HighlightComponent("button_movespeed", true)

	--0106_Battle_Advice_Killometer_Thread
 	elseif conditions.AdviceJustDisplayed("-729505557", context) then
		scripting.HighlightComponent("killometer_clip", true)

	--0107_Battle_Advice_Bombardment_Thread
 	elseif conditions.AdviceJustDisplayed("1738763088", context) then
		scripting.HighlightComponent("button_halt", true)
	
	--0144_Battle_Advice_Defending_Forts_Thread
 	elseif conditions.AdviceJustDisplayed("-2693399", context) then
		scripting.HighlightComponent("button_fire_at_will", true)
		
	--0150_Battle_Advice_Target_Their_Weaknesses_Thread
 	elseif conditions.AdviceJustDisplayed("1169098043", context) then
		scripting.HighlightComponent("nav_button_broadside_L", true)	
		
	--0157_Battle_Advice_Ship_Ablaze_Thread
 	elseif conditions.AdviceJustDisplayed("1950152570", context) then
		scripting.HighlightComponent("button_fire_at_will", true)

	--0175_Battle_Advice_Wind_Direction_Thread
 	elseif conditions.AdviceJustDisplayed("-608013080", context) then
		scripting.HighlightComponent("radar", true)

	--0181_Battle_Advice_Outgunned_Avoidance_Thread
 	elseif conditions.AdviceJustDisplayed("-1459886398", context) then
		scripting.HighlightComponent("nav_button_shot_chain", true)

	--0182_Battle_Advice_Crossing_The_T_Thread
 	elseif conditions.AdviceJustDisplayed("1813634075", context) then
		scripting.HighlightComponent("nav_button_broadside_L", true)
	
	--0185_Battle_Advice_Naval_Round_Shot_Thread
 	elseif conditions.AdviceJustDisplayed("-111077650", context) then
		scripting.HighlightComponent("nav_button_shot_standard", true)	

	--0186_Battle_Advice_Naval_Grape_Shot_Thread
 	elseif conditions.AdviceJustDisplayed("-1507140649", context) then
		scripting.HighlightComponent("nav_button_shot_grape", true)	


	--0187_Battle_Advice_Naval_Chain_Shot_Thread
 	elseif conditions.AdviceJustDisplayed("-1177825588", context) then
		scripting.HighlightComponent("nav_button_shot_chain", true)

	--0188_Battle_Advice_Naval_Radar_Map_Thread
 	elseif conditions.AdviceJustDisplayed("2073993693", context) then
		scripting.HighlightComponent("radar", true)

	--0189_Battle_Advice_Naval_Manoeuvre_Compass_Thread
 	elseif conditions.AdviceJustDisplayed("646906330", context) then
		scripting.HighlightComponent("nav_UC_button_turn_left", true)	
	
	--0190_Battle_Advice_Left_Broadside_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-145936557", context) then
		scripting.HighlightComponent("nav_button_broadside_L", true)

	--0191_Battle_Advice_Right_Broadside_Button_Thread
 	elseif conditions.AdviceJustDisplayed("1188422552", context) then
		scripting.HighlightComponent("nav_button_broadside_R", true)

	--0192_Battle_Advice_Naval_Group_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-1944874567", context) then
		scripting.HighlightComponent("button_group", true)

	--0195_Battle_Advice_Naval_Withdraw_Button_Thread
 	elseif conditions.AdviceJustDisplayed("-783991516", context) then
		scripting.HighlightComponent("button_withdraw", true)

	--0196_Battle_Advice_Naval_Fire_At_Will_Thread
 	elseif conditions.AdviceJustDisplayed("-1827006635", context) then
		scripting.HighlightComponent("button_fire_at_will", true)

	--0197_Battle_Advice_Naval_Boarding_Button_Thread
 	elseif conditions.AdviceJustDisplayed("952924146", context) then
		scripting.HighlightComponent("nav_button_board", true)

	--0198_Battle_Advice_Naval_Formations_Button_Thread
 	elseif conditions.AdviceJustDisplayed("1916043659", context) then
		scripting.HighlightComponent("nav_button_groupforms", true)

	--1029_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-891171119", context) then
		scripting.HighlightComponent("button_public-order lowest", true)

	--1041_Campaign_Advice_UI_Incoming_Message_Thread
 	elseif conditions.AdviceJustDisplayed("1216388585", context) then
		scripting.HighlightComponent("Icon", true)

	--1051_Campaign_Advice_Army_Promotions_Thread
 	elseif conditions.AdviceJustDisplayed("-1061827595", context) then
		scripting.HighlightComponent("army_promote", true)

	--1052_Campaign_Advice_Navy_Promotions_Thread
 	elseif conditions.AdviceJustDisplayed("695400466", context) then
		scripting.HighlightComponent("navy_promote", true)

	--1064_Campaign_Advice_Slot_Selected_Thread
 	elseif conditions.AdviceJustDisplayed("1326115363", context) then
		scripting.HighlightComponent("army_fort", true)

	--1065_Campaign_Advice_Character_Selected_Thread
 	elseif conditions.AdviceJustDisplayed("659772888", context) then
		scripting.HighlightComponent("recruitment_tab", true)

	--1065_Campaign_Advice_Character_Selected_Thread
 	elseif conditions.AdviceJustDisplayed("1372607332", context) then
		scripting.HighlightComponent("army_replenish", true)

	--1100_Campaign_Advice_Government_Type_Thread
 	elseif conditions.AdviceJustDisplayed("-1671835166", context) then
		scripting.HighlightComponent("button_government", true)

	--1110_Campaign_Advice_Trade_Routes_Thread
 	elseif conditions.AdviceJustDisplayed("1242837398", context) then
		scripting.HighlightComponent("button_diplomacy", true)

	--1115_Campaign_Advice_Victory_Conditions_Thread
 	elseif conditions.AdviceJustDisplayed("1049050650", context) then
		scripting.HighlightComponent("button_missions", true)

	--1116_Campaign_Advice_Prestige_Thread
 	elseif conditions.AdviceJustDisplayed("-956562909", context) then
		scripting.HighlightComponent("button_missions", true)

	--1124_Campaign_Advice_Warning_Bankrupt_Thread
 	elseif conditions.AdviceJustDisplayed("295527590", context) then
		scripting.HighlightComponent("button_diplomacy", true)

	--1127_Campaign_Advice_Warning_Trade_Thread
 	elseif conditions.AdviceJustDisplayed("1264671506", context) then
		scripting.HighlightComponent("button_diplomacy", true)

	--1136_Campaign_Advice_Religious_Unrest_Thread
 	elseif conditions.AdviceJustDisplayed("1219045742", context) then
		scripting.HighlightComponent("button_tech", true)

	--1138_Campaign_Advice_Warning_Population_Thread
 	elseif conditions.AdviceJustDisplayed("-1395907252", context) then
		scripting.HighlightComponent("button_tech", true)

	--1202_Campaign_Advice_UI_Help_Buildings_Thread
 	elseif conditions.AdviceJustDisplayed("-174893187", context) then
		scripting.HighlightComponent("build_browser", true)

	--1030b_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-428335498", context) then
		scripting.HighlightComponent("button_government", true)

	--1030c_Campaign_Advice_UI_Government_Panel_Thread
 	elseif conditions.AdviceJustDisplayed("-250658412", context) then
		scripting.HighlightComponent("button_government", true)


--1001_Campaign_Advice_Britain_Initial_Turns_Thread
--Britain camera pans = 11, 12, 13, 14, 15
	
	elseif conditions.AdviceJustDisplayed("-324484024", context) and not CampaignUI.IsMultiplayer() then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(18,	{-57.000, 418.000, 0.75},
								{-29.000, 362.000, 0.95},
								{36.000, 371.000, 0.95},
								{98.000, 378.000, 0.85})
		camera_pan = 11


--1002_Campaign_Advice_France_Initial_Turns_Thread
--France camera pans = 21, 22, 23, 24
	
	elseif conditions.AdviceJustDisplayed("-1886952522", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(49,	{0.000, 332.000, 0.95},
								{43.000, 336.000, 0.85},
								{70.000, 332.000, 0.95},
								{98.000, 363.000, 0.95},
								{47.000, 367.000, 0.85},
								{70.000, 329.000, 0.85},
								{17.000, 332.000, 0.75})
		camera_pan = 21


--1003_Campaign_Advice_Spain_Initial_Turns_Thread
--Spain camera pans = 31, 32, 33
	elseif conditions.AdviceJustDisplayed("-1109259521", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(17,	{-37.000, 274.000, 0.75},
								{-3.000, 295.000, 0.80},
								{95.000, 276.000, 0.85},
								{157.000, 287.000, 0.75})
								--{218.000, 247.000, 0.75})
		camera_pan = 31
		
		
--1005_Campaign_Advice_Russia_Initial_Turns_Thread
--Russia camera pans = 41, 42
	
	elseif conditions.AdviceJustDisplayed("-1808331232", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(21,	{279.000, 386.000, 0.80},
								{221.000, 387.000, 0.75},
								{219.00, 326.000, 0.65},
								{147.000, 287.000, 0.75})
		camera_pan = 41
	
	
--1006_Campaign_Advice_Prussia_Initial_Turns_Thread
--Prussia camera pans = 51, 52
	
	elseif conditions.AdviceJustDisplayed("962797902", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(25,	{104.000, 366.000, 0.90},
								{91.000, 370.000, 0.95},
								{82.000, 366.000, 0.95},
								{106.00, 352.000, 0.90},
								{120.000, 359.000, 0.95},
								{137.000, 384.000, 0.95})
							
		camera_pan = 51
	
	
--1008_Campaign_Advice_Dutch_Initial_Turns_Thread
--Dutch camera pans = 61, 62, 63, 64
	
	elseif conditions.AdviceJustDisplayed("-1766231494", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(18,	{35.000, 372.000, 1.00},
								{40.000, 354.000, 0.95},
								{29.00, 352.000, 0.90},
								{22.000, 365.000, 0.95},
								{35.000, 371.000, 1.00})
		camera_pan = 61


--1009_Campaign_Advice_Austria_Initial_Turns_Thread
--Austria camera pans = 71, 72, 73
	
	elseif conditions.AdviceJustDisplayed("-1522516535", context) and not CampaignUI.IsMultiplayer() then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(27,	{116.000, 339.000, 1.00},
								{160.000, 310.000, 0.95},
								{115.00, 322.000, 0.95},
								{132.000, 351.000, 0.95},
								{116.000, 339.000, 0.80})
		camera_pan = 71
	
	
	
--1012_Campaign_Advice_Poland_Initial_Turns_Thread
--Poland camera pans = 81, 82, 83, 84
	
	elseif conditions.AdviceJustDisplayed("665527234", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(11,	{181.000, 352.000, 0.90},
								{131.000, 348.000, 0.85},
								{129.000, 375.000, 0.90})

								
		camera_pan = 81	
	

--1004_Campaign_Advice_Ottoman_Initial_Turns_Thread
--Ottoman camera pans = 91, 92, 93, 94

	elseif conditions.AdviceJustDisplayed("1447626053", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(21,	{171.000, 291.000, 0.75},
								{145.000, 335.000, 0.80},
								{223.000, 309.000, 0.85},
								{125.000, 306.000, 0.80})
								
		camera_pan = 91	


--1007_Campaign_Advice_Sweden_Initial_Turns_Thread
--Sweden camera pans = 101, 102
	
		elseif conditions.AdviceJustDisplayed("-1638244308", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(39,	{110.000, 418.000, 0.75},
								{201.000, 418.000, 0.75},
								{125.000, 388.000, 0.75},
								{21.000, 365.000, 0.75},
								{62.000, 310.000, 0.75},
								{172.000, 283.000, 0.75})
		
		camera_pan = 101	


--1010a_Campaign_Advice_Maratha_Initial_Turns_Thread
--Maratha camera pans = 111, 112

		elseif conditions.AdviceJustDisplayed("1221146494", context) and not CampaignUI.IsMultiplayer()  then
		scripting.game_interface:set_zoom_limit(1.08, 0.02)
		CampaignUI.ScrollCamera(24,	{527.000, 122.000, 0.95},
								{549.000, 94.000, 0.85},
								{543.000, 181.000, 0.95})
								
		camera_pan = 111	

	
	end
end


local function OnCameraMoverFinished(context)

--1001_Campaign_Advice_Britain_Initial_Turns_Thread

	if camera_pan == 11 then
		CampaignUI.ScrollCamera(11,	{49.000, 332.000, 0.95},
								{8.000, 324.000, 0.95},
								{-31.000, 282.000, 0.85})
		camera_pan = 12
		
	elseif camera_pan == 12 then
		CampaignUI.ScrollCamera(15,	{-515.000, 121.000, 0.85},
								{-580.000, 204.000, 0.75},
								{-548.000, 274.000, 0.75},
								{-504.000, 311.000, 0.75})
		camera_pan = 13
	
	elseif camera_pan == 13 then
		CampaignUI.ScrollCamera(29,	{523.000, 55.000, 0.65},
								{599.000, 135.000, 0.75},
								{554.000, 186.000, 0.85},
								{504.000, 163.000, 0.85},
								{528.000, 114.000, 0.85},
								{563.000, 80.000, 0.75},
								{532.000, 167.000, 0.65})
		camera_pan = 14
		
	elseif camera_pan == 14 then
		CampaignUI.ScrollCamera(8,	{18.000, 342.000, 0.95},
								{6.000, 356.000, 0.95},
								{0.000, 362.000, 0.75})
		camera_pan = 15
		
	elseif camera_pan == 15 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(0.000, 362.000)
		camera_pan = 0


--1002_Campaign_Advice_France_Initial_Turns_Thread

	elseif camera_pan == 21 then
		CampaignUI.ScrollCamera(18,	{-454.000, 349.000, 0.75},
								{-514.000, 325.000, 0.80},
								{-579.000, 249.000, 0.80},
								{-586.000, 179.000, 0.75})
		camera_pan = 22
		
	elseif camera_pan == 22 then
		CampaignUI.ScrollCamera(18,	{490.000, 169.000, 0.75},
								{577.000, 72.000, 0.80},
								{534.000, 35.000, 0.75},								
								{528.000, 113.000, 0.75})
		camera_pan = 23

	elseif camera_pan == 23 then
		CampaignUI.ScrollCamera(20,	{-391.000, 177.000, 0.95},
								{-432.000, 167.000, 0.95},
								{-453.000, 126.000, 0.95},
								{-434.000, 96.000, 0.95},
								{-467.000, 83.000, 0.90},
								{-486.000, 108.000, 0.85},
								{-519.000, 137.000, 0.80},
								{-581.000, 165.000, 0.75})
		camera_pan = 24
		
	elseif camera_pan == 24 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(17.387, 332.769)
		camera_pan = 0


--1003_Campaign_Advice_Spain_Initial_Turns_Thread

	elseif camera_pan == 31 then
		CampaignUI.ScrollCamera(18,	{30.000, 375.000, 0.95},
								{39.000, 353.000, 0.90},
								{0.000, 349.000, 0.85})
		camera_pan = 32

	elseif camera_pan == 32 then
		CampaignUI.ScrollCamera(27,	{-492.000, 194.000, 0.95},
								{-562.000, 168.000, 0.80},
								{-500.000, 84.000, 0.70},
								{-541.000, 161.000, 0.50})
		camera_pan = 33

	elseif camera_pan == 33 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(-26.750, 280.811)
		camera_pan = 0


--1005_Campaign_Advice_Russia_Initial_Turns_Thread
	
		elseif camera_pan == 41 then
		CampaignUI.ScrollCamera(34,	{147.000, 376.000, 0.90},
								{116.000, 338.000, 0.80},
								{73.000, 322.000, 0.75},
								{48.000,328.000, 0.75},
								{8.000, 351.000, 0.75},
								{42.000, 386.000, 0.75},
								{93.000, 368.000, 0.80},
								{150.000, 360.000, 0.90},
								{190.000, 418.000, 0.60})
		camera_pan = 42
	
	elseif camera_pan == 42 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(267.000, 391.000)
		camera_pan = 0
	
--1006_Campaign_Advice_Prussia_Initial_Turns_Thread

		camera_pan = 51

		elseif camera_pan == 51 then
		CampaignUI.ScrollCamera(23,	{140.000, 437.000, 0.75},
								{64.000, 397.000, 0.75},
								{22.000, 347.000, 0.85},
								{100.000, 335.000, 0.95},
								{95.000, 368.000, 0.80})
		camera_pan = 52

	elseif camera_pan == 52 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(95.000, 368.000)
		camera_pan = 0
	
--1008_Campaign_Advice_Dutch_Initial_Turns_Thread

	elseif camera_pan == 61 then
		CampaignUI.ScrollCamera(14,	{-35.000, 431.000, 0.95},
								{5.000, 352.000, 0.85},
								{95.000, 369.000, 0.95})
		camera_pan = 62
		
	elseif camera_pan == 62 then
		CampaignUI.ScrollCamera(8,	{-489.000, 85.000, 0.95},
								{-490.000, 81.000, 0.80})
		camera_pan = 63
		
	elseif camera_pan == 63 then
		CampaignUI.ScrollCamera(8,	{851.000, -62.000, 0.95},
								{878.000, -69.000, 0.95})
		camera_pan = 64
		
	elseif camera_pan == 64 then
		CampaignUI.ScrollCamera(8,	{562.000, 58.000, 0.75},
								{570.000, 56.000, 0.90})
		camera_pan = 65
		
	elseif camera_pan == 65 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(35.000, 371.000)
		camera_pan = 0
		

--1009_Campaign_Advice_Austria_Initial_Turns_Thread

	elseif camera_pan == 71 then
		CampaignUI.ScrollCamera(22,	{31.000, 377.000, 0.80},
								{68.000, 361.000, 0.90},
								{106.000, 368.000, 0.95},
								{135.000, 329.000, 0.80})
		camera_pan = 72
		
	elseif camera_pan == 72 then
		CampaignUI.ScrollCamera(24,	{204.000, 428.000, 0.80},
								{128.000, 365.000, 0.90},
								{172.000, 356.000, 0.90},
								{255.000, 380.000, 0.75})
		camera_pan = 73
		
	elseif camera_pan == 73 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(116.000, 339.000)
		camera_pan = 0
	
	
--1012_Campaign_Advice_Poland_Initial_Turns_Thread
							
	elseif camera_pan == 81 then
		CampaignUI.ScrollCamera(29,	{191.000, 413.000, 0.75},
								{220.000, 368.000, 0.75},
								{139.000, 324.000, 0.85},
								{144.000, 341.000, 0.85},
								{195.000, 379.000, 0.90})
		camera_pan = 82
		
	elseif camera_pan == 82 then
		CampaignUI.ScrollCamera(23,	{202.000, 290.000, 0.90},
								{182.000, 280.000, 0.90},
								{153.000, 329.000, 0.85},
								{284.000, 297.000, 0.75})
		camera_pan = 83
		
	elseif camera_pan == 83 then
		CampaignUI.ScrollCamera(13,	{-42.000, 278.000, 0.80},
								{8.000, 352.000, 0.75})
		camera_pan = 84
		
	elseif camera_pan == 84 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(150.000, 367.000)
		camera_pan = 0
		

--1004_Campaign_Advice_Ottoman_Initial_Turns_Thread

	elseif camera_pan == 91 then
		CampaignUI.ScrollCamera(14,	{370.000, 231.000, 0.90},
								{315.000, 231.000, 0.90},
								{315.000, 282.000, 0.95})
		camera_pan = 92

	elseif camera_pan == 92 then
		CampaignUI.ScrollCamera(17,	{104.000, 346.000, 0.90},
								{173.000, 275.000, 0.90},
								{230.000, 270.000, 0.95})
		camera_pan = 93

	elseif camera_pan == 93 then
		CampaignUI.ScrollCamera(27,	{-15.000, 322.000, 0.85},
								{184.000, 307.000, 0.80},
								{68.000, 246.000, 0.75})
		camera_pan = 94

	elseif camera_pan == 94 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(202.000, 290.000)
		camera_pan = 0
		

--1007_Campaign_Advice_Sweden_Initial_Turns_Thread

	elseif camera_pan == 101 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(125.000, 417.000)
		camera_pan = 0
		

--1010a_Campaign_Advice_Maratha_Initial_Turns_Thread

	elseif camera_pan == 111 then
		CampaignUI.ScrollCamera(22,	{587.000, 112.000, 0.95},
								{553.000, 134.000, 0.95},
								{525.000, 96.000, 0.85},
								{547.000, 69.000, 0.85},
								{571.000, 53.000, 0.85})
		camera_pan = 112

	elseif camera_pan == 112 then
		CampaignUI.ScrollCamera(7,	{-3.000, 368.000, 0.90},
								{21.000, 340.000, 0.90})
		camera_pan = 113
	
	elseif camera_pan == 113 then
		CampaignUI.ScrollCamera(14,	{582.000, 37.000, 0.85},
								{527.000, 122.000, 0.75})
		camera_pan = 114
							
	elseif camera_pan == 114 then
		scripting.game_interface:set_zoom_limit(1.0, 0.5)
		CampaignUI.SetCameraTarget(527.000, 122.000)
		camera_pan = 0
		
	
	end
end




local function OnAdviceDismissed(context)
	if conditions.AdviceJustDisplayed("-1875830202", context) then
		scripting.HighlightComponent("button_melee", false)

	elseif conditions.AdviceJustDisplayed("-758254518", context) then
		scripting.HighlightComponent("button_withdraw", false)

	elseif conditions.AdviceJustDisplayed("737354545", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("2029281479", context) then
		scripting.HighlightComponent("button_groupforms", false)

	elseif conditions.AdviceJustDisplayed("1621609724", context) then
		scripting.HighlightComponent("button_withdraw", false)

	elseif conditions.AdviceJustDisplayed("313094221", context) then
		scripting.HighlightComponent("button_halt", false)

	elseif conditions.AdviceJustDisplayed("-722605174", context) then
		scripting.HighlightComponent("button_group", false)

	elseif conditions.AdviceJustDisplayed("-537894077", context) then
		scripting.HighlightComponent("button_groupforms", false)

	elseif conditions.AdviceJustDisplayed("-1755835367", context) then
		scripting.HighlightComponent("radar", false)

	elseif conditions.AdviceJustDisplayed("1424352004", context) then
		scripting.HighlightComponent("button_melee", false)

	elseif conditions.AdviceJustDisplayed("593395637", context) then
		scripting.HighlightComponent("button_movespeed", false)

	elseif conditions.AdviceJustDisplayed("-729505557", context) then
		scripting.HighlightComponent("killometer_clip", false)

	elseif conditions.AdviceJustDisplayed("1738763088", context) then
		scripting.HighlightComponent("button_halt", false)

	elseif conditions.AdviceJustDisplayed("-2693399", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("1169098043", context) then
		scripting.HighlightComponent("nav_button_broadside_L", false)
	
	elseif conditions.AdviceJustDisplayed("1950152570", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("-608013080", context) then
		scripting.HighlightComponent("radar", false)

	elseif conditions.AdviceJustDisplayed("-1459886398", context) then
		scripting.HighlightComponent("nav_button_shot_chain", false)

	elseif conditions.AdviceJustDisplayed("1813634075", context) then
		scripting.HighlightComponent("nav_button_broadside_L", false)
		
	elseif conditions.AdviceJustDisplayed("-111077650", context) then
		scripting.HighlightComponent("nav_button_shot_standard", false)

	elseif conditions.AdviceJustDisplayed("-1507140649", context) then
		scripting.HighlightComponent("nav_button_shot_grape", false)

	elseif conditions.AdviceJustDisplayed("-1177825588", context) then
		scripting.HighlightComponent("nav_button_shot_chain", false)

	elseif conditions.AdviceJustDisplayed("2073993693", context) then
		scripting.HighlightComponent("radar", false)

	elseif conditions.AdviceJustDisplayed("646906330", context) then
		scripting.HighlightComponent("nav_UC_button_turn_left", false)
		
	elseif conditions.AdviceJustDisplayed("-145936557", context) then
		scripting.HighlightComponent("nav_button_broadside_L", false)

	elseif conditions.AdviceJustDisplayed("1188422552", context) then
		scripting.HighlightComponent("nav_button_broadside_R", false)

	elseif conditions.AdviceJustDisplayed("-1944874567", context) then
		scripting.HighlightComponent("button_group", false)

	elseif conditions.AdviceJustDisplayed("-783991516", context) then
		scripting.HighlightComponent("button_withdraw", false)

	elseif conditions.AdviceJustDisplayed("-1827006635", context) then
		scripting.HighlightComponent("button_fire_at_will", false)

	elseif conditions.AdviceJustDisplayed("952924146", context) then
		scripting.HighlightComponent("nav_button_board", false)

	elseif conditions.AdviceJustDisplayed("1916043659", context) then
		scripting.HighlightComponent("nav_button_groupforms", false)

	elseif conditions.AdviceJustDisplayed("-891171119", context) then
		scripting.HighlightComponent("button_public-order lowest", false)

	elseif conditions.AdviceJustDisplayed("1216388585", context) then
		scripting.HighlightComponent("Icon", false)

	elseif conditions.AdviceJustDisplayed("-1061827595", context) then
		scripting.HighlightComponent("army_promote", false)

	elseif conditions.AdviceJustDisplayed("695400466", context) then
		scripting.HighlightComponent("navy_promote", false)

	elseif conditions.AdviceJustDisplayed("1326115363", context) then
		scripting.HighlightComponent("army_fort", false)

	elseif conditions.AdviceJustDisplayed("659772888", context) then
		scripting.HighlightComponent("recruitment_tab", false)

	elseif conditions.AdviceJustDisplayed("1372607332", context) then
		scripting.HighlightComponent("army_replenish", false)

	elseif conditions.AdviceJustDisplayed("-1671835166", context) then
		scripting.HighlightComponent("button_government", false)

	elseif conditions.AdviceJustDisplayed("1242837398", context) then
		scripting.HighlightComponent("button_diplomacy", false)

	elseif conditions.AdviceJustDisplayed("1049050650", context) then
		scripting.HighlightComponent("button_missions", false)

	elseif conditions.AdviceJustDisplayed("-956562909", context) then
		scripting.HighlightComponent("button_missions", false)

	elseif conditions.AdviceJustDisplayed("295527590", context) then
		scripting.HighlightComponent("button_diplomacy", false)

	elseif conditions.AdviceJustDisplayed("1264671506", context) then
		scripting.HighlightComponent("button_diplomacy", false)

	elseif conditions.AdviceJustDisplayed("1219045742", context) then
		scripting.HighlightComponent("button_tech", false)

	elseif conditions.AdviceJustDisplayed("-1395907252", context) then
		scripting.HighlightComponent("button_tech", false)

	elseif conditions.AdviceJustDisplayed("-1604004259", context) then
		scripting.HighlightComponent("button_tech", false)

	elseif conditions.AdviceJustDisplayed("-174893187", context) then
		scripting.HighlightComponent("build_browser", false)

	elseif conditions.AdviceJustDisplayed("-428335498", context) then
		scripting.HighlightComponent("button_government", false)

	elseif conditions.AdviceJustDisplayed("-250658412", context) then
		scripting.HighlightComponent("button_government", false)
  		
 --************************************** this is how you can stop the camera pan when the user dismisses the advice
 
	elseif camera_pan ~= 0 then
		
	 --Britain
 		if conditions.AdviceJustDisplayed("-324484024", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(0.000, 362.000)
	  		
	--France
		elseif conditions.AdviceJustDisplayed("-1886952522", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(17.387, 332.769)

	--Spain
		elseif conditions.AdviceJustDisplayed("-1109259521", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(-26.750, 280.811)

	--Russia
		elseif conditions.AdviceJustDisplayed("-1808331232", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(267.000, 391.000)
		
	--Prussia
		elseif conditions.AdviceJustDisplayed("962797902", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(95.000, 368.000)
		
	--Dutch	
		elseif conditions.AdviceJustDisplayed("-1766231494", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget(35.000, 371.000)
		
	--Austria	
		elseif conditions.AdviceJustDisplayed("-1522516535", context) then
  			CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (116.000, 339.000)
		
	--Poland
		elseif conditions.AdviceJustDisplayed("665527234", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (150.000, 367.000)
		
	--Ottoman
		elseif conditions.AdviceJustDisplayed("1447626053", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (202.000, 290.000)
	 
	--Sweden
		elseif conditions.AdviceJustDisplayed("-1638244308", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (125.000, 417.000)
	 
	--Maratha
		elseif conditions.AdviceJustDisplayed("1221146494", context) then
	  		CampaignUI.StopCamera()
  			camera_pan = 0
  			scripting.game_interface:set_zoom_limit(1.0, 0.5)
  			CampaignUI.SetCameraTarget (527.000, 122.000)

		end
	end
end

local function OnWorldCreated()
	scripting.game_interface:spawn_town_level("maryland", 1, false)
	scripting.game_interface:spawn_town_level("komi", 1, false)
	scripting.game_interface:spawn_town_level("pennsylvania", 1, false) --poin to region key
	scripting.game_interface:spawn_town_level("virginia", 1, false) --poin to region key
	scripting.game_interface:set_campaign_ai_force_all_factions_boardering_humans_to_have_invasion_behaviour(false)
	scripting.game_interface:set_campaign_ai_force_all_factions_boardering_human_protectorates_to_have_invasion_behaviour(false)
	--scripting.game_interface:episodic_defend("france", "france")
	scripting.game_interface:spawn_town_level("scotland", 2, false) --poin to region key
	scripting.game_interface:spawn_town_level("ukraine", 2, false) --poin to region key
	scripting.game_interface:spawn_town_level("lower_louisiana", 2, false) --poin to region key
		
	scripting.game_interface:spawn_town_level("new_spain", 3, false) --poin to region key
	scripting.game_interface:spawn_town_level("new_spain", 4, false) --poin to region key
	scripting.game_interface:spawn_town_level("new_spain", 5, false) --poin to region key
	
	scripting.game_interface:force_diplomacy("cherokee", "afghanistan", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "austria", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "barbary_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "bavaria", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "britain", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "chechenya_dagestan", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "colombia", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "courland", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "crimean_khanate", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "denmark", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "france", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "genoa", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "georgia", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "greece", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "hannover", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "hessen", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "hungary", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "ireland", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "knights_stjohn", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "louisiana", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "mamelukes", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "maratha", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "mexico", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "morocco", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "mughal", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "mysore", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "naples_sicily", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "netherlands", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "new_spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "norway", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "ottomans", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "papal_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "piedmont_savoy", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "pirate", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "poland_lithuania", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "portugal", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "prussia", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "punjab", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "quebec", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "russia", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "safavids", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "saxony", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "scotland", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "sweden", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "thirteen_colonies", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "united_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "venice", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "westphalia", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "wurttemberg", "regions", false, false)
	
	scripting.game_interface:force_diplomacy("huron", "afghanistan", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "austria", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "barbary_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "bavaria", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "britain", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "chechenya_dagestan", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "colombia", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "courland", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "crimean_khanate", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "denmark", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "france", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "genoa", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "georgia", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "greece", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "hannover", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "hessen", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "hungary", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "ireland", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "knights_stjohn", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "louisiana", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "mamelukes", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "maratha", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "mexico", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "morocco", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "mughal", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "mysore", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "naples_sicily", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "netherlands", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "new_spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "norway", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "ottomans", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "papal_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "piedmont_savoy", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "pirate", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "poland_lithuania", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "portugal", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "prussia", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "punjab", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "quebec", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "russia", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "safavids", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "saxony", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "scotland", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "sweden", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "thirteen_colonies", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "united_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "venice", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "westphalia", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "wurttemberg", "regions", false, false)

	scripting.game_interface:force_diplomacy("inuit", "afghanistan", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "austria", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "barbary_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "bavaria", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "britain", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "chechenya_dagestan", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "colombia", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "courland", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "crimean_khanate", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "denmark", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "france", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "genoa", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "georgia", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "greece", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "hannover", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "hessen", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "hungary", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "ireland", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "knights_stjohn", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "louisiana", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "mamelukes", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "maratha", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "mexico", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "morocco", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "mughal", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "mysore", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "naples_sicily", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "netherlands", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "new_spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "norway", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "ottomans", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "papal_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "piedmont_savoy", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "pirate", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "poland_lithuania", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "portugal", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "prussia", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "punjab", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "quebec", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "russia", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "safavids", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "saxony", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "scotland", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "sweden", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "thirteen_colonies", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "united_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "venice", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "westphalia", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "wurttemberg", "regions", false, false)
	
	scripting.game_interface:force_diplomacy("iroquoi", "afghanistan", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "austria", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "barbary_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "bavaria", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "britain", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "chechenya_dagestan", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "colombia", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "courland", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "crimean_khanate", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "denmark", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "france", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "genoa", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "georgia", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "greece", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "hannover", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "hessen", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "hungary", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "ireland", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "knights_stjohn", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "louisiana", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "mamelukes", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "maratha", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "mexico", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "morocco", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "mughal", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "mysore", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "naples_sicily", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "netherlands", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "new_spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "norway", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "ottomans", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "papal_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "piedmont_savoy", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "pirate", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "poland_lithuania", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "portugal", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "prussia", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "punjab", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "quebec", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "russia", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "safavids", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "saxony", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "scotland", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "sweden", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "thirteen_colonies", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "united_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "venice", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "westphalia", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "wurttemberg", "regions", false, false)
	
	scripting.game_interface:force_diplomacy("plains", "afghanistan", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "austria", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "barbary_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "bavaria", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "britain", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "chechenya_dagestan", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "colombia", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "courland", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "crimean_khanate", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "denmark", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "france", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "genoa", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "georgia", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "greece", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "hannover", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "hessen", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "hungary", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "ireland", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "knights_stjohn", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "louisiana", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "mamelukes", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "maratha", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "mexico", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "morocco", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "mughal", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "mysore", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "naples_sicily", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "netherlands", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "new_spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "norway", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "ottomans", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "papal_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "piedmont_savoy", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "pirate", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "poland_lithuania", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "portugal", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "prussia", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "punjab", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "quebec", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "russia", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "safavids", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "saxony", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "scotland", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "sweden", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "thirteen_colonies", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "united_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "venice", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "westphalia", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "wurttemberg", "regions", false, false)
	
	scripting.game_interface:force_diplomacy("pueblo", "afghanistan", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "austria", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "barbary_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "bavaria", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "britain", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "chechenya_dagestan", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "colombia", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "courland", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "crimean_khanate", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "denmark", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "france", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "genoa", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "georgia", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "greece", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "hannover", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "hessen", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "hungary", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "ireland", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "knights_stjohn", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "louisiana", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "mamelukes", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "maratha", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "mexico", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "morocco", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "mughal", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "mysore", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "naples_sicily", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "netherlands", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "new_spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "norway", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "ottomans", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "papal_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "piedmont_savoy", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "pirate", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "poland_lithuania", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "portugal", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "prussia", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "punjab", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "quebec", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "russia", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "safavids", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "saxony", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "scotland", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "spain", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "sweden", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "thirteen_colonies", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "united_states", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "venice", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "westphalia", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "wurttemberg", "regions", false, false)
	
	
	
	scripting.game_interface:force_diplomacy("afghanistan", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("austria", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("barbary_states", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("bavaria", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("britain", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("chechenya_dagestan", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("colombia", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("courland", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("crimean_khanate", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("denmark", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("france", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("genoa", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("georgia", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("greece", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("hannover", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("hessen", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("hungary", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("ireland", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("knights_stjohn", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("louisiana", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("mamelukes", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("maratha", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("mexico", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("morocco", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("mughal", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("mysore", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("naples_sicily", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("netherlands", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("new_spain", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("norway", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("ottomans", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("papal_states", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("piedmont_savoy", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("pirate", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("poland_lithuania", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("portugal", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("prussia", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("punjab", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("quebec", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("russia", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("safavids", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("saxony", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("scotland", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("spain", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("sweden", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("thirteen_colonies", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("united_states", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("venice", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("westphalia", "cherokee", "regions", false, false)
	scripting.game_interface:force_diplomacy("wurttemberg", "cherokee", "regions", false, false)
	

	scripting.game_interface:force_diplomacy("afghanistan", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("austria", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("barbary_states", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("bavaria", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("britain", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("chechenya_dagestan", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("colombia", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("courland", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("crimean_khanate", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("denmark", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("france", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("genoa", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("georgia", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("greece", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("hannover", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("hessen", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("hungary", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("ireland", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("knights_stjohn", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("louisiana", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("mamelukes", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("maratha", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("mexico", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("morocco", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("mughal", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("mysore", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("naples_sicily", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("netherlands", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("new_spain", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("norway", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("ottomans", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("papal_states", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("piedmont_savoy", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("pirate", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("poland_lithuania", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("portugal", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("prussia", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("punjab", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("quebec", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("russia", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("safavids", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("saxony", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("scotland", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("spain", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("sweden", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("thirteen_colonies", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("united_states", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("venice", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("westphalia", "huron", "regions", false, false)
	scripting.game_interface:force_diplomacy("wurttemberg", "huron", "regions", false, false)
	
	scripting.game_interface:force_diplomacy("afghanistan", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("austria", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("barbary_states", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("bavaria", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("britain", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("chechenya_dagestan", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("colombia", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("courland", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("crimean_khanate", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("denmark", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("france", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("genoa", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("georgia", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("greece", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("hannover", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("hessen", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("hungary", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("ireland", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("knights_stjohn", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("louisiana", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("mamelukes", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("maratha", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("mexico", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("morocco", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("mughal", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("mysore", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("naples_sicily", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("netherlands", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("new_spain", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("norway", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("ottomans", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("papal_states", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("piedmont_savoy", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("pirate", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("poland_lithuania", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("portugal", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("prussia", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("punjab", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("quebec", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("russia", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("safavids", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("saxony", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("scotland", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("spain", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("sweden", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("thirteen_colonies", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("united_states", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("venice", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("westphalia", "inuit", "regions", false, false)
	scripting.game_interface:force_diplomacy("wurttemberg", "inuit", "regions", false, false)

	scripting.game_interface:force_diplomacy("afghanistan", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("austria", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("barbary_states", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("bavaria", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("britain", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("chechenya_dagestan", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("colombia", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("courland", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("crimean_khanate", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("denmark", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("france", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("genoa", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("georgia", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("greece", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("hannover", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("hessen", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("hungary", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("ireland", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("knights_stjohn", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("louisiana", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("mamelukes", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("maratha", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("mexico", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("morocco", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("mughal", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("mysore", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("naples_sicily", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("netherlands", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("new_spain", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("norway", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("ottomans", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("papal_states", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("piedmont_savoy", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("pirate", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("poland_lithuania", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("portugal", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("prussia", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("punjab", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("quebec", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("russia", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("safavids", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("saxony", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("scotland", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("spain", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("sweden", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("thirteen_colonies", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("united_states", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("venice", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("westphalia", "iroquoi", "regions", false, false)
	scripting.game_interface:force_diplomacy("wurttemberg", "iroquoi", "regions", false, false)

	scripting.game_interface:force_diplomacy("afghanistan", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("austria", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("barbary_states", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("bavaria", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("britain", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("chechenya_dagestan", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("colombia", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("courland", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("crimean_khanate", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("denmark", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("france", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("genoa", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("georgia", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("greece", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("hannover", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("hessen", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("hungary", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("ireland", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("knights_stjohn", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("louisiana", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("mamelukes", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("maratha", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("mexico", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("morocco", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("mughal", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("mysore", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("naples_sicily", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("netherlands", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("new_spain", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("norway", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("ottomans", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("papal_states", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("piedmont_savoy", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("pirate", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("poland_lithuania", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("portugal", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("prussia", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("pueblo", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("punjab", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("quebec", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("russia", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("safavids", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("saxony", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("scotland", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("spain", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("sweden", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("thirteen_colonies", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("united_states", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("venice", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("westphalia", "plains", "regions", false, false)
	scripting.game_interface:force_diplomacy("wurttemberg", "plains", "regions", false, false)

	scripting.game_interface:force_diplomacy("afghanistan", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("austria", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("barbary_states", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("bavaria", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("britain", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("chechenya_dagestan", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("cherokee", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("colombia", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("courland", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("crimean_khanate", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("denmark", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("france", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("genoa", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("georgia", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("greece", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("hannover", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("hessen", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("hungary", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("huron", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("inuit", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("ireland", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("iroquoi", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("knights_stjohn", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("louisiana", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("mamelukes", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("maratha", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("mexico", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("morocco", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("mughal", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("mysore", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("naples_sicily", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("netherlands", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("new_spain", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("norway", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("ottomans", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("papal_states", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("piedmont_savoy", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("pirate", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("plains", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("poland_lithuania", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("portugal", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("prussia", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("punjab", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("quebec", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("russia", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("safavids", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("saxony", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("scotland", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("spain", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("sweden", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("thirteen_colonies", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("united_states", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("venice", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("westphalia", "pueblo", "regions", false, false)
	scripting.game_interface:force_diplomacy("wurttemberg", "pueblo", "regions", false, false)
	


end


--------------------------------------------------------------------------------------------------------------------
-- Add event callbacks
-- For a list of all events supported create a "documentation" directory in your empire directory, run a debug build of the game and see
-- the events.txt file
--------------------------------------------------------------------------------------------------------------------
scripting.AddEventCallBack("WorldCreated", OnWorldCreated)
scripting.AddEventCallBack("AdviceIssued", OnAdviceIssued)
scripting.AddEventCallBack("AdviceDismissed", OnAdviceDismissed)
scripting.AddEventCallBack("AdviceSuperseded", OnAdviceDismissed)
scripting.AddEventCallBack("CameraMoverFinished", OnCameraMoverFinished)
scripting.AddEventCallBack("FactionTurnStart", OnFactionTurnStart)
