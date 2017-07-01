local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply
local AMF = marathomaton.adjust_multiplier_factor

local function keys_array(dict)
  to_ret = {}
  for key, val in pairs(dict) do
    if val then
      table.insert(to_ret, key)
    end
  end
  return to_ret
end

local expansion_rate = { 2.5,2.5,2.5,3.0,3.0,3.5,4.0,4.0,4.5,5.0,5.0,5.0,6.0,6.0,6.0,7.0,7.0,7.5,8.0,8.0, 9.0, 9.0}
local ingot_expansion_rate = {}
for i, rate in ipairs(expansion_rate) do
  if i > 3 then
    ingot_expansion_rate[i-3] = rate * 5.0 / 3.0 - 3.5 + 1.0 / 6
  end 
end
local stack_rate     = { 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0, 5.0 }

local function explode_all(_items, _expansion_rate)
  if _expansion_rate == nil then
    _expansion_rate = expansion_rate
  end
  local expansion_rate = _expansion_rate
  -- prune _items set for nonexistent items
  for item, _ in pairs(_items) do
    if not data.raw.item[item] then
      _items[item] = false
    end
  end
  local items = keys_array(_items)
  -- sort by [item].order and use increasing expansion rate (2.5, 2.5, 3, 3, ..)
  table.sort(items, function(a,b) return data.raw.item[a].order < data.raw.item[b].order end)
  -- log(serpent.block(items))
  for i, item in ipairs(items) do
    local exp_rate = expansion_rate[i]
    if exp_rate == nil then
      exp_rate = 10.0
    end
    -- change every recipe that produces this item to now produce multipler times more of the item,
    -- and if the result is not an integer, multiply each ingredient, time, result of the recipe to compensate
    log('exploding ' .. item .. ' at rate ' .. exp_rate)
    marathomaton.modify_all_yields(exp_rate, item)
    -- now make everything that uses this item consume multiplier times more
    marathomaton.modify_all_recipes(item, exp_rate, true)
    -- also increase the stack size
--    data.raw.item[item].stack_size = data.raw.item[item].stack_size * stack_rate[i]
    -- also decrease the fuel yield
    local s = data.raw.item[item].fuel_value
    if s ~= nil then
      n = 0 + string.sub(s, 1, #s-2)
      s = (n / AMF(exp_rate)) .. string.sub(s, #s - 1, #s)
      data.raw.item[item].fuel_value = s
    end
  end
end

-- dont ignore cheaper steel setting - just use our multiplier
-- also increase smelting machine costs?? no

-- slow down all smelting recipes by 2x -- already done in ../recipe.lua
-- other smelting categories
local smelting = {
  ['mixing-furnace']    =1.5, -- affects alloy plates
  ['chemical-furnace']  =2.0, -- chemical plates and powders
  ['blast-smelting']    =2.5, -- making angel ingot from any
  ['powder-mixing']     =2.5, -- aluminum/glass/cement T1 smelting and tungsten powder
  ['induction-smelting']=3.0, -- making angel molten
  ['casting']           =3.5, -- making angel plates and wire coil
  ['ore-processing']    =4.0, -- making angel processed from ore
  ['pellet-pressing']   =5.0, -- making angel pellet from processed
  ['liquifying']        =6.0, -- making chemical liquid angel stuffs
  ['chemical-smelting'] =6.0, -- making chemical solid angel stuffs
--  ['advanced-crafting'] =80.0, -- making angels wires/plates out of coil -- unfortunately this also affects engine unit so must be dsiabled for now
  ['strand-casting']    =9.0, -- making angels sheet coil out of molten
  ['ore-sorting']       =1.2, -- sorting crushed, chunks, crystals, or pure
  ['ore-sorting-t1']    =1.5, -- ore to crushed
  ['ore-sorting-t2']    =2.0, -- crushed to chunks
  ['ore-sorting-t3']    =2.25,-- chunks to crystals
  ['ore-sorting-t4']    =2.5, -- crystals to pure
}

marathomaton.slowdown_recipe_category(smelting)

-- create smelting bottlenecks for all these plate types: (no iron or copper here)
local plates_list = subgroup2items({'bob-material'})
-- log('MARATHOMATON plates_list ' .. serpent.block(plates_list))
-- hardcode these for now until bob adds them to bob-material
plates_list['angels-plate-chrome'] = true
plates_list['angels-plate-manganese'] = true
plates_list['angels-plate-platinum'] = true
plates_list['cobalt-plate'] = true
plates_list['iron-plate'] = false -- these guys were handled already in vanilla
plates_list['copper-plate'] = false
plates_list['steel-plate'] = false

-- find all the angel ingots and explode them too
-- they are inputs to recipes in the category "induction-smelting"
local ingots_set = {}
for recipe_name, recipe_obj in pairs(data.raw.recipe) do
  recipe_obj = recipe_obj['expensive']
  if recipe_obj.category == "induction-smelting" then
    for _, ingredient_obj in ipairs(recipe_obj.ingredients) do
      ingots_set[ingredient_obj.name] = true
    end
  end
end


-- check that all items either begin with powder or ingot (todo: fix this)
-- for item_name, _ in pairs(ingots_set) do
  -- if string.find(item_name, 'ingot') == nil and string.find(item_name, 'powder') == nil then
    -- ingots_set[item_name] = false
  -- end
-- end
multiply({'__inputs__', '__yield__', '__time__'}, 12.0, item2recipes({'solid-cement', 'solid-glass-mixture'}))
-- ingots_set['solid-cement'] = true
-- ingots_set['solid-glass-mixture'] = true

if settings.startup['marathomaton_no_bob_cheaper_steel'].value == false then
  -- if bob cheaper steel is on, have to disable this because angel refining will overwrite stuff
  ingots_set['ingot-steel'] = false
end

if settings.startup['marathomaton_enable_ingot_explosion'].value == true then
  -- log('MARATHOMATON -> ingots_set is ' .. serpent.block(ingots_set))
  explode_all(ingots_set, ingot_expansion_rate) -- slightly different from ordinary expansion rate.
end

explode_all(plates_list)
explode_all(subgroup2items({'bob-alloy'}))
-- explode_all(subgroup2items({'bob-resource'}))
local resource_stuff = {['carbon']=true, ['solid-carbon']=true, ['glass']=true, ['resin']=true, ['rubber']=true}
for key, val in pairs(resource_stuff) do
  resource_stuff[key] = data.raw.item[key]
end
explode_all(resource_stuff)

