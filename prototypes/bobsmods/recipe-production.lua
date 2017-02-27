local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- air, water, void pumps : 3.5x upgrade, 2.5x time costs
-- most other buildings (eg chemical, electrolysers): 2.25x upgrade costs

local pumps = i2r(subgroup2items('bob-pump'))
multiply('__upgrade__', 3.5, pumps)
multiply('__time__', 2.5, pumps)

local buildings = i2r(cat2items('assembling-machine'))
multiply({'__time__', '__upgrade__'}, 2.25, i2r(cat2items('assembling-machine')))

-- redo these from base

multiply({'__time__', '__upgrade__'}, 2.6666666666666, i2r({'assembling-machine-1', 'assembling-machine-2', 'electronics-machine-1'}))

