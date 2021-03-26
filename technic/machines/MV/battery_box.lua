-- MV Battery box

for key, data in pairs(technic.battery_types) do
  minetest.register_craft({
    output = 'hades_technic:mv_'..data.name..'_battery_box0',
    recipe = {
      {'hades_technic:lv_'..data.name..'_battery_box0', 'hades_technic:lv_'..data.name..'_battery_box0', 'hades_technic:lv_'..data.name..'_battery_box0'},
      {'hades_technic:lv_'..data.name..'_battery_box0', 'hades_technic:mv_transformer',  'hades_technic:lv_'..data.name..'_battery_box0'},
      {'',                        'hades_technic:mv_cable',        ''},
    }
  })

  -- 20 times better then normal battery
  technic.register_battery_box({
    tier           = "MV",
    node_name      = data.name,
    node_desc      = data.desc,
    max_charge     = 20*data.max_charge,
    charge_rate    = 20*data.charge_rate,
    discharge_rate = 20*data.discharge_rate,
    charge_step    = 20*data.charge_step,
    discharge_step = 20*data.discharge_step,
    upgrade        = 1,
    tube           = 1,
  })
end

