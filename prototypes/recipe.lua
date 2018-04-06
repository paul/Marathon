local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local i2r = item2recipes
local multiply = marathomaton.multiply
local replace2item = marathomaton.get_items_from_category_replaceable

local recipes


-- half yield on all products of products of crude oil
marathomaton.modify_all_yields(0.5, 'sulfur')
marathomaton.modify_all_yields(0.5, 'lubricant')
multiply('__inputs__', 2.0, i2r({'solid-fuel'}))
multiply('__inputs__', 2.0, i2r({'enriched-fuel'}))
marathomaton.modify_all_recipes('plastic-bar', 2)

-- slow down some select intermediates
multiply('__time__', 3.0, i2r({'iron-gear-wheel'}))
recipes = i2r({'copper-cable'})
multiply('__time__', 4.0, recipes)
multiply('__inputs__', 2.0, recipes)
recipes = i2r({'electronic-circuit'})
multiply('__time__', 16.0, recipes)
multiply('__inputs__', 3.0, recipes)
marathomaton.modify_all_yields(0.5, 'sulfuric-acid')
recipes = i2r({'battery'})
multiply('__time__', 1.5, recipes)
multiply('__inputs__', 1.5, recipes)
multiply('__inputs__', 3.5, i2r({'flying-robot-frame'}))
multiply('__time__', 3.0, i2r({'engine-unit'}))


------- building slowdowns
-- slow down early burner game. TODO autodetect all burners
multiply('iron-gear-wheel', 2.0, i2r({'burner-inserter', 'inserter', 'long-handed-inserter', 'burner-mining-drill', 'burner-assembling-machine'}))

-- slower assmebling machines
local buildings = i2r(replace2item('assembling-machine', 'assembling-machine'))
multiply('__upgrade__', 6.0, buildings)
multiply('__time__', 6.0, buildings)

-- all labs and mining drills 
multiply({'__time__', '__upgrade__'}, 6.0, i2r(cat2items({'lab'})))
multiply({'__time__', '__upgrade__'}, 6.0, i2r(replace2item('mining-drill', 'mining-drill')))
-- except for burner
multiply({'__time__', '__upgrade__'}, 0.333333, i2r({'burner-mining-drill'}))

-- slow down T1 electricity
local wooden_pole = i2r('small-electric-pole')
multiply('copper-cable', 0.5, wooden_pole)
local pipe = cat2items('pipe')
local boiler = i2r(cat2items('boiler'))
multiply('__upgrade__', 2.0, boiler)
multiply(pipe, 7.5, boiler)
local steam_engine = i2r(cat2items({'generator'}))
multiply('__time__', 60.0, steam_engine)
multiply('__upgrade__', 4.0, steam_engine)
multiply('__upgrade__', 4.0, i2r({'steam-engine'}))

-- slow down T2 electricity
multiply({'__upgrade__', '__time__'}, 2.0, i2r(cat2items({'accumulator' , 'solar-panel'})))

-- make getting military harder in early game
multiply({'iron-gear-wheel', 'iron-plate'}, 2.0, i2r(cat2items({'gun', 'ammo', 'capsule'})))
multiply({'iron-gear-wheel', 'iron-plate'}, 5.0, i2r(cat2items({'ammo-turret', 'electric-turret', 'fluid-turret'})))
-- dont apply to military science pack
multiply({'__yield__', '__time__'}, 3.0, 'military-science-pack')
multiply('__inputs__', 2.0, 'military-science-pack')
multiply('gun-turret', 0.5, 'military-science-pack')

-- tank nerfs (to match ordinary marathon)
-- 2.5x all tank ammo
recipes = {}
for item_name, item_obj in pairs(data.raw.ammo) do
  if item_obj.ammo_type and item_obj.ammo_type.category == 'cannon-shell' then
    recipes[item_name] = true
  end
end
multiply('__inputs__', 2.5, i2r(recipes))

-- 2.5x tank requirements except if tanks are upgraded from other tanks
multiply('__inputs__', 2.5, i2r(cat2items('car')))
multiply(i2r(cat2items('car')), 0.4, i2r(cat2items('car')))
multiply('__inputs__', 0.4, i2r('car'))

