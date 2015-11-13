---Credits to TheWelder
local info = "Soraka_One_Key Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by SnOwBeLL"
local ver = "v 1.0"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4])
	
if GetObjectName(GetMyHero()) ~= "Soraka" then return end

require('Inspired')


Skra = Menu("Soraka", "Soraka")
Skra:SubMenu("Combo", "Combo")
Skra.Combo:Boolean("Q", "Use Q", true)
Skra.Combo:Boolean("W", "Use W", true)
Skra.Combo:Boolean("E", "Use E", true)
Skra.Combo:Boolean("R", "Use R", true)

OnTick(function(myHero)
   local target = GetCurrentTarget()
   ----COMBO----
 if IOW:Mode() == "Combo" then
local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1750,500,950,300,false,true)
local EPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,0,650,50,false,true)
			
			for _, ally in pairs(GetAllyHeroes()) do
			if Config.W then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.6 and
	            	CanUseSpell(myHero, _W) == READY and IsInDistance(ally, 600) then
			CastTargetSpell(ally, _W)
		end
	end
end
			

			for _, ally in pairs(GetAllyHeroes()) do
			if Config.R then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.2 and
	            	CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
			CastSpell(_R)
		end
	end
end			
			if ValidTarget(target, 950) then
			if Config.Q then
			if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                 	CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)

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
	
end)
