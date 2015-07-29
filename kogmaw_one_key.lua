Config = scriptConfig("Kogmaw", "Kogmaw_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)

OnLoop(function(myHero)
	if not IWalkConfig.Combo then return end
	DrawMenu()
	DrawText("ONE KEY TO WIN",24,0,0,0xffff0000);
	local target = GetCurrentTarget()
		if ValidTarget(target, 1200) then
			local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,true,true)
                 	if CanUseSpell(myHero, _Q) == READY and Config.Q and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end

		if  CanUseSpell(myHero, _W) == READY and Config.W and IsInDistance(target, 600) then
                        CastTargetSpell(myHero,_W)
		end	

		if ValidTarget(target, 1360) then
			local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1400,250,1360,120,false,true)	
	        	if CanUseSpell(myHero, _E) == READY and Config.E and EPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)

        		end
		end
		if ValidTarget(target, 1800) then
			local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,1200,1800,150,false,false)	
	        	if CanUseSpell(myHero, _R) == READY and Config.R and RPred.HitChance == 1 then
                 	CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			end
		end

	    	end 
end)

OnLoop(function(myHero) --GOOD idea I think by MarCiii
	if not IWalkConfig.Harass then return end
	DrawMenu()
	DrawText("ULTIMATE ON",24,0,0,0xffff0000);
	local target = GetCurrentTarget()
		if ValidTarget(target, 1800) then
			local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,1200,1800,150,false,false)	
	        	if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
                 	CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
			end
		end 
end)
