-- MV grinder

minetest.register_craft({
	output = 'hades_technic:mv_grinder',
	recipe = {
		{'hades_technic:stainless_steel_ingot', 'hades_technic:lv_grinder',     'hades_technic:stainless_steel_ingot'},
		{'pipeworks:tube_1',              'hades_technic:mv_transformer', 'pipeworks:tube_1'},
		{'hades_technic:stainless_steel_ingot', 'hades_technic:mv_cable',       'hades_technic:stainless_steel_ingot'},
	}
})

technic.register_grinder({tier="MV", demand={600, 450, 300}, speed=2, upgrade=1, tube=1})

