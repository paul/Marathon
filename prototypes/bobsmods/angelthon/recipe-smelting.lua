local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- angels-powdered-x : no change afaik
-- make stone creation 1.5x harder (i.e. 0.66x stone yield everywhere)
-- ore crushing : 0.5x yield for stone-crushed, 0.75x time requirements
-- angelsore*-crushed-processing : 2x yield and 2x inputs??? why
-- hdyro (angelsore*-chunk) : ore inputs/outputs * 4 ??? or water/sulfur/geode * 0.25 ? and time * 0.75
-- crystals : acid * 0.25 ? 


---- smelting times:
-- 2x *-ore-processing
-- 2x *-processed-processing
-- 1.66x *-ore-smelting
-- 2x processed-*-smelting
-- 1.66x pellet-*-smelting
-- 2x molten-*-smelting
-- 2x roll-*-casting

-- 2x inputs AND 2x yield (why???) 'angels-*-plate'
-- angels-solder????


some recipes 2x time, some recipes go 0.8->1.333 which is 1.666x time (gold-ore-smelting, 

