--ConVar syncing
CreateConVar("ttt2_jugg_armor", "120", {FCVAR_ARCHIVE, FCVAR_NOTFIY})
CreateConVar("ttt2_jugg_health", "250", {FCVAR_ARCHIVE, FCVAR_NOTFIY})
CreateConVar("ttt2_jugg_defense", "0.015", {FCVAR_ARCHIVE, FCVAR_NOTFIY})
CreateConVar("ttt2_jugg_damage", "0.015", {FCVAR_ARCHIVE, FCVAR_NOTFIY})



hook.Add("TTTUlxDynamicRCVars", "TTTUlxDynamicJuggernautCVars", function(tbl)
	tbl[ROLE_JUGG] = tbl[ROLE_JUGG] or {}

	--# How much armor should the Serial Killer start with?
	-- ttt2_jugg_armor [0..n] (default: 120)
	table.insert(tbl[ROLE_JUGG], {
		cvar = "ttt2_jugg_armor",
		slider = true,
		min = 0,
		max = 120,
		decimal = 0,
		desc = "ttt2_jugg_armor (Def: 120)"
	})
	table.insert(tbl[ROLE_JUGG], { 
    cvar = "ttt2_jugg_health"	
	slider = true,
	min = 100,
	max = 250,
	decimal = 0,
	desc = "ttt2_jugg_health (Def: 250)"
	})
	table.insert(tbl[ROLE_JUGG], { 
    cvar = "ttt2_jugg_defense"	
	slider = true,
	min = 0,
	max = 1,
	decimal = 3,
	desc = "ttt2_jugg_defense (Def: 0.03)"
	})
	
end)

hook.Add("TTT2SyncGlobals", "AddJuggKillerGlobals", function()
	SetGlobalInt("ttt2_jugg_armor", GetConVar("ttt2_jugg_armor"):GetInt())
	)
	
    SetGlobalInt("ttt2_jugg_health", GetConVar("ttt2_jugg_health"):GetInt())
	)
	
	SetGlobalInt("ttt2_jugg_defense", GetConVar("ttt2_jugg_defense"):GetInt ())
	
	
	
	

cvars.AddChangeCallback("ttt2_jugg_armor", function(name, old, new)
	SetGlobalInt("ttt2_jugg_armor", tonumber(new))
	
	end)
	
	cvars.AddChangeCallback("ttt2_jugg_health", function(name, old, new)
	SetGlobalInt("ttt2_jugg_health", tonumber(new))
	
	end)
	
	cvars.AddChangeCallback("ttt2_jugg_defense", function(name, old, new)
	SetGlobalInt("ttt2_jugg_defense", tonumber(new))
	
	end)
	
	)
