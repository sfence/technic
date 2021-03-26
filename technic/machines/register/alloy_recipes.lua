
local S = technic.getter

technic.register_recipe_type("alloy", {
	description = S("Alloying"),
	input_size = 2,
})

function technic.register_alloy_recipe(data)
	data.time = data.time or 6
	technic.register_recipe("alloy", data)
end

local recipes = {
	{"hades_technic:copper_dust 7",         "hades_technic:tin_dust",           "hades_technic:bronze_dust 8", 12},
	{"hades_core:copper_ingot 7",        "hades_core:tin_ingot",          "default:bronze_ingot 8", 12},
	{"hades_technic:wrought_iron_dust 2",   "hades_technic:coal_dust",          "hades_technic:carbon_steel_dust 2", 6},
	{"hades_technic:wrought_iron_ingot 2",  "hades_technic:coal_dust",          "hades_technic:carbon_steel_ingot 2", 6},
	{"hades_technic:carbon_steel_dust 2",   "hades_technic:coal_dust",          "hades_technic:cast_iron_dust 2", 6},
	{"hades_technic:carbon_steel_ingot 2",  "hades_technic:coal_dust",          "hades_technic:cast_iron_ingot 2", 6},
	{"hades_technic:carbon_steel_dust 4",   "hades_technic:chromium_dust",      "hades_technic:stainless_steel_dust 5", 7.5},
	{"hades_technic:carbon_steel_ingot 4",  "hades_technic:chromium_ingot",     "hades_technic:stainless_steel_ingot 5", 7.5},
	{"hades_technic:copper_dust 2",         "hades_technic:zinc_dust",          "hades_technic:brass_dust 3"},
	{"hades_core:copper_ingot 2",        "hades_technic:zinc_ingot",         "hades_extramaterials:brass_ingot 3"},
	{"default:sand 2",                "hades_technic:coal_dust 2",        "hades_technic:silicon_wafer"},
	{"hades_technic:silicon_wafer",         "hades_technic:gold_dust",          "hades_technic:doped_silicon_wafer"},
	-- from https://en.wikipedia.org/wiki/Carbon_black
	-- The highest volume use of carbon black is as a reinforcing filler in rubber products, especially tires.
	-- "[Compounding a] pure gum vulcanizate … with 50% of its weight of carbon black improves its tensile strength and wear resistance …"
	{"hades_technic:raw_latex 4",           "hades_technic:coal_dust 2",        "hades_technic:rubber 6", 2},
	{"default:ice", 		  "bucket:bucket_empty",        "bucket:bucket_water", 1 },
}

for _, data in pairs(recipes) do
	technic.register_alloy_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
end
