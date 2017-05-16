local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply
local AMF = marathomaton.adjust_multiplier_factor

--[[
  v 1 limestone to 2 calcium carbonate in 1.5 sec in ore crusher, unlocked by limestone unlock (ie washing)
  v alien bacteria from spores should have 20% success rate (down from 100)
  v alien bacteria from goo requires 2x goo
  v alien pre-artifact from bacteria makes 0-3 preartifacts (down from 3)
  v pink alien pre-artifact from preartifact needs 50 crystal seedling
  v colored alien pre-arttact from preartifact has 40% success rate
  v Extracting small alien artifacts now gives: 5, 5%; 1, 25%; 0, 70%; effectively down from 5 to 0.5
  v recoloring artifacts doesnt work anymore
  v Making big colored from small colored requires 1 big pink alien artifact in addition to 25 small colored. big pink artifact recipe not changed
  - everything uses 20x colored artifact
--]]


names = 'small-alien-artifact-blue'
local colors = {'blue', 'red', 'yellow', 'orange', 'purple', 'green'}
local colors_base = {'blue', 'red', 'yellow', 'orange', 'purple', 'green', 'base'}
local artifacts = {'-blue', '-red', '-yellow', '-orange', '-purple', '-green', ''}


if settings.startup["marathomaton_rebalance_angels_bio_artifacts"].value == true and angelsmods and angelsmods.bioprocessing then
  -- alien bacteria from spores
  if data.raw.recipe['alien-bacteria'] then
    local result_obj = data.raw.recipe['alien-bacteria']['expensive'].results[1]
    result_obj.probability = (result_obj.probability or 1.0) * 0.2
  end


  -- alien preartifact from bacteria
  if data.raw.recipe['alien-pre-artifact'] then
    local result_obj = data.raw.recipe['alien-pre-artifact']['expensive'].results[1]
    log("MARATHOMATON DEBUG PREARTIFACT " .. serpent.block(result_obj))
    result_obj.probability = 0.5
    result_obj.amount = 1
    data.raw.recipe['alien-pre-artifact']['expensive'].results[2] = {}
    for k, v in pairs(data.raw.recipe['alien-pre-artifact']['expensive'].results[1]) do
      data.raw.recipe['alien-pre-artifact']['expensive'].results[2][k] = v
    end
    data.raw.recipe['alien-pre-artifact']['expensive'].results[2].amount = 2
  end
  
  -- pink alien artifact 
  if bobmods and bobmods.lib then
    local recipes = i2r('alien-pre-artifact-base')
    local item = 'crystal-seedling'
    local ingredient = { name = 'crystal-seedling', amount = '50', type='fluid' }
    for recipe_name, _ in pairs(recipes) do
      data.raw.recipe[recipe_name]['expensive'].category = 'advanced-crafting'
      data.raw.recipe[recipe_name].category = 'advanced-crafting'
      table.insert(data.raw.recipe[recipe_name]['expensive'].ingredients, ingredient)
      -- bobmods.lib.recipe.add_difficulty_result(recipe_name, 'expensive', { name = 'crystal-seedling', amount = '50' })
      -- if data.raw.recipe[recipe_name] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item{item}.name) then
        -- bobmods.lib.item.add(data.raw.recipe[recipe_name].expensive.ingredients, bobmods.lib.item.basic_item{ingredient})
      -- end
      -- log('MARATHOMATON BAD : ' .. serpent.block(data.raw.recipe[recipe_name]))
    end
  end

  -- colored alien pre-artifact from preartifact
  for _, color in ipairs(colors_base) do
    local recipe = 'alien-pre-artifact-' .. color
    if data.raw.recipe[recipe] and data.raw.recipe[recipe]['expensive'] then
      local result_obj = data.raw.recipe[recipe]['expensive'].results[1]
      if result_obj == nil then
        log(recipe .. serpent.block(data.raw.recipe[recipe]))
        error('blaoh')
      end
      result_obj.probability = (result_obj.probability or 1.0) * 0.4
    end
  end

  -- extracting small alien artifacts
  for _, color in ipairs(artifacts) do
    local recipe = 'small-alien-artifact' .. color
    if data.raw.recipe[recipe] and data.raw.recipe[recipe]['expensive'] then
      local count = data.raw.recipe[recipe]['expensive'].results[1].amount
      local results = {}
      for i=1, count do
        table.insert(results, {
          amount = 1,
          name = recipe,
          type = 'item',
          probability = 0.1
        })
      end
      data.raw.recipe[recipe]['expensive'].results = results
    end
  end

  -- big usage up
  marathomaton.modify_all_recipes('alien-artifact', 10)
  for _, color in ipairs(colors) do
    marathomaton.modify_all_recipes('alien-artifact-' .. color, 10)
  end

  -- small to big
  for _, color in ipairs(colors) do
    data.raw.recipe['alien-artifact-' .. color .. '-from-basic'] = nil
    local recipe_obj = data.raw.recipe['alien-artifact-' .. color .. '-from-small']['expensive']
    table.insert(recipe_obj.ingredients, { amount = 1, type = 'item', name = 'alien-artifact' })
  end

end
