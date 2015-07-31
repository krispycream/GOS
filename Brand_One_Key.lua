---Credits to TheWelder
local info = "Brand_One_Key Loaded"
local upv = "Upvote if you like it!"
local sig = "Made by snowbell"
local ver = "v 1.0"
textTable = {info,upv,sig,ver} 
PrintChat(textTable[1])
PrintChat(textTable[2])
PrintChat(textTable[3])
PrintChat(textTable[4]) 

Config = scriptConfig("Brand", "Brand_One_Key")
Config.addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
Config.addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
Config.addParam("E", "Use E", SCRIPT_PARAM_ONOFF, true)
Config.addParam("R", "Use R If Killabe", SCRIPT_PARAM_ONOFF, true)
Config.addParam("Combo", "Combo", SCRIPT_PARAM_KEYDOWN, string.byte(" "))


OnLoop(function(myHero)
	local myHero = GetMyHero()
	local target = GetCurrentTarget()
	local myHeroPos = GetOrigin(myHero)
	--Loots from TheWelder
	local WPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),math.huge,850,900,240,false,false)
	local QPred = GetPredictionForPlayer(GetMyHeroPos(),target,GetMoveSpeed(target),1600,250,1100,60,true,true)
	local BonusAP = GetBonusAP(myHero)
	local perc50 = (BonusAP*50)/100
	local Pyroclasm = (GetCastLevel(myHero,_R) *150)+(BonusAP)
	local Pyroclasm2 = (GetCastLevel(myHero,_R) *250)+(BonusAP)
	local Pyroclasm3 = (GetCastLevel(myHero,_R) *350)+(BonusAP)
	if "Brand" == GetObjectName(myHero) then
	if Config.Combo and IsObjectAlive(target) then	
		if ValidTarget(target, 900) then
		if Config.W then
	             if CanUseSpell(myHero, _W) == READY and WPred.HitChance == 1 then
                 	CastSkillShot(_W,WPred.PredPos.x,WPred.PredPos.y,WPred.PredPos.z)
end
end
end
		if ValidTarget(target, 700) then
		if Config.E then
		if  CanUseSpell(myHero, _E) == READY and IsInDistance(target, 700) then
			CastTargetSpell(target, _E)
end
end
end
		if ValidTarget(target, 1100) then
		if Config.W then
		if CanUseSpell(myHero, _Q) == READY and QPred.HitChance == 1 then
                       CastSkillShot(_Q,QPred.PredPos.x,QPred.PredPos.y,QPred.PredPos.z)
		end
end
end		

	if CalcDamage(myHero, target, Pyroclasm) > GetCurrentHP(target) + GetHPRegen(target) then
	if CalcDamage(myHero, target, Pyroclasm2) > GetCurrentHP(target) + GetHPRegen(target) then
	if CalcDamage(myHero, target, Pyroclasm3) > GetCurrentHP(target) + GetHPRegen(target) then
	if ValidTarget(target,700) then
	if Config.R then
	if CanUseSpell(myHero,_R) == READY then
	CastTargetSpell(target,_R)
end
end
end
end
end
	    	end
	end
end
end)
