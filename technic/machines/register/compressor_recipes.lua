
local S = technic.getter

technic.register_recipe_type("compressing", { description = S("Compressing") })

function technic.register_compressor_recipe(data)
	data.time = data.time or 4
	technic.register_recipe("compressing", data)
end

local recipes = {
	--{"default:snowblock",          "default:ice"},
	{"hades_core:fertile_sand 2",             "hades_core:sandstone"},
	--{"default:desert_sand 2",      "default:desert_sandstone"},
	--{"default:silver_sand 2",      "default:silver_sandstone"},
	--{"default:desert_sand",        "default:desert_stone"},
	{"hades_technic:mixed_metal_ingot",  "hades_technic:composite_plate"},
	{"hades_core:copper_ingot 5",     "hades_technic:copper_plate"},
	{"hades_technic:coal_dust 4",        "hades_technic:graphite"},
	{"hades_technic:carbon_cloth",       "hades_technic:carbon_plate"},
	{"hades_technic:uranium35_ingot 5",  "hades_technic:uranium_fuel"},
}

-- defuse the default sandstone recipe, since we have the compressor to take over in a more realistic manner
minetest.clear_craft({
	recipe = {
		{"hades_core:fertile_sand", "hades_core:fertile_sand"},
		{"hades_core:fertile_sand", "hades_core:fertile_sand"},
	},
})
--[[
minetest.clear_craft({
	recipe = {
		{"default:desert_sand", "default:desert_sand"},
		{"default:desert_sand", "default:desert_sand"},
	},
})
minetest.clear_craft({
	recipe = {
		{"default:silver_sand", "default:silver_sand"},
		{"default:silver_sand", "default:silver_sand"},
	},
})
--]]
for _, data in pairs(recipes) do
	technic.register_compressor_recipe({input = {data[1]}, output = data[2]})
end

