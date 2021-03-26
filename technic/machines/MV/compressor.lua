-- MV compressor

minetest.register_craft({
	output = 'hades_technic:mv_compressor',
	recipe = {
		{'hades_technic:stainless_steel_ingot', 'hades_technic:lv_compressor',  'hades_technic:stainless_steel_ingot'},
		{'pipeworks:tube_1',              'hades_technic:mv_transformer', 'pipeworks:tube_1'},
		{'hades_technic:stainless_steel_ingot', 'hades_technic:mv_cable',       'hades_technic:stainless_steel_ingot'},
	}
})

technic.register_compressor({tier = "MV", demand = {800, 600, 400}, speed = 2, upgrade = 1, tube = 1})
