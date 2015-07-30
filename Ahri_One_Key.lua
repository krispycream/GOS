Config = scriptConfig("Ahri", "Ahri_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R mouse position", SCRIPT_PARAM_ONOFF, true)


OnLoop(function(myHero)
	if Config.Combo then return end
	DrawMenu()
	DrawText("ONE KEY TO WIN",24,0,0,0xffff0000);
	local target = GetCurrentTarget()
	   if ValidTarget(target, 1000) then

		local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),2500,250,1000,100,false,false)
                 	if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
		
		if  CanUseSpell(myHero, _W) == READY and Config.Q and IsInDistance(target, 600) then
                        CastTargetSpell(myHero,_W)
			end
		local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1550,250,1000,100,true,true)	
	        	if CanUseSpell(myHero, _E) == READY and Config.E and EPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
		 		end

			local mousePos = GetMousePos()
			if CanUseSpell(myHero, _R) == READY and Config.R then
			   CastSkillShot(_R,mousePos.x,mousePos.y,mousePos.z)
	end
	    	end 
end)
