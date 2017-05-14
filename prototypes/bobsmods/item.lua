
-- bob modules override (why so op???)
    -- vanilla beacons are 50% effective and a good setup feeds 8 (4 per row up & down) beacons per machine, for a total of 4 + (.5 * 8 * 2) = 12 effective modules.
    -- ordinary bob beacons are 100% effective and can easily feed 32 (8 per row and 2 rows up, 2 rows down per double row of machines) beacons per machine, 
    -- for a total of 6 + (1.0 * 32 * 6) = a bajillion effective modules.
    -- we will change this to 6 + (0.1 * 32 * 6) = 6 + 19.2 effective modules (already plenty!!)
    -- similarly for beacon mk2 which can feed (6 * 3, 2 rows per double row) 18 beacons per machine and 4 slots, 20% efficiency is recommended
    -- 0.5 * 8 = 4, 0.2 * 18 = 3.6, 0.1 * 32 = 3.2
    -- made up by # of module slots (2, 4, 6), resulting in effectivley 
    -- 0.5 * 8 * 2 = 8, 0.2 * 18 * 4 = 14.4, 0.1 * 32 * 6 = 19.2
    -- can try the scaling:
    -- 0.5 * 8 * 2 = 8, 0.15 * 18 * 4 = 10.8, 0.075 * 32 * 6 = 14.4
    -- with heavy beacon placement this goes up to:
    -- 0.5 * 8 * 2 = 8, 0.15 * (6 * 4) * 4 = 14.4, 0.075 * ( 8 * 6 ) * 6 = 21.6

    -- vanilla: speed +0.5, consumption +0.7; efficienty -0.5; prod +0.1, poll +0.1, speed -0.15, consumption +.8
    -- plan: 
    -- speed      : speed +0.4, energy +0.8 
    -- efficiency : energy -0.8
    -- prod       : prod +0.1, pollution +0.4, speed -0.24, energy +0.8
    -- pollution  : polllution -0.4
    -- pollution  : pollution +2.0
    -- raw speed  : speed +0.4, energy +0.4
    -- green      : energy -0.8, poll -0.2
    -- pure prod  : prod +0.1, speed -0.12, energy +0.4, poll +0.2
    -- recipe costs:
    -- 5x costs, 2x time for all module components - DONE
    -- 2x inputs (not upgrade!!) for beacon - DONE
    -- merged modules: raw speed needs 2x speed, green needs 2x green, - DONE
    -- raw prod needs 4x prod, 3x green, 2x poll, 1x speed - DONE
    -- disable non-merge recipe for merged modules
    -- make merged modules require the previous merged module ... ?
    -- fix angels refinery building not having enough mod slots
    -- fix module parts recipes not being consistent - DONE

    -- bobmods.modules.ProductivityHasSpeed = true

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


if bobmods and bobmods.modules and settings.startup["marathomaton_rebalance_bobmodules"].value == true then
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

-- also fix underground belt length to be basically vanilla length
if bobmods then
  local dat = data.raw['underground-belt']
  if dat == nil then
    dat = {}
  end
  for idx, name in ipairs({'underground-belt', 'fast-underground-belt', 'express-underground-belt', 'green-underground-belt', 'purple-underground-belt'}) do
    if dat[name] then
      dat[name].max_distance = idx * 2 + 3
    end
  end
end

  



