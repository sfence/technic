minetest.register_alias("hv_generator", "hades_technic:hv_generator")

minetest.register_craft({
	output = 'hades_technic:hv_generator',
	recipe = {
		{'hades_technic:carbon_plate',          'hades_technic:mv_generator',   'hades_technic:composite_plate'},
		{'pipeworks:tube_1',              'hades_technic:hv_transformer', 'pipeworks:tube_1'},
		{'hades_technic:stainless_steel_ingot', 'hades_technic:hv_cable',       'hades_technic:stainless_steel_ingot'},
	}
})

technic.register_generator({tier="HV", tube=1, supply=1200})

