-- HV battery box

for key, data in pairs(technic.battery_types) do
  minetest.register_craft({
    output = 'hades_technic:hv_'..data.name..'_battery_box0',
    recipe = {
      {'hades_technic:mv_'..data.name..'_battery_box0', 'hades_technic:mv_'..data.name..'_battery_box0', 'hades_technic:mv_'..data.name..'_battery_box0'},
      {'hades_technic:mv_'..data.name..'_battery_box0', 'hades_technic:hv_transformer',  'hades_technic:mv_'..data.name..'_battery_box0'},
      {'',                        'hades_technic:hv_cable',        ''},
    }
  })
  
  -- 100 times better then normal battery
  technic.register_battery_box({
    tier           = "HV",
    node_name      = data.name,
    node_desc      = data.desc,
    max_charge     = 100*data.max_charge,
    charge_rate    = 100*data.charge_rate,
    discharge_rate = 100*data.discharge_rate,
    charge_step    = 100*data.charge_step,
    discharge_step = 100*data.discharge_step,
    upgrade        = 1,
    tube           = 1,
  })
end

