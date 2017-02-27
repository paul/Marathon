local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local i2r = item2recipes
local multiply = marathomaton.multiply

local recipes


-- half yield on all products of products of crude oil
marathomaton.modify_all_yields(0.5, 'sulfur')
marathomaton.modify_all_yields(0.5, 'lubricant')
multiply('__inputs__', 2.0, i2r({'solid-fuel'}))
marathomaton.modify_all_recipes('plastic-bar', 2)

-- slow down all science
recipes = i2r(cat2items({'tool'}))
multiply('__time__', 2.5, recipes)
multiply('__inputs__', 5, recipes)

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


------- building slowdowns
-- slow down early burner game
multiply('iron-gear-wheel', 2.0, {'burner-inserter', 'inserter', 'long-handed-inserter', 'burner-mining-drill'})

-- slow down T1 automation
multiply({'__time__', '__upgrade__'} , 6.0, {'electric-mining-drill', 'assembling-machine-1', 'assembling-machine-2', 'lab'})

-- slow down T1 electricity
multiply('pipe', 15, {'boiler'})
multiply('__time__', 60, {'steam-engine'})
multiply('__inputs__', 15, {'steam-engine'})

-- slow down T2 electricity
multiply({'__time__', '__inputs__'}, 2, {'solar-panel', 'accumulator', 'steel-furnace'})

-- make getting military harder in early game
multiply({'iron-gear-wheel', 'iron-plate'}, 2.0, i2r(cat2items({'gun', 'ammo', 'capsule'})))
multiply({'iron-gear-wheel', 'iron-plate'}, 5.0, i2r(cat2items({'ammo-turret', 'electric-turret', 'fluid-turret'})))

