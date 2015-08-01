local info = "Shen_One_Key Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by snowbell"
local ver = "v 1.0"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4]) 

Config = scriptConfig("Shen", "Shen_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))



OnLoop(function(myHero)
	local myHero = GetMyHero()
	local target = GetCurrentTarget()
	local myHeroPos = GetOrigin(myHero)
	local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,0,650,50,false,true)

	if "Shen" == GetObjectName(myHero) then
	if Config.Combo and IsObjectAlive(target) then
	if ValidTarget(target, 500) then

		if Config.Q then
			if CanUseSpell(myHero, _Q) == READY and IsInDistance(target, 550) then
			CastTargetSpell(target,_Q)

		end
	end
end		

		if ValidTarget(target, 650) then
		if Config.E then
			if CanUseSpell(myHero, _E) == READY and EPred.HitChance == 1 then
			CastSkillShot(_E,EPred.PredPos.x,EPred.PredPos.y,EPred.PredPos.z)


		end
	end
end

		if ValidTarget(target, 200) then
		if Config.E then
			if CanUseSpell(myHero, _W) == READY and IsInDistance(target, 200) then
			CastSpell(_W)

		end
	end
end	

		for _, ally in pairs(GetAllyHeroes()) do
			if Config.R then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.2 and
	            	CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
			CastTargetSpell(ally,_R)

					end
				end	
			end
		end
	end
end)
