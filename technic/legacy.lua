
-- Aliases to convert from legacy node/item names

technic.legacy_nodenames = {
	["hades_technic:alloy_furnace"]        = "hades_technic:lv_alloy_furnace",
	["hades_technic:alloy_furnace_active"] = "hades_technic:lv_alloy_furnace_active",
	["hades_technic:battery_box"]  = "hades_technic:lv_battery_box0",
	["hades_technic:battery_box1"] = "hades_technic:lv_battery_box1",
	["hades_technic:battery_box2"] = "hades_technic:lv_battery_box2",
	["hades_technic:battery_box3"] = "hades_technic:lv_battery_box3",
	["hades_technic:battery_box4"] = "hades_technic:lv_battery_box4",
	["hades_technic:battery_box5"] = "hades_technic:lv_battery_box5",
	["hades_technic:battery_box6"] = "hades_technic:lv_battery_box6",
	["hades_technic:battery_box7"] = "hades_technic:lv_battery_box7",
	["hades_technic:battery_box8"] = "hades_technic:lv_battery_box8",
	["hades_technic:electric_furnace"]        = "hades_technic:lv_electric_furnace",
	["hades_technic:electric_furnace_active"] = "hades_technic:lv_electric_furnace_active",
	["hades_technic:grinder"]        = "hades_technic:lv_grinder",
	["hades_technic:grinder_active"] = "hades_technic:lv_grinder_active",
	["hades_technic:extractor"]        = "hades_technic:lv_extractor",
	["hades_technic:extractor_active"] = "hades_technic:lv_extractor_active",
	["hades_technic:compressor"]        = "hades_technic:lv_compressor",
	["hades_technic:compressor_active"] = "hades_technic:lv_compressor_active",
	["hades_technic:hv_battery_box"] = "hades_technic:hv_battery_box0",
	["hades_technic:mv_battery_box"] = "hades_technic:mv_battery_box0",
	["hades_technic:generator"]        = "hades_technic:lv_generator",
	["hades_technic:generator_active"] = "hades_technic:lv_generator_active",
	["hades_technic:iron_dust"] = "hades_technic:wrought_iron_dust",
	["hades_technic:enriched_uranium"] = "hades_technic:uranium35_ingot",
}

for old, new in pairs(technic.legacy_nodenames) do
	minetest.register_alias(old, new)
end

for i = 0, 64 do
	minetest.register_alias("hades_technic:hv_cable"..i, "hades_technic:hv_cable")
	minetest.register_alias("hades_technic:mv_cable"..i, "hades_technic:mv_cable")
	minetest.register_alias("hades_technic:lv_cable"..i, "hades_technic:lv_cable")
end

