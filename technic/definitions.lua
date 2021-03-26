

technic.battery_types = {
  lead = {
    -- 155 Wh/l (Pb-acid)
    -- 140 A shortcut current
    name           = "lead",
    desc           = "Lead",
    max_charge     = 560,
    charge_rate    = 196, -- 14 times better than lithium
    discharge_rate = 784,
    charge_step    = 84,
    discharge_step = 154,
  },
  nickel = {
    -- 300 Wh/l (Ni-Mh)
    -- 60 A shortcut current
    name           = "nickel",
    desc           = "Nickel",
    max_charge     = 1000,
    charge_rate    = 150, -- 6 times better than lithium
    discharge_rate = 600,
    charge_step    = 72,
    discharge_step = 126,
  },
  zinc = {
    -- 1689 Wh/l (zinc-air)
    -- 0.28 A shortcut current
    name           = "zinc",
    desc           = "Zinc",
    max_charge     = 6000,
    charge_rate    = 0, -- mechanical recharging
    discharge_rate = 168, -- 3.57 times worse than lithium
    charge_step    = 20,
    discharge_step = 34,
  },
  lithium = {
    -- 2800 Wh/l (lithium-air teoretic prediction up to 10*730 Wh/l)
    -- 1 A shortcut current (estimated from ration beetween shortcut current zinc-cabrob, zinc-air battery, base lithium-ion 11.25 A shhotcut current)
    name           = "lithium",
    desc           = "Lithium",
    max_charge     = 10000,
    charge_rate    = 250,
    discharge_rate = 1000,
    charge_step    = 120,
    discharge_step = 200,
  },
};

