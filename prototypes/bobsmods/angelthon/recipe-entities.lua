local cat2items = marathomaton.get_items_from_category
local subgroup2items = marathomaton.get_items_by_subgroup
local i2r = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply

-- ore silos : 5x inputs
-- angels-warehouses: 5x upgrade? except for T1?
-- flare-stack and angels storage tanks and angels-pressure-tank: 5x inputs AND 4x steel? 8x inputs?

-- most petrochem buildings:
-- separators, gas/oil refineries, steam cracker, chem plants, angels-eletrolyser, air-filter: 4.5x upgrade? 4x upgrade?
-- special case for flare stack: additional 4x steel

-- valves, fluid splitter 2 & 3: 20x inputs

-- bio-processing-plant: ????

-- crushers, floatation cell, leaching plant, : 5x upgrade AND 0.5x stone-brick?
-- ore-refinery: 3x upgrade?
-- ore-sorting: 5x upgrade AND 0.5x stone brick?
-- hydro-plant: 2x upgrade?
-- ore-processing-machines, pellet press, casting-machine, sintering-oven, strand-casting-machine : 4x upgrade? 4x AND .5x stone-brick?
-- on average: most angels machines in the refining/metallurgy tabs -> 4x upgrade and .5x stone brick
-- to find what tab is a recipe in: lookup recipe.subgroup in data.item_groups[recipe.subgroup].group

---------------
-- easy way: every machine in refining/metallurgy -> 4x upgrade AND .5x stone brick, AND
-- ore silos 3x stone brick, AND
-- flare stack: 5x steel,
-- every building in barreling/pumps: 16x inputs
