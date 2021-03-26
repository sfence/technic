-- LV Alloy furnace

-- FIXME: kpoppel: I'd like to introduce an induction heating element here...
minetest.register_craft({
	output = 'hades_technic:lv_alloy_furnace',
	recipe = {
		{'hades_core:brick', 'hades_core:brick',          'hades_core:brick'},
		{'hades_core:brick', 'hades_technic:machine_casing', 'hades_core:brick'},
		{'hades_core:brick', 'hades_technic:lv_cable',       'hades_core:brick'},
	}
})

technic.register_alloy_furnace({tier = "LV", speed = 1, demand = {300}})

