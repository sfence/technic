if minetest.get_modpath("hades_extraores") then
	minetest.register_craft({
		output = 'technic:mithril_chest 1',
		recipe = {
			{'hades_extraores:titanium_ingot','hades_extraores:titanium_ingot','hades_extraores:titanium_ingot'},
			{'hades_extraores:titanium_ingot','technic:gold_chest','hades_extraores:titanium_ingot'},
			{'hades_extraores:titanium_ingot','hades_extraores:titanium_ingot','hades_extraores:titanium_ingot'},
		}
	})

	minetest.register_craft({
		output = 'technic:mithril_locked_chest 1',
		recipe = {
			{'hades_extraores:titanium_ingot','hades_extraores:titanium_ingot','hades_extraores:titanium_ingot'},
			{'hades_extraores:titanium_ingot','technic:gold_locked_chest','hades_extraores:titanium_ingot'},
			{'hades_extraores:titanium_ingot','hades_extraores:titanium_ingot','hades_extraores:titanium_ingot'},
		}
	})
end

minetest.register_craft({
	output = 'technic:mithril_locked_chest 1',
	type = "shapeless",
	recipe = {
		'hades_extramaterials:padlock',
		'technic:mithril_chest',
	}
})

technic.chests:register("Mithril", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = false,
})

technic.chests:register("Mithril", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = false,
	color = false,
	locked = true,
})

