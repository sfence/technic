
minetest.register_craft({
	output = 'hades_technic:hv_cable 3',
	recipe = {
		{'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting'},
		{'hades_technic:mv_cable',           'hades_technic:mv_cable',           'hades_technic:mv_cable'},
		{'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting', 'homedecor:plastic_sheeting'},
	}
})

technic.register_cable("HV", 3/16)

