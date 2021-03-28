-- The electric generator.
-- A simple device to get started on the electric machines.
-- Inefficient and expensive in fuel (200EU per tick)
-- Also only allows for LV machinery to run.

minetest.register_alias("lv_generator", "hades_technic:lv_generator")

minetest.register_craft({
	output = 'hades_technic:lv_generator',
	recipe = {
		{'hades_core:stone', 'hades_furnaces:furnace',       'hades_core:stone'},
		{'hades_core:stone', 'hades_technic:machine_casing', 'hades_core:stone'},
		{'hades_core:stone', 'hades_technic:lv_cable',       'hades_core:stone'},
	}
})

technic.register_generator({tier="LV", supply=200})

