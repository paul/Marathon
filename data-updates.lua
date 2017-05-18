require("prototypes.item")

if bobsmods then
  require("prototypes.bobsmods.item")
end
if angelsmods then
  require("prototypes.angelsmods.technology-updates")
end
if mods['Yuoki'] then
  require("prototypes.yuoki.item")
end

-- log("MARATHOMATON SETTINGS")
-- log(serpent.block(settings))


if settings.startup['marathomaton_greenhouse_revamp'].value == true then
  if BI then
    -- replace 
    if bobmods and bobmods.lib then
      bobmods.lib.recipe.replace_ingredient("bi_bio_Solar_Farm", "solar-panel", "solar-panel-large-3")
      bobmods.lib.recipe.replace_ingredient("bi_bio_Solar_Farm", "solar-panel-large", "solar-panel-large-3")
      bobmods.lib.recipe.replace_ingredient("bi_bio_Solar_Farm", "medium-electric-pole", "medium-electric-pole-4")
      bobmods.lib.tech.remove_recipe_unlock('bob-solar-energy-2', 'bi_bio_Solar_Farm')
      bobmods.lib.tech.add_recipe_unlock('electric-pole-4', 'bi_bio_Solar_Farm')
      bobmods.lib.tech.add_recipe_unlock('bob-solar-energy-4', 'bi_bio_Solar_Farm')
    end
  end
end


