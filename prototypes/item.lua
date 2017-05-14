
local AMF = marathomaton.adjust_multiplier_factor

-- all fuel is 50% as efficient
local fuel_value_multiplier = AMF(0.5)

for item_name, item_props in pairs(data.raw.item) do
  if item_props['fuel_value'] ~= nil then
    item_props['fuel_value'] = marathomaton.unit_multiply(fuel_value_multiplier, item_props['fuel_value'])
  end
end

-- double stack size for pipe (since it's used heavily in boiler+engine)
-- might as well do it for all pipes, for consistency

for item_name, item_props in pairs(data.raw.item) do
  if item_props.subgroup == 'pipe' then
    item_props.stack_size = item_props.stack_size * 2
  end
end
