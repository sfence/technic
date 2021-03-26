
local S = technic.worldgen.gettext

minetest.register_craftitem(":hades_technic:uranium_lump", {
	description = S("Uranium Lump"),
	inventory_image = "technic_uranium_lump.png",
})
minetest.register_alias("hades_technic:uranium", "hades_technic:uranium_lump")

minetest.register_craftitem(":hades_technic:uranium_ingot", {
	description = S("Uranium Ingot"),
	inventory_image = "technic_uranium_ingot.png",
	groups = {uranium_ingot=1},
})

minetest.register_craftitem(":hades_technic:chromium_lump", {
	description = S("Chromium Lump"),
	inventory_image = "technic_chromium_lump.png",
})

minetest.register_craftitem(":hades_technic:chromium_ingot", {
	description = S("Chromium Ingot"),
	inventory_image = "technic_chromium_ingot.png",
})

minetest.register_craftitem(":hades_technic:zinc_lump", {
	description = S("Zinc Lump"),
	inventory_image = "technic_zinc_lump.png",
})

minetest.register_craftitem(":hades_technic:zinc_ingot", {
	description = S("Zinc Ingot"),
	inventory_image = "technic_zinc_ingot.png",
})

minetest.register_craftitem(":hades_technic:lead_lump", {
	description = S("Lead Lump"),
	inventory_image = "technic_lead_lump.png",
})

minetest.register_craftitem(":hades_technic:lead_ingot", {
	description = S("Lead Ingot"),
	inventory_image = "technic_lead_ingot.png",
})

minetest.register_craftitem(":hades_technic:sulfur_lump", {
	description = S("Sulfur Lump"),
	inventory_image = "technic_sulfur_lump.png",
})

minetest.register_alias("hades_technic:wrought_iron_ingot", "hades_core:steel_ingot")

minetest.override_item("hades_core:steel_ingot", {
	description = S("Wrought Iron Ingot"),
	inventory_image = "technic_wrought_iron_ingot.png",
})

minetest.register_craftitem(":hades_technic:cast_iron_ingot", {
	description = S("Cast Iron Ingot"),
	inventory_image = "technic_cast_iron_ingot.png",
})

minetest.register_craftitem(":hades_technic:carbon_steel_ingot", {
	description = S("Carbon Steel Ingot"),
	inventory_image = "technic_carbon_steel_ingot.png",
})

minetest.register_craftitem(":hades_technic:stainless_steel_ingot", {
	description = S("Stainless Steel Ingot"),
	inventory_image = "technic_stainless_steel_ingot.png",
})

local function register_block(block, ingot)
	minetest.register_craft({
		output = block,
		recipe = {
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
			{ingot, ingot, ingot},
		}
	})

	minetest.register_craft({
		output = ingot.." 9",
		recipe = {
			{block}
		}
	})
end

register_block("hades_technic:uranium_block", "hades_technic:uranium_ingot")
register_block("hades_technic:chromium_block", "hades_technic:chromium_ingot")
register_block("hades_technic:zinc_block", "hades_technic:zinc_ingot")
register_block("hades_technic:lead_block", "hades_technic:lead_ingot")
register_block("hades_technic:cast_iron_block", "hades_technic:cast_iron_ingot")
register_block("hades_technic:carbon_steel_block", "hades_technic:carbon_steel_ingot")
register_block("hades_technic:stainless_steel_block", "hades_technic:stainless_steel_ingot")

minetest.register_craft({
	type = 'cooking',
	recipe = "hades_technic:zinc_lump",
	output = "hades_technic:zinc_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "hades_technic:chromium_lump",
	output = "hades_technic:chromium_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "hades_technic:uranium_lump",
	output = "hades_technic:uranium_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "hades_technic:lead_lump",
	output = "hades_technic:lead_ingot",
})


minetest.register_craft({
	type = 'cooking',
	recipe = minetest.registered_aliases["hades_technic:wrought_iron_ingot"],
	output = "hades_technic:cast_iron_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "hades_technic:cast_iron_ingot",
	cooktime = 2,
	output = "hades_technic:wrought_iron_ingot",
})

minetest.register_craft({
	type = 'cooking',
	recipe = "hades_technic:carbon_steel_ingot",
	cooktime = 2,
	output = "hades_technic:wrought_iron_ingot",
})

local function for_each_registered_item(action)
	local already_reg = {}
	for k, _ in pairs(minetest.registered_items) do
		table.insert(already_reg, k)
	end
	local really_register_craftitem = minetest.register_craftitem
	minetest.register_craftitem = function(name, def)
		really_register_craftitem(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_tool = minetest.register_tool
	minetest.register_tool = function(name, def)
		really_register_tool(name, def)
		action(string.gsub(name, "^:", ""))
	end
	local really_register_node = minetest.register_node
	minetest.register_node = function(name, def)
		really_register_node(name, def)
		action(string.gsub(name, "^:", ""))
	end
	for _, name in ipairs(already_reg) do
		action(name)
	end
end

local steel_to_iron = {}
for _, i in ipairs({
	"hades_core:axe_steel",
	"hades_core:pick_steel",
	"hades_core:shovel_steel",
	"hades_core:sword_steel",
	"doors:door_steel",
	"hades_farming:hoe_steel",
	"glooptest:hammer_steel",
	"glooptest:handsaw_steel",
	"glooptest:reinforced_crystal_glass",
	"mesecons_doors:op_door_steel",
	"mesecons_doors:sig_door_steel",
	"vessels:steel_bottle",
}) do
	steel_to_iron[i] = true
end

for_each_registered_item(function(item_name)
	local item_def = minetest.registered_items[item_name]
	if steel_to_iron[item_name] and string.find(item_def.description, "Steel") then
		minetest.override_item(item_name, { description = string.gsub(item_def.description, "Steel", S("Iron")) })
	end
end)
