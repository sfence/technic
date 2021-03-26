-- LV Battery box

for key, data in pairs(technic.battery_types) do
  minetest.register_craft({
    output = 'hades_technic:lv_'..data.name..'_battery_box0',
    recipe = {
      {'group:wood',      'group:wood',             'group:wood'},
      {'hades_technic:battery_'..data.name, 'hades_technic:machine_casing', 'hades_technic:battery_'..data.name},
      {'hades_technic:battery_'..data.name, 'hades_technic:lv_cable',       'hades_technic:battery_'..data.name},
    }
  })
  
  -- 4 times better then normal battery
  technic.register_battery_box({
    tier           = "LV",
    node_name      = data.name,
    node_desc      = data.desc,
    max_charge     = 4*data.max_charge,
    charge_rate    = 4*data.charge_rate,
    discharge_rate = 4*data.discharge_rate,
    charge_step    = 4*data.charge_step,
    discharge_step = 4*data.discharge_step,
  })
end

