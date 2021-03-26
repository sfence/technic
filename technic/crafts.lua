-- check if we have the necessary dependencies to allow actually using these materials in the crafts
local mesecons_materials = minetest.get_modpath("mesecons_materials")

-- Remove some recipes
-- Bronze
minetest.clear_craft({
	type = "shapeless",
	output = "hades_core:bronze_ingot"
})
-- Restore recipe for bronze block to ingots
minetest.register_craft({
	output = "hades_core:bronze_ingot 9",
	recipe = {
		{"hades_core:bronzeblock"}
	}
})

-- Accelerator tube
if pipeworks.enable_accelerator_tube then
	minetest.clear_craft({
		output = "pipeworks:accelerator_tube_1",
	})

	minetest.register_craft({
		output = 'pipeworks:accelerator_tube_1',
		recipe = {
			{'hades_technic:copper_coil', 'pipeworks:tube_1', 'hades_technic:copper_coil'},
			}
	})
end

-- Teleport tube
if pipeworks.enable_teleport_tube then
	minetest.clear_craft({
		output = "pipeworks:teleport_tube_1",
	})

	minetest.register_craft({
		output = 'pipeworks:teleport_tube_1',
		recipe = {
			{'hades_core:mese_crystal', 'hades_technic:copper_coil', 'hades_core:mese_crystal'},
			{'pipeworks:tube_1', 'hades_technic:control_logic_unit', 'pipeworks:tube_1'},
			{'hades_core:mese_crystal', 'hades_technic:copper_coil', 'hades_core:mese_crystal'},
			}
	})
end

-- basic materials' brass ingot

minetest.clear_craft({
	output = "hades_extramaterials:brass_ingot",
})

minetest.register_craft( {
	type = "shapeless",
	output = "hades_extramaterials:brass_ingot 9",
	recipe = { "hades_extramaterials:brass_block" },
})

-- tubes crafting recipes

minetest.register_craft({
	output = 'hades_technic:diamond_drill_head',
	recipe = {
		{'hades_technic:stainless_steel_ingot', 'hades_core:diamond', 'hades_technic:stainless_steel_ingot'},
		{'hades_core:diamond',               '',                'hades_core:diamond'},
		{'hades_technic:stainless_steel_ingot', 'hades_core:diamond', 'hades_technic:stainless_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:green_energy_crystal',
	recipe = {
		{'hades_core:gold_ingot', 'hades_technic:battery', 'dye:green'},
		{'hades_technic:battery', 'hades_technic:red_energy_crystal', 'hades_technic:battery'},
		{'dye:green', 'hades_technic:battery', 'hades_core:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:blue_energy_crystal',
	recipe = {
		{'hades_extraores:titanium_ingot', 'hades_technic:battery', 'dye:blue'},
		{'hades_technic:battery', 'hades_technic:green_energy_crystal', 'hades_technic:battery'},
		{'dye:blue', 'hades_technic:battery', 'hades_extraores:titanium_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:red_energy_crystal',
	recipe = {
		{'hades_extraores:silver_ingot', 'hades_technic:battery', 'dye:red'},
		{'hades_technic:battery', 'hades_extramaterials:energy_crystal_simple', 'hades_technic:battery'},
		{'dye:red', 'hades_technic:battery', 'hades_extraores:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:copper_coil 1',
	recipe = {
		{'hades_extramaterials:copper_wire', 'hades_technic:wrought_iron_ingot', 'hades_extramaterials:copper_wire'},
		{'hades_technic:wrought_iron_ingot', '', 'hades_technic:wrought_iron_ingot'},
		{'hades_extramaterials:copper_wire', 'hades_technic:wrought_iron_ingot', 'hades_extramaterials:copper_wire'},
	},
	replacements = {
		{"hades_extramaterials:copper_wire", "hades_extramaterials:empty_spool"},
		{"hades_extramaterials:copper_wire", "hades_extramaterials:empty_spool"},
		{"hades_extramaterials:copper_wire", "hades_extramaterials:empty_spool"},
		{"hades_extramaterials:copper_wire", "hades_extramaterials:empty_spool"}
	},
})

local isolation = mesecons_materials and "mesecons_materials:fiber" or "hades_technic:rubber"

minetest.register_craft({
	output = 'hades_technic:lv_transformer',
	recipe = {
		{isolation,                    'hades_technic:wrought_iron_ingot', isolation},
		{'hades_technic:copper_coil',        'hades_technic:wrought_iron_ingot', 'hades_technic:copper_coil'},
		{'hades_technic:wrought_iron_ingot', 'hades_technic:wrought_iron_ingot', 'hades_technic:wrought_iron_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:mv_transformer',
	recipe = {
		{isolation,                    'hades_technic:carbon_steel_ingot', isolation},
		{'hades_technic:copper_coil',        'hades_technic:carbon_steel_ingot', 'hades_technic:copper_coil'},
		{'hades_technic:carbon_steel_ingot', 'hades_technic:carbon_steel_ingot', 'hades_technic:carbon_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:hv_transformer',
	recipe = {
		{isolation,                       'hades_technic:stainless_steel_ingot', isolation},
		{'hades_technic:copper_coil',           'hades_technic:stainless_steel_ingot', 'hades_technic:copper_coil'},
		{'hades_technic:stainless_steel_ingot', 'hades_technic:stainless_steel_ingot', 'hades_technic:stainless_steel_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:control_logic_unit',
	recipe = {
		{'', 'hades_extramaterials:gold_wire', ''},
		{'hades_core:copper_ingot', 'hades_technic:silicon_wafer', 'hades_core:copper_ingot'},
		{'', 'hades_technic:chromium_ingot', ''},
	},
	replacements = { {"hades_extramaterials:gold_wire", "hades_extramaterials:empty_spool"}, },
})

minetest.register_craft({
	output = 'hades_technic:mixed_metal_ingot 9',
	recipe = {
		{'hades_technic:stainless_steel_ingot', 'hades_technic:stainless_steel_ingot', 'hades_technic:stainless_steel_ingot'},
		{'hades_core:bronze_ingot',          'hades_core:bronze_ingot',          'hades_core:bronze_ingot'},
		{'hades_core:tin_ingot',             'hades_core:tin_ingot',             'hades_core:tin_ingot'},
	}
})

minetest.register_craft({
	output = 'hades_technic:carbon_cloth',
	recipe = {
		{'hades_technic:graphite', 'hades_technic:graphite', 'hades_technic:graphite'}
	}
})

minetest.register_craft({
	output = "hades_technic:machine_casing",
	recipe = {
		{ "hades_technic:cast_iron_ingot", "hades_technic:cast_iron_ingot", "hades_technic:cast_iron_ingot" },
		{ "hades_technic:cast_iron_ingot", "hades_extramaterials:brass_ingot", "hades_technic:cast_iron_ingot" },
		{ "hades_technic:cast_iron_ingot", "hades_technic:cast_iron_ingot", "hades_technic:cast_iron_ingot" },
	},
})

--[[
-- use hades_laboratory medium mixer for it
minetest.register_craft({
	output = "hades_core:dirt 2",
	type = "shapeless",
	replacements = {{"bucket:bucket_water","bucket:bucket_empty"}},
	recipe = {
		"hades_technic:stone_dust",
		"group:leaves",
		"bucket:bucket_water",
		"group:sand",
	},
})
--]]
