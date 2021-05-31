minetest.register_craft({
	output = 'technic:copper_chest 1',
	recipe = {
		{'hades_core:copper_ingot','hades_core:copper_ingot','hades_core:copper_ingot'},
		{'hades_core:copper_ingot','technic:iron_chest','hades_core:copper_ingot'},
		{'hades_core:copper_ingot','hades_core:copper_ingot','hades_core:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:copper_locked_chest 1',
	recipe = {
		{'hades_core:copper_ingot','hades_core:copper_ingot','hades_core:copper_ingot'},
		{'hades_core:copper_ingot','technic:iron_locked_chest','hades_core:copper_ingot'},
		{'hades_core:copper_ingot','hades_core:copper_ingot','hades_core:copper_ingot'},
	}
})

minetest.register_craft({
	output = 'technic:copper_locked_chest 1',
	type = "shapeless",
	recipe = {
		'hades_extramaterials:padlock',
		'technic:copper_chest',
	}
})

technic.chests:register("Copper", {
	width = 12,
	height = 5,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = false,
})

technic.chests:register("Copper", {
	width = 12,
	height = 5,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = true,
})

