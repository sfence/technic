-- Minetest 0.4.6 mod: technic_chests
-- namespace: technic
-- (c) 2012-2013 by RealBadAngel <mk@realbadangel.pl>

local modpath = minetest.get_modpath(minetest.get_current_modname())

technic = rawget(_G, "technic") or {}
technic.chests = {}

dofile(modpath.."/common.lua")
dofile(modpath.."/register.lua")
dofile(modpath.."/iron_chest.lua")
dofile(modpath.."/copper_chest.lua")
dofile(modpath.."/silver_chest.lua")
dofile(modpath.."/gold_chest.lua")
dofile(modpath.."/mithril_chest.lua")

-- undo all of the locked wooden chest recipes created by default and
-- moreblocks, and just make them use a padlock.

if minetest.get_modpath("hades_moreblocks") then
	minetest.clear_craft({
		type = "shapeless",
		recipe = {
			"hades_chests:chest",
			"hades_core:gold_ingot",
		}
	})

	minetest.clear_craft({
		type = "shapeless",
		recipe = {
			"hades_chests:chest",
			"hades_core:bronze_ingot",
		}
	})

	minetest.clear_craft({
		type = "shapeless",
		recipe = {
			"hades_chests:chest",
			"hades_core:copper_ingot",
		}
	})
end

minetest.clear_craft({
	type = "shapeless",
	recipe = {
		"hades_chests:chest",
		"hades_core:steel_ingot",
	}
})

minetest.clear_craft({output = "hades_chests:chest_locked"})

minetest.register_craft({
	output = "hades_chests:chest_locked",
	recipe = {
		{ "group:wood", "group:wood", "group:wood" },
		{ "group:wood", "hades_extramaterials:padlock", "group:wood" },
		{ "group:wood", "group:wood", "group:wood" }
	}
})

minetest.register_craft({
	output = "hades_chests:chest_locked",
	type = "shapeless",
	recipe = {
		"hades_chests:chest",
		"hades_extramaterials:padlock"
	}
})

minetest.register_lbm({
	name = "hades_technic_chests:fix_wooden_chests",
	nodenames = {"hades_chests:chest"},
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "")
	end
})
