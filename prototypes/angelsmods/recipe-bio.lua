-- TODO refactor this file!!!

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
  v Extracting small alien artifacts now gives: 5x1 each with 10% success rate; effectively down from 5 to 0.5
  v recoloring artifacts doesnt work anymore
  v Making big colored from small colored requires 1 big pink alien artifact in addition to 25 small colored. big pink artifact recipe not changed
  v everything uses 10x colored artifact
--]]

local colors = {'blue', 'red', 'yellow', 'orange', 'purple', 'green'}
local colors_base = {'blue', 'red', 'yellow', 'orange', 'purple', 'green', 'base'}
local artifacts = {'-blue', '-red', '-yellow', '-orange', '-purple', '-green', ''}

if settings.startup["marathomaton_rebalance_angels_bio_artifacts"].value == true and angelsmods and angelsmods.bioprocessing then
  -- alien bacteria from spores
  if data.raw.recipe['alien-bacteria'] then
    local ro = data.raw.recipe['alien-bacteria']
    ro = ro['expensive'] or {}
    ro = ro.results or {}
    ro = ro[1] or {}
    ro.probability = (ro.probability or 1.0) * 0.2
  end

  -- alien preartifact from bacteria
  if data.raw.recipe['alien-pre-artifact'] then
    local ro = data.raw.recipe['alien-pre-artifact']
    ro = ro['expensive'] or {}
    ro = ro.results or {}
    ro = ro[1] or {}
    ro.probability = 0.5
    ro.amount = 1

    local ro2 = data.raw.recipe['alien-pre-artifact']
    ro2 = ro2['expensive'] or {}
    ro2 = ro2.results or {}
    ro2[2] = {}
    ro2 = ro2[2]
    for k, v in pairs(ro) do
      ro2[k] = v
    end
    ro2.amount = 2
  end
  
  -- pink alien artifact 
  if bobmods and bobmods.lib then
    local recipes = i2r('alien-pre-artifact-base')
    local item = 'crystal-seedling'
    local ingredient = { name = 'crystal-seedling', amount = '50', type='fluid' }
    for recipe_name, _ in pairs(recipes) do
      local ro = data.raw.recipe[recipe_name] or {}
      ro.category = 'advanced-crafting'
      ro = ro['expensive'] or {}
      ro.category = 'advanced-crafting'
      table.insert(ro.ingredients or {}, ingredient)
    end
  end

  -- colored alien pre-artifact from preartifact
  for _, color in ipairs(colors_base) do
    local recipe = 'alien-pre-artifact-' .. color
    if data.raw.recipe[recipe] then
      local ro = data.raw.recipe[recipe]
      ro = ro['expensive'] or {}
      ro = ro.results or {}
      ro = ro[1] or {}
      ro.probability = (ro.probability or 1.0) * 0.4
    end
  end

  -- extracting small alien artifacts
  for _, color in ipairs(artifacts) do
    local recipe = 'small-alien-artifact' .. color
    if data.raw.recipe[recipe] then
      local ro = data.raw.recipe[recipe]
      ro = ro['expensive'] or {}
      ro = ro.results or {}
      ro = ro[1] or {}
      local count = ro.amount or 0
      local results = {}
      if count > 0 then
        for i=1, count do
          table.insert(results, { amount = 1, name = recipe, type = 'item', probability = 0.1 })
        end
      end
      ro = data.raw.recipe[recipe]
      ro = ro['expensive'] or {}
      ro.results = results
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
    local ro = data.raw.recipe['alien-artifact-' .. color .. '-from-small'] or {}
    ro = ro['expensive'] or {}
    table.insert(ro.ingredients or {}, { amount = 1, type = 'item', name = 'alien-artifact' })
  end
end
