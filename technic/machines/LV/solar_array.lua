-- The solar array is an assembly of panels into a powerful array
-- The assembly can deliver more energy than the individual panel because
-- of the transformer unit which converts the panel output variations into
-- a stable supply.
-- Solar arrays are not able to store large amounts of energy.
-- The LV arrays are used to make medium voltage arrays.

minetest.register_craft({
	output = 'hades_technic:solar_array_lv 1',
	recipe = {
		{'hades_technic:solar_panel',        'hades_technic:solar_panel',    'hades_technic:solar_panel'},
		{'hades_technic:carbon_steel_ingot', 'hades_technic:lv_transformer', 'hades_technic:carbon_steel_ingot'},
		{'',                           'hades_technic:lv_cable',       ''},
	}
})

technic.register_solar_array({tier="LV", power=10})

