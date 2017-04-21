


-- modify module and beacon stats
if bobmods and bobmods.modules and marathomaton.config.rebalance_bobmods then
  -- stuff
  if data.raw.beacon['beacon-2'] ~= nil then
    data.raw.beacon['beacon-2'].distribution_effectivity = 0.15
  end
  if data.raw.beacon['beacon-3'] ~= nil then
    data.raw.beacon['beacon-3'].distribution_effectivity = 0.075
  end


    -- plan: 
    -- speed      : speed +0.4, energy +0.8 
    -- efficiency : energy -0.8
    -- prod       : prod +0.1, pollution +0.4, speed -0.24, energy +0.8
    -- pollution  : polllution -0.4
    -- pollution  : pollution +2.0
    -- raw speed  : speed +0.4, energy +0.4
    -- green      : energy -0.8, poll -0.2
    -- pure prod  : prod +0.1, speed -0.12, energy +0.4, poll +0.2


end
