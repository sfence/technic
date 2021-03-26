minetest.register_craft({
	output = "hades_technic:mv_centrifuge",
	recipe = {
		{"hades_extramaterials:motor",          "hades_technic:copper_plate",   "hades_technic:diamond_drill_head"},
		{"hades_technic:copper_plate",   "hades_technic:machine_casing", "hades_technic:copper_plate"      },
		{"pipeworks:one_way_tube", "hades_technic:mv_cable",       "pipeworks:mese_filter"     },
	}
})

technic.register_centrifuge({
	tier = "MV",
	demand = { 8000, 7000, 6000 },
	speed = 2,
	upgrade = 1,
	tube = 1,
})
