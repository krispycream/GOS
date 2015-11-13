---Credits to TheWelder
local info = "Soraka Loaded"
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
 	
			
			for _, ally in pairs(GetAllyHeroes()) do
			if Skra.Combo.W:Value() then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.6 and
	            	CanUseSpell(myHero, _W) == READY and IsInDistance(ally, 600) then
			CastTargetSpell(ally, _W)
		end
	end
end
			

			for _, ally in pairs(GetAllyHeroes()) do
			if Skra.Combo.R:Value() then
			if (GetCurrentHP(ally)/GetMaxHP(ally))<0.2 and
	            	CanUseSpell(myHero, _R) == READY and IsObjectAlive(ally) then
			CastSpell(_R)
		end
	end
end			
			if ValidTarget(target, 950) then
			if Skra.Combo.Q:Value() then
			if target and CanUseSpell(myHero,_Q) == READY then
		-- CastStartPosVec,EnemyChampionPtr,EnemyMoveSpeed,YourSkillshotSpeed,SkillShotDelay,SkillShotRange,SkillShotWidth,MinionCollisionCheck,AddHitBox;
		local pred = GetPredictionForPlayer(GetOrigin(target),target,GetMoveSpeed(target),1100,250,970,260,false,true)
		if pred.HitChance == 1 then	
			CastSkillShot(_Q,pred.PredPos)
			end

		end
	end
end
			
			if ValidTarget(target, 925) then
			if Skra.Combo.E:Value() then
			if target and CanUseSpell(myHero,_E) == READY then
		-- CastStartPosVec,EnemyChampionPtr,EnemyMoveSpeed,YourSkillshotSpeed,SkillShotDelay,SkillShotRange,SkillShotWidth,MinionCollisionCheck,AddHitBox;
		local pred = GetPredictionForPlayer(GetOrigin(target),target,GetMoveSpeed(target),math.huge,1750,925,275,false,true)
		if pred.HitChance == 1 then	
			CastSkillShot(_E,pred.PredPos)
					end
			end
			end
		end
		end
	
end)
