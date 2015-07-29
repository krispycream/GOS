Config = scriptConfig("Brand", "Brand_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R If Killabe", SCRIPT_PARAM_ONOFF, true)


OnLoop(function(myHero)
	if not IWalkConfig.Combo then return end
	DrawMenu()
	DrawText("ONE KEY TO WIN",24,0,0,0xffff0000);
	local target = GetCurrentTarget()
	if ValidTarget(target, 900) then
	--Loots from TheWelder
	local WPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,850,900,240,false,false)
	local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,250,1100,60,true,true)
	local BonusAP = GetBonusAP(myHero)
	local perc50 = (BonusAP*50)/100
	local Pyroclasm = (GetCastLevel(myHero,_R) *150)+(BonusAP)
	local Pyroclasm2 = (GetCastLevel(myHero,_R) *250)+(BonusAP)
	local Pyroclasm3 = (GetCastLevel(myHero,_R) *350)+(BonusAP)
		
	
	             if CanUseSpell(myHero, _W) == READY and Config.W and WPred.HitChance == 1 then
                 	CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)

		elseif  CanUseSpell(myHero, _E) == READY and Config.E and IsInDistance(target, 700) then
			CastTargetSpell(target, _E)
			

		elseif CanUseSpell(myHero, _Q) == READY and Config.Q and QPred.HitChance == 1 then
                       CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end		

	if ValidTarget(target,700) then
	if CalcDamage(myHero, target, Pyroclasm) > GetCurrentHP(target) + GetHPRegen(target) then
	if CalcDamage(myHero, target, Pyroclasm2) > GetCurrentHP(target) + GetHPRegen(target) then
	if CalcDamage(myHero, target, Pyroclasm3) > GetCurrentHP(target) + GetHPRegen(target) then
	if CanUseSpell(myHero,_R) == READY and Config.R then
	CastTargetSpell(target,_R)
end
end
end
	    	end
	end
end
end)

OnLoop(function(myHero) --GOOD idea I think by MarCiii
	if not IWalkConfig.Harass then return end
	DrawMenu()
	DrawText("ULTIMATE ON",24,0,0,0xffff0000);
	local target = GetCurrentTarget()
			local WPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,850,900,240,false,false)	
	        	if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 then
                 	CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)

			elseif  CanUseSpell(myHero, _E) == READY and Config.E and IsInDistance(target, 700) then
			CastTargetSpell(target, _E)
		end 
end)