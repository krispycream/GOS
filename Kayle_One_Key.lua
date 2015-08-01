require('Inspired')
---Credits to TheWelder
local info = "Kayle_One_Key Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by snowbell"
local ver = "v 1.0"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4]) 

Config = scriptConfig("Kayle", "Kayle_One_Key Loaded")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))

OnLoop(function(myHero)
        local myHero = GetMyHero()
	local target = GetCurrentTarget()
	local myHeroPos = GetOrigin(myHero)
        if "Kayle" == GetObjectName(myHero) then

		if Config.Combo and IsObjectAlive(target) then
		if Config.E then     
                if CanUseSpell(myHero, _E) == READY and IsInDistance(target, 525) then 
                        CastTargetSpell(myHero, _E)                            
                end
end


		if Config.Q then  
               	if CanUseSpell(myHero, _Q) == READY and IsInDistance(target, 600) then 
                        CastTargetSpell(target, _Q)                            
                end
end
                if Smite and IsInDistance(target, GetCastRange(myHero,Smite)) and CanUseSpell(myHero, Smite) then
                        CastTargetSpell(target, Smite)

end
		
			for _, ally in pairs(GetAllyHeroes()) do
			if Config.W then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.4 and
	            	CanUseSpell(myHero, _W) == READY and IsInDistance(ally, 600) then
			CastTargetSpell(ally, _W)
		end
	end
end


			if Config.W then
			if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.6 and
	            	CanUseSpell(myHero, _W) == READY then
			CastTargetSpell(myHero, _W)
		end
	end

			if Config.R then
			if (GetCurrentHP(myHero)/GetMaxHP(myHero))<0.4 and
	            	CanUseSpell(myHero, _R) == READY then
			CastTargetSpell(myHero, _R)
		end
	end

			for _, ally in pairs(GetAllyHeroes()) do
			if Config.R then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.2 and
	            	CanUseSpell(myHero, _R) == READY and IsInDistance(ally, 900) then
			CastTargetSpell(ally, _R)
		end
	end
end

			
                end
        end
end)
