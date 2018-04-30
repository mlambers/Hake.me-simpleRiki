local rikiMartini = {}

rikiMartini.optionEnableScript = Menu.AddOption({"Hero Specific", "Riki martini"}, "1.Enable", "Turn on/off this script.")
rikiMartini.PressComboKey = Menu.AddKeyOption({ "Hero Specific","Riki martini" }, "2. Execute combo key", Enum.ButtonCode.KEY_I)
rikiMartini.enablePhaseBootAuto = Menu.AddOption({ "Hero Specific","Riki martini" }, "3. Auto usage phase boots.", "")

rikiMartini.npcName = "npc_dota_hero_riki"
function rikiMartini.OnUpdate()
	if not Menu.IsEnabled(rikiMartini.optionEnableScript) then return true end
    local myHero = Heroes.GetLocal()
	if not myHero then return end
	if NPC.GetUnitName(myHero) ~= rikiMartini.npcName then return end
	
	local phaseBoots = NPC.GetItem(myHero, "item_phase_boots", true)
	if Menu.IsEnabled(rikiMartini.enablePhaseBootAuto) and NPC.IsRunning(myHero) and phaseBoots and Ability.IsReady(phaseBoots) then
		Ability.CastNoTarget(phaseBoots)
	return end
	
	
	
	if Menu.IsKeyDown(rikiMartini.PressComboKey) then	
		-- Skills
		local smokeScreen = NPC.GetAbility(myHero, "riki_smoke_screen")
		local blinkStrike = NPC.GetAbility(myHero, "riki_blink_strike")  
		local rikiUltimate = NPC.GetAbility(myHero, "riki_tricks_of_the_trade")
		
		-- Items
		local diffusal = NPC.GetItem(myHero, "item_diffusal_blade", true)
		local nullifier = NPC.GetItem(myHero, "item_nullifier", true)
		local medallion = NPC.GetItem(myHero, "item_medallion_of_courage", true)
		local solarCrest = NPC.GetItem(myHero, "item_solar_crest", true)
		local aghanimScepter = NPC.GetItem(myHero, "item_ultimate_scepter", true)
		local orchid = NPC.GetItem(myHero, "item_orchid", true)
		local bloodthorn = NPC.GetItem(myHero, "item_bloodthorn", true)
		
		local forceStaff = NPC.GetItem(myHero, "item_force_staff", true)
		local hurricanePike = NPC.GetItem(myHero, "item_hurricane_pike", true)
		local eul = NPC.GetItem(myHero, "item_cyclone", true)
		
		local myMana = NPC.GetMana(myHero)
		local enemyTarget = Input.GetNearestHeroToCursor(Entity.GetTeamNum(myHero), Enum.TeamType.TEAM_ENEMY)
		
		if NPC.IsLinkensProtected(enemyTarget) then
			if forceStaff and Ability.IsReady(forceStaff) and Ability.IsCastable(forceStaff, myMana) then
				Ability.CastTarget(forceStaff, enemyTarget) 
			return end
			
			if hurricanePike and Ability.IsReady(hurricanePike) and Ability.IsCastable(hurricanePike, myMana) then
				Ability.CastTarget(hurricanePike, enemyTarget) 
			return end
			
			if eul and Ability.IsReady(eul) and Ability.IsCastable(eul, myMana) then
				Ability.CastTarget(eul, enemyTarget) 
			return end
			
			if diffusal and Ability.IsReady(diffusal) and Ability.IsCastable(diffusal, myMana) then
				Ability.CastTarget(diffusal, enemyTarget) 
			return end
			
			if orchid and Ability.IsReady(orchid) and Ability.IsCastable(orchid, myMana) then
				Ability.CastTarget(orchid, enemyTarget) 
			return end
		
			if bloodthorn and Ability.IsReady(bloodthorn) and Ability.IsCastable(bloodthorn, myMana) then
				Ability.CastTarget(bloodthorn, enemyTarget) 
			return end
			
			return 
		end
		
		if blinkStrike and Ability.IsReady(blinkStrike) and Ability.IsCastable(blinkStrike, myMana) then 
			Ability.CastTarget(blinkStrike, enemyTarget) 
		return end
		
		if diffusal and Ability.IsReady(diffusal) and Ability.IsCastable(diffusal, myMana) then
			Ability.CastTarget(diffusal, enemyTarget) 
		return end
		
		if smokeScreen and Ability.IsReady(smokeScreen) and Ability.IsCastable(smokeScreen, myMana) then
			local enemyAbsOrigin = Entity.GetAbsOrigin(enemyTarget)
			Ability.CastPosition(smokeScreen, enemyAbsOrigin)
		return end
		
		if medallion and Ability.IsReady(medallion) and Ability.IsCastable(medallion, myMana) then
			Ability.CastTarget(medallion, enemyTarget) 
		return end
		
		if solarCrest and Ability.IsReady(solarCrest) and Ability.IsCastable(solarCrest, myMana) then
			Ability.CastTarget(solarCrest, enemyTarget) 
		return end
		
		if orchid and Ability.IsReady(orchid) and Ability.IsCastable(orchid, myMana) then
			Ability.CastTarget(orchid, enemyTarget) 
		return end
		
		if bloodthorn and Ability.IsReady(bloodthorn) and Ability.IsCastable(bloodthorn, myMana) then
			Ability.CastTarget(bloodthorn, enemyTarget) 
		return end
		
		if nullifier and Ability.IsReady(nullifier) and Ability.IsCastable(nullifier, myMana) then
			Ability.CastTarget(nullifier, enemyTarget) 
		return end
		
		if rikiUltimate and Ability.IsReady(rikiUltimate) and Ability.IsCastable(rikiUltimate, myMana) then
			if aghanimScepter then
				Ability.CastTarget(rikiUltimate, myHero)
			else
				Ability.CastNoTarget(rikiUltimate)
			end
		return end
		
	end
	
end

return rikiMartini