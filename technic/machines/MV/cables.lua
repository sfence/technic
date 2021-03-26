
minetest.register_alias("mv_cable", "hades_technic:mv_cable")

minetest.register_craft({
	output = 'hades_technic:mv_cable 3',
	recipe ={
		{'hades_technic:rubber',   'hades_technic:rubber',   'hades_technic:rubber'},
		{'hades_technic:lv_cable', 'hades_technic:lv_cable', 'hades_technic:lv_cable'},
		{'hades_technic:rubber',   'hades_technic:rubber',   'hades_technic:rubber'},
	}
})

technic.register_cable("MV", 2.5/16)

