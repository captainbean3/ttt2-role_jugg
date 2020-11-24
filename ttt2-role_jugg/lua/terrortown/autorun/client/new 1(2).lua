hook.Add("Initialize", "ttt2_role_jugg_setup_client", function()
	STATUS:RegisterStatus("ttt2_jugg_refill_knife", {
		hud = Material("vgui/ttt/hud_icon_jugg.png"),
		type = "bad"
	})
end)