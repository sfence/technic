local S = technic.getter

local function set_can_wear(itemstack, level, max_level)
	local temp
	if level == 0 then
		temp = 0
	else
		temp = 65536 - math.floor(level / max_level * 65535)
		if temp > 65535 then temp = 65535 end
		if temp < 1 then temp = 1 end
	end
	itemstack:set_wear(temp)
end

local function get_can_level(itemstack)
	if itemstack:get_metadata() == "" then
		return 0
	else
		return tonumber(itemstack:get_metadata())
	end
end

function technic.register_can(d)
	local data = {}
	for k, v in pairs(d) do data[k] = v end
	minetest.register_tool(data.can_name, {
		description = data.can_description,
		inventory_image = data.can_inventory_image,
		stack_max = 1,
		wear_represents = "content_level",
		liquids_pointable = true,
		on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then return end
			local node = minetest.get_node(pointed_thing.under)
			if node.name ~= data.liquid_source_name then return end
			local charge = get_can_level(itemstack)
			if charge == data.can_capacity then return end
			if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
				minetest.log("action", user:get_player_name().." tried to take "..node.name.." at protected position "..minetest.pos_to_string(pointed_thing.under).." with a "..data.can_name)
				return
			end
			minetest.remove_node(pointed_thing.under)
			charge = charge + 1
			itemstack:set_metadata(tostring(charge))
			set_can_wear(itemstack, charge, data.can_capacity)
			return itemstack
		end,
		on_place = function(itemstack, user, pointed_thing)
			if pointed_thing.type ~= "node" then return end
			local pos = pointed_thing.under
			local node_name = minetest.get_node(pos).name
			local def = minetest.registered_nodes[node_name] or {}
			if def.on_rightclick and user and not user:get_player_control().sneak then
				return def.on_rightclick(pos, minetest.get_node(pos), user, itemstack, pointed_thing)
			end
			if not def.buildable_to or node_name == data.liquid_source_name then
				pos = pointed_thing.above
				node_name = minetest.get_node(pos).name
				def = minetest.registered_nodes[node_name] or {}
				-- Try to place node above the pointed source, or abort.
				if not def.buildable_to or node_name == data.liquid_source_name then return end
			end
			local charge = get_can_level(itemstack)
			if charge == 0 then return end
			if minetest.is_protected(pos, user:get_player_name()) then
				minetest.log("action", user:get_player_name().." tried to place "..data.liquid_source_name.." at protected position "..minetest.pos_to_string(pos).." with a "..data.can_name)
				return
			end
			minetest.set_node(pos, {name=data.liquid_flowing_name})
      minetest.set_node_level(pos, minetest.get_node_max_level(pos));
			charge = charge - 1
			itemstack:set_metadata(tostring(charge))
			set_can_wear(itemstack, charge, data.can_capacity)
			return itemstack
		end,
		on_refill = function(stack)
			stack:set_metadata(tostring(data.can_capacity))
			set_can_wear(stack, data.can_capacity, data.can_capacity)
			return stack
		end,
	})
end

technic.register_can({
	can_name = "hades_technic:water_can",
	can_description = S("Water Can"),
	can_inventory_image = "technic_water_can.png",
	can_capacity = 16,
	liquid_source_name = "hades_core:water_source",
	liquid_flowing_name = "hades_core:water_flowing",
})

minetest.register_craft({
	output = 'hades_technic:water_can 1',
	recipe = {
		{'hades_extraores:titanium_ingot', 'hades_technic:rubber','hades_extraores:titanium_ingot'},
		{'hades_technic:carbon_steel_ingot', '', 'hades_technic:carbon_steel_ingot'},
		{'hades_extraores:titanium_ingot', 'hades_technic:carbon_steel_ingot', 'hades_extraores:titanium_ingot'},
	}
})

technic.register_can({
	can_name = "hades_technic:lava_can",
	can_description = S("Lava Can"),
	can_inventory_image = "technic_lava_can.png",
	can_capacity = 8,
	liquid_source_name = "hades_core:lava_source",
	liquid_flowing_name = "hades_core:lava_flowing",
})

minetest.register_craft({
	output = 'hades_technic:lava_can 1',
	recipe = {
		{'hades_extraores:tungsten_ingot', 'hades_technic:stainless_steel_ingot','hades_extraores:tungsten_ingot'},
		{'hades_technic:stainless_steel_ingot', '', 'hades_technic:stainless_steel_ingot'},
		{'hades_extraores:tungsten_ingot', 'hades_technic:stainless_steel_ingot', 'hades_extraores:tungsten_ingot'},
	}
})

--[[
technic.register_can({
	can_name = 'hades_technic:river_water_can',
	can_description = S("River Water Can"),
	can_inventory_image = "technic_river_water_can.png",
	can_capacity = 16,
	liquid_source_name = "default:river_water_source",
	liquid_flowing_name = "default:river_water_flowing",
})

minetest.register_craft({
	output = 'hades_technic:river_water_can 1',
	recipe = {
		{'hades_technic:zinc_ingot', 'hades_technic:rubber', 'hades_technic:zinc_ingot'},
		{'hades_core:steel_ingot', '', 'hades_core:steel_ingot'},
		{'hades_technic:zinc_ingot', 'hades_core:steel_ingot', 'hades_technic:zinc_ingot'},
	}
})
--]]

