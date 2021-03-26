minetest.register_alias("generator_mv", "hades_technic:generator_mv")

minetest.register_craft({
	output = 'hades_technic:mv_generator',
	recipe = {
		{'hades_technic:stainless_steel_ingot', 'hades_technic:lv_generator',   'hades_technic:stainless_steel_ingot'},
		{'pipeworks:tube_1',              'hades_technic:mv_transformer', 'pipeworks:tube_1'},
		{'hades_technic:stainless_steel_ingot', 'hades_technic:mv_cable',       'hades_technic:stainless_steel_ingot'},
	}
})

technic.register_generator({tier="MV", tube=1, supply=600})

