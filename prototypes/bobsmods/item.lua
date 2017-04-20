


-- modify module and beacon stats
if bobmods and bobmods.modules and marathomaton.config.rebalance_bobmods then
  -- stuff
  if data.raw.beacon['beacon-2'] ~= nil then
    data.raw.beacon['beacon-2].distribution_effectivity = 0.15
  end
  if data.raw.beacon['beacon-3'] ~= nil then
    data.raw.beacon['beacon-3].distribution_effectivity = 0.075
  end
end

