
minetest.register_alias("compressor", "hades_technic:lv_compressor")

minetest.register_craft({
	output = 'hades_technic:lv_compressor',
	recipe = {
		{'hades_core:stone',            'hades_extramaterials:motor',          'hades_core:stone'},
		{'mesecons:piston',          'hades_technic:machine_casing', 'mesecons:piston'},
		{'hades_extramaterials:silver_wire', 'hades_technic:lv_cable',       'hades_extramaterials:silver_wire'},
	},
	replacements = {
		{"hades_extramaterials:silver_wire", "hades_extramaterials:empty_spool"},
		{"hades_extramaterials:silver_wire", "hades_extramaterials:empty_spool"}
	},
})

technic.register_compressor({tier = "LV", demand = {300}, speed = 1})
