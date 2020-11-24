if SERVER then
	AddCSLuaFile()

	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_jugg.vmt")
end

-- creates global var "TEAM_SERIALKILLER" and other required things
-- TEAM_[name], data: e.g. icon, color,...
roles.InitCustomTeam(ROLE.name, {
		icon = "vgui/ttt/dynamic/roles/icon_sk",
		color = Color(173, 89, 59, 255)
})

function ROLE:PreInitialize()
	self.color = Color(49, 105, 109, 255)

	self.abbr = "jugg" -- abbreviation
	self.surviveBonus = 1 -- bonus multiplier for every survive while another player was killed
	self.scoreKillsMultiplier = 5 -- multiplier for kill of player of another team
	self.scoreTeamKillsMultiplier = -16 -- multiplier for teamkill

	self.defaultTeam = TEAM_JUGG -- the team name: roles with same team name are working together
	self.defaultEquipment = SPECIAL_EQUIPMENT -- here you can set up your own default equipment

	self.conVarData = {
		pct = 0.15, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 6, -- minimum amount of players until this role is able to get selected
		credits = 0, -- the starting credits of a specific role
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		shopFallback = SHOP_DISABLED,
		random = 33
	}
end

function ROLE:Initialize()
	if SERVER and JESTER then
		-- add a easy role filtering to receive all jesters
		-- but just do it, when the role was created, then update it with recommended function
		-- theoretically this function is not necessary to call, but maybe there are some modifications
		-- of other addons. So it's better to use this function
		-- because it calls hooks and is doing some networking
		self.networkRoles = {JESTER}
	end
end


	
	

	-- Give Loadout on respawn and rolechange
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
	ply:GiveArmor(GetConVar("ttt2_jugg_armor"):GetInt())
	end
	
	ply:SetMaxHealth (GetConVar ("ttt2_jugg_health") : GetInt ())
	
	ply:SetHealth (GetConVar ("ttt2_jugg_health") : GetInt ())
    
	ply:dmginfo:GetDamage() > 1 ) then
        dmginfo:SetDamage(dmginfo:GetDamage() * 1 - JUGG_DATA:AmountLivingPlayers() * (GetConVar ("ttt2_jugg_defense") : GetInt ()) )
	end
	
	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		
		ply:RemoveArmor(GetConVar("ttt2_jugg_armor"):GetInt())
	end
	
	ply:dmginfo:GetDamage() > 1 ) then
        dmginfo:SetDamage(dmginfo:GetDamage() * 1 :GetInt ())
	
	
	
	ply:SetMaxHealth(100)
    end

	
		
	end)
end