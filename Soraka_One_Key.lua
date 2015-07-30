Config = scriptConfig("Soraka", "Soraka_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)



OnLoop(function(myHero)
	if not IWalkConfig.Combo then return end
	DrawText("ONE KEY TO WIN",24,0,0,0xffff0000);
	local target = GetCurrentTarget()
	local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1750,500,950,300,false,true)
	local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,0,650,50,false,true)
			
			for _, ally in pairs(GetAllyHeroes()) do
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.6 and
	            	CanUseSpell(myHero, _W) == READY and Config.W and IsInDistance(ally, 600) then
			CastTargetSpell(ally, _W)
end
end


			for _, ally in pairs(GetAllyHeroes()) do
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.3 and
	            	CanUseSpell(myHero, _R) == READY and Config.R and IsObjectAlive(ally) then
			CastSpell(_R)
end
end
			if CanUseSpell(myHero, _Q) == READY and Config.Q and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
			
			elseif CanUseSpell(myHero, _E) == READY and Config.E and EPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)

end
	
end)

