local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply
local sg2i = marathomaton.get_items_by_subgroup
local recipes

if settings.startup['marathomaton_rebalance_bobmodules'].value == true then
  -- 2x time, 5x inputs for all module components
  local module_components = sg2i( {"module-intermediates", "addon-modules1", "addon-modules2"} )
  recipes = i2r(module_components)
  multiply('__time__', 2, recipes)
  -- multiply('__inputs__', 5, recipes)
  -- multiply(module_components, 0.2, recipes)
  -- including the ones used in tech
  local science_module_components = sg2i( {"module-intermediates", "addon-modules1", "addon-modules2"}, 'tool' )
  recipes = i2r(science_module_components)
  multiply('__time__', 2, recipes)
  -- multiply('__inputs__', 5, recipes)
  -- multiply(module_components, 0.2, recipes)
  
  recipes = i2r(sg2i( "module-beacon" ))
  multiply({'__time__','__inputs__'}, 2, recipes)


  -- modify merged mod recipes
    -- merged modules: raw speed needs 2x speed, green needs 2x green,
    -- raw prod needs 4x prod, 3x green, 2x poll, 1x speed
  recipes = i2r(sg2i("raw-speed-module", "module"))
  multiply(sg2i("speed-module", "module"), 2.0, recipes)
  recipes = i2r(sg2i("green-module", "module"))
  multiply(sg2i("effectivity-module", "module"), 2.0, recipes)
  recipes = i2r(sg2i("raw-productivity-module", "module"))
  multiply(sg2i("productivity-module", "module"), 4.0, recipes)
  multiply(sg2i("effectivity-module", "module"), 3.0, recipes)
  multiply(sg2i("pollution-clean-module", "module"), 2.0, recipes)

  -- remove things that produce green module which are not subgroup 'green-module-combine'
  local merged = {'green-module', 'raw-speed-module', 'raw-productivity-module'}
  local removed_recipes = {}
  for _, module_type in ipairs(merged) do
    recipes = i2r(sg2i(module_type, "module"))
    for recipe_name, _ in pairs(recipes) do
      if data.raw.recipe[recipe_name] and data.raw.recipe[recipe_name].subgroup ~= module_type .. '-combine' then
        removed_recipes[recipe_name] = true
        data.raw.recipe[recipe_name] = nil
      end
    end
  end

  -- remove them from the tech table
  for tech_name, tech_obj in pairs(data.raw.technology) do
    if tech_obj and tech_obj.effects then
      for i=#tech_obj.effects,1,-1 do
        local effect_obj = tech_obj.effects[i]
        if effect_obj and effect_obj.recipe and removed_recipes[effect_obj.recipe] then
          table.remove(tech_obj.effects, i)
        end
      end
    end
  end

end


