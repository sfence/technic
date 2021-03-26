-- MV alloy furnace

minetest.register_craft({
	output = 'hades_technic:mv_alloy_furnace',
	recipe = {
		{'hades_technic:stainless_steel_ingot', 'hades_technic:lv_alloy_furnace', 'hades_technic:stainless_steel_ingot'},
		{'pipeworks:tube_1',              'hades_technic:mv_transformer',   'pipeworks:tube_1'},
		{'hades_technic:stainless_steel_ingot', 'hades_technic:mv_cable',         'hades_technic:stainless_steel_ingot'},
	}
})


technic.register_alloy_furnace({tier = "MV", speed = 1.5, upgrade = 1, tube = 1, demand = {3000, 2000, 1000}})

