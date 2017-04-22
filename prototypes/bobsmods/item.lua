


-- modify module and beacon stats
    -- v8 modules :
    -- speed      : speed +0.4, energy +0.8 
    -- efficiency : energy -0.8
    -- prod       : prod +0.1, pollution +0.4, speed -0.24, energy +0.8
    -- pollution  : polllution -0.4
    -- pollution  : pollution +2.0
    -- raw speed  : speed +0.4, energy +0.4
    -- green      : energy -0.8, poll -0.2
    -- pure prod  : prod +0.1, speed -0.12, energy +0.4, poll +0.2

local effects_per_tier = {
  ["speed-module"]={
    ["consumption"]=0.1,
    ["speed"]=0.05
  },
  ["effectivity-module"]={
    ["consumption"]=-0.1
  },
  ["productivity-module"]={
    ["consumption"]=0.1,
    ["pollution"]=0.05,
    ["productivity"]=0.0125,
    ["speed"]=-0.03
  },
  ["pollution-clean-module"]={
    ["pollution"]=-0.05
  },
  ["pollution-create-module"]={
    ["pollution"]=0.25
  },
  ["raw-speed-module"]={
    ["speed"]=0.05,
    ["consumption"]=0.05
  },
  ["green-module"]={
    ["consumption"]=-0.1,
    ["pollution"]=-0.025
  },
  ["raw-productivity-module"]={
    ["consumption"]=0.05,
    ["pollution"]=0.025,
    ["productivity"]=0.0125,
    ["speed"]=-0.015
  }
}


if bobmods and bobmods.modules and marathomaton.config.rebalance_bobmods then
  -- either mk2: 0.15, mk3: 0.075
  -- or mk2: 0.2, mk3 : 0.1 ( this is still a little overpowered especially at 3:1 beacon:machine ratio tiling
  -- stuff
  if data.raw.beacon['beacon-2'] ~= nil then
    data.raw.beacon['beacon-2'].distribution_effectivity = 0.15
  end
  if data.raw.beacon['beacon-3'] ~= nil then
    data.raw.beacon['beacon-3'].distribution_effectivity = 0.075
  end

  for module_name, module_obj in pairs(data.raw.module) do
    if module_obj.subgroup and effects_per_tier[module_obj.subgroup] ~= nil then
      module_obj.effect = {}
      for effect_name, value in pairs(effects_per_tier[module_obj.subgroup]) do
        if effect_name ~= nil and value ~= nil and module_obj.tier ~= nil then
          module_obj.effect[effect_name] = { bonus=module_obj.tier * value }
        end
      end
    end
  end
end
