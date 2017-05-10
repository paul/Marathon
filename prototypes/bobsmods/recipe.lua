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

-- seedling/wood recipes
-- goal is: pre-fertiliser, growing wood is energy deficit, and should only be done for the purpose of actually acquiring wood

-- bobgreenhouse: 1 wood -> ~2 seedling in 0.5s
-- bioindustries: 1 wood -> 2 seedling, 1 pulp in 0.5s
-- bobgreenhouse: 10 seedling -> 10 wood
-- bobgreenhouse: 10 seedling, 5 fertiliser -> ~20 wood
-- bioindustries: 20 seedling -> 40 wood , 450 s
-- bioindustries: 30 seedling, 10 fertiliser -> 75 wood, 260 s
-- bioindustries: 50 seedling, 5 a. fertiliser -> 150 wood, 150 s
-- 20 wood or 40 pulp -> 18 charcoal (3 MJ)
-- 12 charcoal -> 8 or 10 coal (4 MJ)
-- 15 coal -> 10 cokecoal (9 MJ)
-- 3 raw wood -> 12 cellulose fiber -> 2 wood pellets -> 1 wood bricks (12 MJ)
-- algae: 100 co2 -> 40 green algae -> 20 cellulose -> 3.333 wood pellets -> 100 co2 + 1.93 wood pellets or about 11 MJ of wood bricks.
-- total time: 6s * .2MW + 20s * .15MW  + 72s * ?? + 7s * ?           + 17s * ? very close to 11 MJ.
