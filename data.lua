marathomaton = {}
require("config")

-- bob cheaper steel override (why so cheap???)
if bobmods and bobmods.config and bobmods.config.plates then
  if marathomaton.config.no_bob_cheaper_steel then
    bobmods.config.plates.CheaperSteel = false
    if bobmods.plates then
      bobmods.plates.CheaperSteel = false
    end
  end
end

-- NE expansion override using metatable fuckery because his data-updates.lua file re-requires config.lua for some obscene reason
if NE_Expansion_Config then
  local _NE = {}
  _NE.ScienceCost = false
  NE_Expansion_Config.ScienceCost = nil
  setmetatable(NE_Expansion_Config, {__index=_NE, __newindex=function(t,k,v) end})
  if marathomaton.config.no_NE_harder_endgame then
    NE_Expansion_Config.HarderEndGame = nil
    _NE.HarderEndGame = false
  end
  log(serpent.block(NE_Expansion_Config))
  log(NE_Expansion_Config.ScienceCost)
  log(NE_Expansion_Config.HarderEndGame)
end

-- bob modules override (why so op???)
if bobmods and bobmods.config and bobmods.config.modules then
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
  if marathomaton.config.rebalance_bobmods then
    -- blah
    bobmods.config.modules.ProductivityHasSpeed = true
    bobmods.modules.ProductivityHasSpeed = true
  end
end




function marathomaton.adjust_multiplier_factor(multiplier)
  return math.pow(multiplier, marathomaton.config.multiplier_adjust_factor)
end
--   if multiplier > 1.0 then
--     x = multiplier - 1.0
--     x = x * marathomaton.config.multiplier_adjust_factor
--     return 1.0 + x
--   else
--     x = 1.0 / multiplier
--     x = x - 1.0
--     x = x * marathomaton.config.multiplier_adjust_factor
--     return 1.0 + 1.0 / x
--   end
-- end

local AMF = marathomaton.adjust_multiplier_factor

-- deal with shitty data.raw.recipe.ingredients api:
local function _get_ingredient_name(item_data)
  item_data = item_data or {}
  local to_ret
  if item_data.name == nil then
    to_ret = item_data[1]
  else
    to_ret = item_data.name
  end
  if to_ret == nil then
    log('marathomaton error : couldnt parse ingredient name from object ' .. serpent.block(item_data))
  end
  return to_ret
end

-- array of strings or set of strings to set of strings
local function to_set(array_or_dict)
  if array_or_dict == nil then
    return {}
  end
  if type(array_or_dict) == 'string' then
    local to_ret = {}
    to_ret[array_or_dict] = true
    return to_ret
  end
  local to_ret = {}
  for k,v in pairs(array_or_dict) do
    if type(k) == 'string' then
      to_ret[k] = true
    elseif type(v) == 'string' then
      to_ret[v] = true
    end
  end
  return to_ret
end

-- fixup floating point errors
-- also there's a hard cap of 65536 for ingredient count (damn you yuoki!)
local function floor(x)
  x = math.floor(x + 0.001)
  if x > 65535 then
    x = 65535
  end
  if x < 1 then
    x = 1
  end
  return x
end
local function ceil(x)
  x = math.ceil(x - 0.001)
  if x > 65535 then
    x = 65535
  end
  return x
end
-- used for craft time
local function round_craft_time(x, multiplier)
  if x == nil then
    x = 0.5
  end
  x = x * multiplier - 0.0001
  return math.ceil(x * 10) * 0.1
end

-- returns dict of item_name => true if item_name belongs to one of the categories
-- expects array of categories
function marathomaton.get_items_from_category(_categories)
  local categories = to_set(_categories)
  local item_names = {}
  for cat, _ in pairs(categories) do
    if data.raw[cat] ~= nil then
      for name, _ in pairs(data.raw[cat]) do
        item_names[name] = true
      end
    end
  end
  return item_names
end

-- returns dict of item_name => true if item_name belongs to one of the categories and fast_replaceable_group matches given
-- expects category, fast_replaceable_group
function marathomaton.get_items_from_category_replaceable(cat, replaceable)
  local item_names = {}
  if true then
    if data.raw[cat] ~= nil then
      for item_name, item_data in pairs(data.raw[cat]) do
        if item_data.fast_replaceable_group == replaceable then
          item_names[item_name] = true
        end
      end
    end
  end
  return item_names
end

