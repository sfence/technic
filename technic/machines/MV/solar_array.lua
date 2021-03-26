
minetest.register_craft({
	output = 'hades_technic:solar_array_mv 1',
	recipe = {
		{'hades_technic:solar_array_lv',     'hades_technic:solar_array_lv', 'hades_technic:solar_array_lv'},
		{'hades_technic:carbon_steel_ingot', 'hades_technic:mv_transformer', 'hades_technic:carbon_steel_ingot'},
		{'',                           'hades_technic:mv_cable',       ''},
	}
})

technic.register_solar_array({tier="MV", power=30})

-- compatibility alias for upgrading from old versions of technic
minetest.register_alias("hades_technic:solar_panel_mv", "hades_technic:solar_array_mv")
