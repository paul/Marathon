local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local i2r = item2recipes
local multiply = marathomaton.multiply


-- undo some of the specific changes from base that we want to generalize to bobs
-- for instance undo the alien artifact science increase for all the different types of artifacts, since now you can self-produce them
recipes = i2r(cat2items({'tool'}))
multiply('alien-artifact', 5.0, recipes)

-- see recipe-power
-- multiply('pipe', 0.0666666666666, {'boiler'})
-- multiply('__time__', 0.01666666666666, {'steam-engine'})
-- multiply('__inputs__', 0.066666666666, {'steam-engine'})
-- furnace, see recipe-smelting
-- multiply({'__time__', '__inputs__'}, 0.5, {'solar-panel', 'accumulator', 'steel-furnace'})
-- see recipe-circuit
local recipes = item2recipes({'electronic-circuit'})
multiply('__time__', 0.0625, recipes)
multiply('__inputs__', 0.33333333333333, recipes)


-- also multiply "t2" requirements for turrets slightly
multiply({'steel-plate', 'steel-gear-wheel'}, 2.0, item2recipes(cat2items({'ammo-turret', 'electric-turret', 'fluid-turret'})))