-- returns set-dict of recipes that produce any of the given items
-- expects array, set, or singleton
function marathomaton.get_recipes_from_item(items)
  -- turn items into a hash lookup if not already
  local items_to_modify = to_set(items)
  local recipe_names = {}
  for recipe_name, recipe_obj in pairs(data.raw.recipe) do
    -- check if the recipe makes any of our items, if not, skip
    if recipe_obj.result ~= nil then
      if items_to_modify[recipe_obj.result] ~= nil then
        recipe_names[recipe_name] = true
      end
    end
    if recipe_obj.results ~= nil then
      for _, result_obj in pairs(recipe_obj.results) do
        if items_to_modify[result_obj.name] ~= nil then
          recipe_names[recipe_name] = true
        end
      end
    end
  end
  return recipe_names
end

-- returns set-dict of items that are in the given subgroup(s)
-- also supports setting a category if you dont want item
function marathomaton.get_items_by_subgroup(_groups, category)
  if category == nil then
    category = 'item'
  end
  local groups = to_set(_groups)
  local to_ret = {}
  if data.raw[category] == nil then
    return to_ret
  end
  for item_name, item_props in pairs(data.raw[category]) do
    if groups[item_props.subgroup] ~= nil then
      to_ret[item_name] = true
    end
  end
  return to_ret
end

-- increase ingredient usage in a recipe by name
-- accepts set, array, or singleton recipe name
function marathomaton.modify_recipe(ingredient, multiplier, _recipe_names, flag)
  if flag ~= true then -- passing flag = true disables AMF
    multiplier = AMF(multiplier)
  else
    -- log('skipping AMF for ' .. serpent.block(ingredient) .. serpent.block(multiplier) .. serpent.block(_recipe_names))
  end
  local recipe_names = to_set(_recipe_names)
  for recipe_name, _ in pairs(recipe_names) do
    local recipe_obj = data.raw.recipe[recipe_name]
    if recipe_obj == nil then
      error('marathomaton error in doing ' .. recipe_name .. '\n' .. serpent.block(recipe_obj))
    end

    -- time, modify energy_required
    if ingredient == '__time__' then
      if recipe_obj.energy_required == nil then
        recipe_obj.energy_required = 0.5
      end
      recipe_obj.energy_required = round_craft_time(recipe_obj.energy_required , multiplier)

    -- yield, modify results dict or result_count
    elseif ingredient == '__yield__' then
      if recipe_obj.results ~= nil then -- results dict
        local results = recipe_obj.results -- array
        for i = 1, #results do
          -- either has amount field, or amount_max and amount_min fields
          local fields = {'amount', 'amount_min', 'amount_max'}
          for _, field in pairs(fields) do
            if results[i][field] ~= nil then
              local v = results[i][field] * multiplier
              if results[i].type ~= 'fluid' then -- only allow fractional parts for fluids
                -- round up
                v = ceil(v)
              end
              results[i][field] = v
            end
          end
        end
      else -- singleton results
        local rc = recipe_obj.result_count
        if rc == nil then
          rc = 1
        end
        recipe_obj.result_count = floor(rc * multiplier)
      end

    -- modify all or some or one of the physical ingredients
    else
      -- function to determine which of the inputs to modify
      local function filter_item(item_data)
        local ingredient_name = _get_ingredient_name(item_data)
        if ingredient == '__inputs__' then
          return true
        elseif ingredient == '__upgrade__' then
          -- only skip (i.e. return false) the item which shares the same subgroup and is placable
          -- handle multiple results: identify the "main" result and just use that
          local result_name = recipe_obj.result 
          if result_name == nil then
            result_name = recipe_obj.main_product
          end
          if result_name == nil then
            result_name = recipe_obj.results and recipe_obj.results[1] and recipe_obj.results[1].name
          end
          -- if result_name == nil or ingredient_name == nil or data.raw.item[ingredient_name] == nil or data.raw.item[result_name] == nil then
          --   log("Couldnt upgrade recipe for " .. ingredient_name ..  " : " .. serpent.block(recipe_obj))
          -- end
          if result_name and ingredient_name and data.raw.item[ingredient_name] and data.raw.item[result_name] and data.raw.item[ingredient_name].subgroup == data.raw.item[result_name].subgroup and data.raw.item[ingredient_name].place_result ~= nil then
            return false
          else
            return true
          end
        else
          return ( ingredient_name == ingredient )
        end
      end

      -- iterate over ingredients and find the ones we wish to change
      local ingredient_list = recipe_obj['ingredients']
      for i = 1, #ingredient_list do
        local item_data = ingredient_list[i]
        -- only proceed if we want it
        if filter_item(item_data) then
          -- detect if item_data is array of name, amount or dict
          if item_data[1] == nil then -- dict
            local v = item_data.amount * multiplier
            if item_data.type ~= 'fluid' then -- only allow fractional parts for fluids
              v = floor(v)
            end
            item_data.amount = v
          else -- array
            item_data[2] = floor(item_data[2] * multiplier)
          end
        end
      end
    end
    -- log('successfully modified: ' .. serpent.block(recipe_obj))
  end
