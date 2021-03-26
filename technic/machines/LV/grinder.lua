
minetest.register_alias("grinder", "hades_technic:lv_grinder")
minetest.register_craft({
	output = 'hades_technic:lv_grinder',
	recipe = {
		{'default:desert_stone', 'default:diamond',        'default:desert_stone'},
		{'default:desert_stone', 'hades_technic:machine_casing', 'default:desert_stone'},
		{'hades_technic:granite',      'hades_technic:lv_cable',       'hades_technic:granite'},
	}
})

technic.register_grinder({tier="LV", demand={200}, speed=1})

