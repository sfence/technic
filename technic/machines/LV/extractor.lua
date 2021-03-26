
minetest.register_alias("extractor", "hades_technic:lv_extractor")

minetest.register_craft({
	output = 'hades_technic:lv_extractor',
	recipe = {
		{'hades_technic:treetap', 'hades_extramaterials:motor',          'hades_technic:treetap'},
		{'hades_technic:treetap', 'hades_technic:machine_casing', 'hades_technic:treetap'},
		{'',                'hades_technic:lv_cable',       ''},
	}
})

technic.register_extractor({tier = "LV", demand = {300}, speed = 1})
