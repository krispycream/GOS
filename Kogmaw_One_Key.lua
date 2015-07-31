local info = "Kogmaw_One_Key Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by snowbell"
local ver = "v 1.0"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4]) 

Config = scriptConfig("Kogmaw", "Kogmaw_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
	local myHero = GetMyHero()
	local target = GetCurrentTarget()
	local myHeroPos = GetOrigin(myHero)
	local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1650,250,1200,70,true,true)
	local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1400,250,1360,120,false,true)
	local RPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,1200,1800,150,false,false)	
	if "KogMaw" == GetObjectName(myHero) then	
		
		if Config.Combo and IsObjectAlive(target) then	
		if ValidTarget(target, 1200) then
			if Config.Q then
                 	if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
end
end
end
		if ValidTarget(target, 600) then
			if Config.W then
			if  CanUseSpell(myHero, _W) == READY and IsInDistance(target, 600) then
                        CastSpell(_W)
end
end
end

		if ValidTarget(target, 1360) then
			if Config.E then
	        	if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
                 	CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)
end
end
end
		if ValidTarget(target, 1800) then
			if Config.R then
	        	if CanUseSpell(myHero, _R) == READY and RPred.HitChance == 1 then
                 	CastSkillShot(_R,RPred.PredPos.x,RPred.PredPos.y,RPred.PredPos.z)
end
end
end

end
end
end)
