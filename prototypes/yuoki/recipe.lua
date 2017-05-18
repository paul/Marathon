
local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local item2recipes = marathomaton.get_recipes_from_item
local i2r = item2recipes
local multiply = marathomaton.multiply
local replace2item = marathomaton.get_items_from_category_replaceable

local recipes

-- also uses more energy -- see item.lua
multiply({'__time__', '__upgrade__'}, 6.0, i2r({'y-mining-drill'}))

-- machine recipes are decent -- keep like that for now,
-- 


-- halve dust yields?
-- explode blue yellow purple orange "plates" 


