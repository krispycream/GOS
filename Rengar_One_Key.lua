local info = "Rengar_One_Key Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by snowbell"
local ver = "v 1.0"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4]) 

Config = scriptConfig("Rengar", "Rengar_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)


OnLoop(function(myHero)
	if Config.Combo then return end
	local target = GetCurrentTarget()
	if ValidTarget(target, 900) then
	local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1500,250,1000,70,true,true)
	
	             if CanUseSpell(myHero, _Q) == READY and Config.W and IsInDistance(target, 550) then
			CastSpell(_Q)

		elseif  CanUseSpell(myHero, _W) == READY and Config.W and IsInDistance(target, 450) then
			CastSpell(_W)
			

		elseif CanUseSpell(myHero, _E) == READY and Config.E and EPred.HitChance == 1 then
                       CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)		  
	end
end
end)
