-- The high voltage solar array is an assembly of medium voltage arrays.
-- Solar arrays are not able to store large amounts of energy.

minetest.register_craft({
	output = 'hades_technic:solar_array_hv 1',
	recipe = {
		{'hades_technic:solar_array_mv',     'hades_technic:solar_array_mv', 'hades_technic:solar_array_mv'},
		{'hades_technic:carbon_plate',       'hades_technic:hv_transformer', 'hades_technic:composite_plate'},
		{'',                           'hades_technic:hv_cable',       ''},
	}
})

technic.register_solar_array({tier="HV", power=100})