end

-- allow multiple fields in first argument
function marathomaton.multiply(a, b, c, flag)
  for t, _ in pairs(to_set(a)) do
    marathomaton.modify_recipe(t,b,c, flag)
  end
end

-- increase ingredient usage in all recipes
function marathomaton.modify_all_recipes(ingredient, multiplier, flag)
  if flag ~= true then
    multiplier = AMF(multiplier)
  end
  -- log('MARATHOMATON: modifying all recipes containing ' .. ingredient)
  for recipe_name, recipe_obj in pairs(data.raw.recipe) do
    local ingredient_list = recipe_obj['ingredients'] or {}
    for i = 1, #ingredient_list do
      local item_data = ingredient_list[i]
      if _get_ingredient_name(item_data) == ingredient then
        -- detect if item_data is array of name, amount or dict
        if item_data[1] == nil then -- dict
          local v = item_data.amount * multiplier
          if item_data.type ~= 'fluid' then -- only allow fractional parts for fluids
            v = floor(v)
          end
          item_data.amount = v
        else -- array
          item_data[2] = floor(item_data[2] * multiplier)
        end
      end
    end
  end
end

-- increase result yield of this specific item in all recipes, but not any other results
function marathomaton.modify_all_yields(multiplier, item)
  -- multiplier = AMF(multiplier)
  -- runs into problems when resulting result_count is non-integer
  -- for now, just hanlde half-integer
  for recipe_name, recipe_obj in pairs(data.raw.recipe) do
    local fixup_flag = false
    if recipe_obj.results ~= nil then -- results, which is a
      local results = recipe_obj.results -- array of dicts
      for i = 1, #results do
        if results[i].name == item then
          -- either has amount field, or amount_max and amount_min fields
          local fields = {'amount', 'amount_min', 'amount_max'}
          for _, field in pairs(fields) do
            if results[i][field] ~= nil then
              local v = results[i][field] * multiplier
              if results[i].type ~= 'fluid' then -- only allow fractional parts for fluids
                if v % 1 ~= 0 then
                  fixup_flag = true
                end
              end
              results[i][field] = v
            end
          end
        end
      end
    else -- singleton results
      if recipe_obj.result == item then
        local rc = recipe_obj.result_count
        if rc == nil then
          rc = 1
        end
        if (rc * multiplier) % 1 ~= 0 then
          fixup_flag = true
        end
        recipe_obj.result_count = rc * multiplier
      end
    end
    if fixup_flag == true then
      -- double every ingredient, time, yield of recipe_obj
      marathomaton.multiply({'__inputs__', '__time__', '__yield__'}, 2.0, recipe_name, true)
      -- log('succesfully exploded ' .. recipe_name .. '!\n' .. serpent.block(recipe_obj))
    end
    while marathomaton.exceeds_stack_size(recipe_name) do
      log('stack size exceeded for ' .. recipe_name .. '! halving recipe:')
      marathomaton.multiply({'__inputs__', '__time__', '__yield__'}, 0.5, recipe_name, true)
    end
  end
end

-- checks a recipe to verify that the results are not produced in >stack_size quantity.
function marathomaton.exceeds_stack_size(recipe_name)
  local recipe_obj = data.raw.recipe[recipe_name]
  if recipe_obj == nil then
    return false
  end
  if recipe_obj.results ~= nil then -- results, array of dicts
    local results = recipe_obj.results
    for i = 1, #results do
      local item_name = results[i].name
      -- check stack size for non-fluids
      if item_name ~= nil and results[i].type ~= 'fluid' and data.raw.item[item_name] ~= nil and data.raw.item[item_name].stack_size ~= nil then
        local stack_size = data.raw.item[item_name].stack_size
        if results[i].amount ~= nil and results[i].amount > stack_size or results[i].amount_max ~= nil and results[i].amount_max > stack_size then
          return true
        end
      end
    end
  else -- singleton results
    local item_name = recipe_obj.result
    if item_name ~= nil and data.raw.item[item_name] ~= nil and data.raw.item[item_name].stack_size ~= nil then
      if recipe_obj.result_count ~= nil and recipe_obj.result_count > data.raw.item[item_name].stack_size then
        return true
      end
    end
  end
  return false
end




      local fields = {'amount', 'amount_max'}

-- given a map of crafting category -> time multiplier, slows them all down by that much
function marathomaton.slowdown_recipe_category(cat2multiplier)
  for _, recipe_obj in pairs(data.raw.recipe) do
    if cat2multiplier[recipe_obj.category] ~= nil then
      recipe_obj.energy_required = round_craft_time(recipe_obj.energy_required , AMF(cat2multiplier[recipe_obj.category]))
    end
  end
end



