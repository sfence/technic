
local material_list
if minetest.get_modpath("moreores") then
	material_list = { 'silver' }
else
	-- Make the gold chest obtainable for mere mortals (the silver chest is not obtainable)
	material_list = { 'copper', 'silver' }
end

for _, material in ipairs(material_list) do
	minetest.register_craft({
		output = 'technic:gold_chest',
		recipe = {
			{'hades_core:gold_ingot','hades_core:gold_ingot','hades_core:gold_ingot'},
			{'hades_core:gold_ingot',"technic:"..material.."_chest",'hades_core:gold_ingot'},
			{'hades_core:gold_ingot','hades_core:gold_ingot','hades_core:gold_ingot'},
		}
	})

	minetest.register_craft({
		output = 'technic:gold_locked_chest',
		recipe = {
			{'hades_core:gold_ingot','hades_core:gold_ingot','hades_core:gold_ingot'},
			{'hades_core:gold_ingot',"technic:"..material.."_locked_chest",'hades_core:gold_ingot'},
			{'hades_core:gold_ingot','hades_core:gold_ingot','hades_core:gold_ingot'},
		}
	})
end

minetest.register_craft({
	output = 'technic:gold_locked_chest',
	type = "shapeless",
	recipe = {
		'hades_extramaterials:padlock',
		'technic:gold_chest',
	}
})

technic.chests:register("Gold", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = false,
})

technic.chests:register("Gold", {
	width = 15,
	height = 6,
	sort = true,
	autosort = true,
	infotext = true,
	color = true,
	locked = true,
})

