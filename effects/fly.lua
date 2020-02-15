
-- Flying - grants "fly" privilage to non-admins
--------------------------------------------------

beacon.register_effect("fly", {
	desc_name = "Flying",
	min_level = 1,
	on_apply = function(player, name)
		local privs = minetest.get_player_privs(name)
		if privs.privs then return end -- don't effect admins

		if beacon.has_player_monoids then
			player_monoids.fly:add_change(player, true, "beacon_fly")
		else
			privs.fly = true
			minetest.set_player_privs(name, privs)
		end
	end,
	on_remove = function(player, name)
		local privs = minetest.get_player_privs(name)
		if privs.privs then return end -- don't effect admins

		if beacon.has_player_monoids then
			player_monoids.fly:del_change(player, "beacon_fly")
		else
			privs.fly = nil
			minetest.set_player_privs(name, privs)
		end
	end,
})
