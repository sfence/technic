
minetest.register_alias("grinder", "hades_technic:lv_grinder")
minetest.register_craft({
	output = 'hades_technic:lv_grinder',
	recipe = {
		{'hades_core:stone_baked', 'hades_core:diamond',        'hades_core:stone_baked'},
		{'hades_core:stone_baked', 'hades_technic:machine_casing', 'hades_core:stone_baked'},
		{'hades_technic:granite',      'hades_technic:lv_cable',       'hades_technic:granite'},
	}
})

technic.register_grinder({tier="LV", demand={200}, speed=1})

