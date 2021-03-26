
minetest.register_alias("lv_cable", "hades_technic:lv_cable")

minetest.register_craft({
	output = 'hades_technic:lv_cable 6',
	recipe = {
		{'hades_core:paper',        'hades_core:paper',        'hades_core:paper'},
		{'hades_core:copper_ingot', 'hades_core:copper_ingot', 'hades_core:copper_ingot'},
		{'hades_core:paper',        'hades_core:paper',        'hades_core:paper'},
	}
})

technic.register_cable("LV", 2/16)

