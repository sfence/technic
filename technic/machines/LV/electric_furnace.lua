-- LV Electric Furnace
-- This is a faster version of the stone furnace which runs on EUs

-- FIXME: kpoppel I'd like to introduce an induction heating element here also
minetest.register_craft({
	output = 'hades_technic:electric_furnace',
	recipe = {
		{'hades_core:cobble', 'hades_core:cobble',         'hades_core:cobble'},
		{'hades_core:cobble', 'hades_technic:machine_casing', 'hades_core:cobble'},
		{'hades_core:cobble', 'hades_technic:lv_cable',       'hades_core:cobble'},
	}
})

technic.register_electric_furnace({tier="LV", demand={300}, speed = 2})


