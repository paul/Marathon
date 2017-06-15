marathomaton = {}

require('libs/core')

if settings.startup["marathomaton_no_bob_cheaper_steel"].value == true then
  -- log('MARATHOMATON DISABLED CHEAPER STEEL')
  if settings.startup["bobmods-plates-cheapersteel"] then
    settings.startup["bobmods-plates-cheapersteel"].value = false
  end
end
if settings.startup["marathomaton_rebalance_bobmodules"].value == true then
  -- log('MARATHOMATON REBALANCE BOBMODS')
  if settings.startup["bobmods-modules-productivityhasspeed"] then
    settings.startup["bobmods-modules-productivityhasspeed"].value = true
    bobmods.modules.ProductivityHasSpeed = true
  end
end
if settings.startup["marathomaton_enable_all_bobartifacts"].value == true then
  if settings.startup["bobmods-enemies-enableartifacts"] then
    settings.startup["bobmods-enemies-enableartifacts"].value = true
  end
  if settings.startup["bobmods-enemies-enablesmallartifacts"] then
    settings.startup["bobmods-enemies-enablesmallartifacts"].value = true
  end
  if settings.startup["bobmods-enemies-enablenewartifacts"] then
    settings.startup["bobmods-enemies-enablenewartifacts"].value = true
  end
  if settings.startup["bobmods-enemies-aliensdropartifacts"] then
    settings.startup["bobmods-enemies-aliensdropartifacts"].value = true
  end
end

--[[
-- NE expansion override using metatable fuckery because his data-updates.lua file re-requires config.lua for some obscene reason
if NE_Expansion_Config then
  local _NE = {}
  _NE.ScienceCost = false
  NE_Expansion_Config.ScienceCost = nil
  -- causes lookups to function normally but setting is now noop
  setmetatable(NE_Expansion_Config, {__index=_NE, __newindex=function(t,k,v) end})
  if marathomaton.config.no_NE_harder_endgame then
    NE_Expansion_Config.HarderEndGame = nil
    _NE.HarderEndGame = false
  end
  log(serpent.block(NE_Expansion_Config))
  log(NE_Expansion_Config.ScienceCost)
  log(NE_Expansion_Config.HarderEndGame)
end
--]]

-- log('MARATHOMATON TECHNOLOGY ' .. serpent.block(data.raw.technology))

if settings.startup["marathomaton_rebalance_angels_bio_artifacts"].value == true and angelsmods and angelsmods.bioprocessing then
  data:extend({
    {
      type = 'recipe',
      name = 'solid-calcium-carbonate-from-limestone',
      category = 'ore-sorting-t1',
      energy_required = 1,
      enabled = 'false',
      ingredients = {
        { type = 'item', name = 'solid-limestone', amount = 1 }
      },
      result = 'solid-calcium-carbonate',
      result_count = 2,
    },
    {
      type = 'recipe',
      name = 'alien-bacteria-from-goo',
      category = 'chemistry',
      energy_required = 3,
      enabled = 'false',
      ingredients = {
        { type = 'fluid', name = 'alien-goo', amount = 20 }
      },
      result = 'alien-bacteria',
      result_count = 1
    }
  })
end

-- undo aai-programmable-vehicles thingy
if mods['aai-programmable-vehicles'] and data.raw.recipe['engine-unit'] then
  local r = data.raw.recipe['engine-unit']
  if r.category == 'crafting' and r.energy_required == 4 then
    r.category = 'advanced-crafting'
    r.energy_required = 20
  end
end

