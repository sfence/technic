
local S = technic.getter

technic.register_recipe_type("grinding", { description = S("Grinding") })

function technic.register_grinder_recipe(data)
	data.time = data.time or 3
	technic.register_recipe("grinding", data)
end

local recipes = {
	-- Dusts
	{"hades_core:coal_lump",          "hades_technic:coal_dust 2"},
	{"hades_core:copper_lump",        "hades_technic:copper_dust 2"},
	--{"hades_core:burned_stone",       "default:desert_sand"},
	{"hades_core:gold_lump",          "hades_technic:gold_dust 2"},
	{"hades_core:iron_lump",          "hades_technic:wrought_iron_dust 2"},
	{"hades_core:tin_lump",           "hades_technic:tin_dust 2"},
	{"hades_technic:chromium_lump",      "hades_technic:chromium_dust 2"},
	{"hades_technic:uranium_lump",       "hades_technic:uranium_dust 2"},
	{"hades_technic:zinc_lump",          "hades_technic:zinc_dust 2"},
	{"hades_technic:lead_lump",          "hades_technic:lead_dust 2"},
	{"hades_technic:sulfur_lump",        "hades_technic:sulfur_dust 2"},
	{"hades_core:stone",              "hades_technic:stone_dust"},
	--{"hades_core:fertile_sand",               "hades_technic:stone_dust"},

	-- Other
	{"hades_core:cobble",           "hades_core:gravel"},
	--{"hades_core:gravel",           "hades_core:sand"},
	{"hades_core:sandstone",        "hades_core:fertile_sand 2"}, -- reverse recipe can be found in the compressor
	--{"default:desert_sandstone", "default:desert_sand 2"}, -- reverse recipe can be found in the compressor
	--{"default:silver_sandstone", "default:silver_sand 2"}, -- reverse recipe can be found in the compressor

	--{"default:ice",              "default:snowblock"},
}

-- defuse the sandstone -> 4 sand recipe to avoid infinite sand bugs (also consult the inverse compressor recipe)
minetest.clear_craft({
	recipe = {
		{"hades_core:sandstone"}
	},
})
--[[
minetest.clear_craft({
	recipe = {
		{"default:desert_sandstone"}
	},
})
minetest.clear_craft({
	recipe = {
		{"default:silver_sandstone"}
	},
})
--]]

if minetest.get_modpath("hades_farming") then
	table.insert(recipes, {"hades_farming:seed_wheat 9",   "hades_farming:flour 1"})
end

if minetest.get_modpath("hades_extraores") then
	table.insert(recipes, {"hades_extraores:titan_lump",   "hades_technic:titan_dust 2"})
	table.insert(recipes, {"hades_extraores:silver_lump",    "hades_technic:silver_dust 2"})
end

if minetest.get_modpath("gloopores") or minetest.get_modpath("glooptest") then
	table.insert(recipes, {"gloopores:alatro_lump",   "hades_technic:alatro_dust 2"})
	table.insert(recipes, {"gloopores:kalite_lump",   "hades_technic:kalite_dust 2"})
	table.insert(recipes, {"gloopores:arol_lump",     "hades_technic:arol_dust 2"})
	table.insert(recipes, {"gloopores:talinite_lump", "hades_technic:talinite_dust 2"})
	table.insert(recipes, {"gloopores:akalin_lump",   "hades_technic:akalin_dust 2"})
end

if minetest.get_modpath("homedecor") then
	table.insert(recipes, {"home_decor:brass_ingot", "hades_technic:brass_dust 1"})
end

for _, data in pairs(recipes) do
	technic.register_grinder_recipe({input = {data[1]}, output = data[2]})
end

-- dusts
local function register_dust(name, ingot)
	local lname = string.lower(name)
	lname = string.gsub(lname, ' ', '_')
	minetest.register_craftitem("hades_technic:"..lname.."_dust", {
		description = S("%s Dust"):format(S(name)),
		inventory_image = "technic_"..lname.."_dust.png",
	})
	if ingot then
		minetest.register_craft({
			type = "cooking",
			recipe = "hades_technic:"..lname.."_dust",
			output = ingot,
		})
		technic.register_grinder_recipe({ input = {ingot}, output = "hades_technic:"..lname.."_dust 1" })
	end
end

-- Sorted alphibeticaly
register_dust("Brass",           "hades_extramaterials:brass_ingot")
register_dust("Bronze",          "hades_core:bronze_ingot")
register_dust("Carbon Steel",    "hades_technic:carbon_steel_ingot")
register_dust("Cast Iron",       "hades_technic:cast_iron_ingot")
register_dust("Chernobylite",    "hades_technic:chernobylite_block")
register_dust("Chromium",        "hades_technic:chromium_ingot")
register_dust("Coal",            nil)
register_dust("Copper",          "hades_core:copper_ingot")
register_dust("Lead",            "hades_technic:lead_ingot")
register_dust("Gold",            "hades_core:gold_ingot")
register_dust("Titan",         "hades_extraores:titan_ingot")
register_dust("Silver",          "moreores:silver_ingot")
register_dust("Stainless Steel", "hades_technic:stainless_steel_ingot")
register_dust("Stone",           "hades_core:stone")
register_dust("Sulfur",          nil)
register_dust("Tin",             "hades_core:tin_ingot")
register_dust("Wrought Iron",    "hades_technic:wrought_iron_ingot")
register_dust("Zinc",            "hades_technic:zinc_ingot")
if minetest.get_modpath("gloopores") or minetest.get_modpath("glooptest") then
	register_dust("Akalin",          "glooptest:akalin_ingot")
	register_dust("Alatro",          "glooptest:alatro_ingot")
	register_dust("Arol",            "glooptest:arol_ingot")
	register_dust("Kalite",          nil)
	register_dust("Talinite",        "glooptest:talinite_ingot")
end

for p = 0, 35 do
	local nici = (p ~= 0 and p ~= 7 and p ~= 35) and 1 or nil
	local psuffix = p == 7 and "" or p
	local ingot = "hades_technic:uranium"..psuffix.."_ingot"
	local dust = "hades_technic:uranium"..psuffix.."_dust"
	minetest.register_craftitem(dust, {
		description = S("%s Dust"):format(string.format(S("%.1f%%-Fissile Uranium"), p/10)),
		inventory_image = "technic_uranium_dust.png",
		on_place_on_ground = minetest.craftitem_place_item,
		groups = {uranium_dust=1, not_in_creative_inventory=nici},
	})
	minetest.register_craft({
		type = "cooking",
		recipe = dust,
		output = ingot,
	})
	technic.register_grinder_recipe({ input = {ingot}, output = dust })
end

local function uranium_dust(p)
	return "hades_technic:uranium"..(p == 7 and "" or p).."_dust"
end
for pa = 0, 34 do
	for pb = pa+1, 35 do
		local pc = (pa+pb)/2
		if pc == math.floor(pc) then
			minetest.register_craft({
				type = "shapeless",
				recipe = { uranium_dust(pa), uranium_dust(pb) },
				output = uranium_dust(pc).." 2",
			})
		end
	end
end

minetest.register_craft({
	type = "fuel",
	recipe = "hades_technic:coal_dust",
	burntime = 50,
})

if minetest.get_modpath("gloopores") or minetest.get_modpath("glooptest") then
	minetest.register_craft({
		type = "fuel",
		recipe = "hades_technic:kalite_dust",
		burntime = 37.5,
	})
end
