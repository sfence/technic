-- MV freezer

minetest.register_craft({
	output = 'hades_technic:mv_freezer',
	recipe = {
		{'hades_technic:stainless_steel_ingot', 'hades_technic:motor',          'hades_technic:stainless_steel_ingot'},
		{'pipeworks:pipe_1_empty',        'hades_technic:mv_transformer', 'pipeworks:pipe_1_empty'},
		{'hades_technic:stainless_steel_ingot', 'hades_technic:mv_cable',       'hades_technic:stainless_steel_ingot'},
	}
})

technic.register_freezer({tier = "MV", demand = {800, 600, 400}, speed = 0.5, upgrade = 1, tube = 1})
