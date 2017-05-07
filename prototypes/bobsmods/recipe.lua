local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local i2r = item2recipes
local multiply = marathomaton.multiply
local recipes

-- see recipe-circuit
recipes = item2recipes({'electronic-circuit'})
multiply('__time__', 0.0625, recipes)
multiply('__inputs__', 0.33333333333333, recipes)

-- also multiply "t2" requirements for turrets slightly
multiply({'steel-plate', 'steel-gear-wheel'}, 2.0, item2recipes(cat2items({'ammo-turret', 'electric-turret', 'fluid-turret'})))
