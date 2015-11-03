-- Iron:
--d 2(1) iron ore -> 5(1) plates (slower, more energy)
--d 5(2) plates -> 1 gear (slower)
--d 10(5) iron -> 1 steel (much slower)
--d 1 copper ore -> 5(1) plates (slower, more energy)
--d 10(1) plates -> 2 wires
--d 10(1) plates, 10(2) wires -> 1 green circuits (much slower)
--d 5(2) green circuits, 5(2) plastics, 10(4) -> red circuits (a lot more expensive)
--d 10(1) iron, 10(1) copper -> battery (a lot more)

-- science
--d 20(1) copper, 5(1) wheels -> red science
--d 5(1) belts, 5(1) inserts -> green science
--d 5(1) smart, 5(1) steel, 5(1) advanced, 5(1) batteries -> blue science
--d 10(4) belts, 25(10) gears, 25(10) circuits -> labs (slower to build)

--d 100(10) plate, 25(5) gears, 25(10) circuits -> 1 drills
--d 25(8), 10 bricks -> stteel furnace (slower)

-- Power production stage delay:
--d 100(5) pipes, 200(5) iron, 50 gears -> 1 steam engine (very costly)
--d 25(1) pipe, 2(1) furnaces -> 1 boiler
--d 30(5) copper, rest same -> 1 solar panel
--d 10(2) iron, 10(5) battery -> accumulator
--d half energy from wood and coal

-- Automation cost increase:
--d 25(9) iron, 25(5) gears, 25(3) eletronics -> level 1
--d 100(9) iron, 50(5) gears, 50(3) eletronics -> level 2

-- Robotics (base components are alreayd a lot more)
--d 5(1) red engine, rest the same -> robot frame

-- Test play 1:
--   Burner drills are too cheap, a bit too fast
--d  Red science needs to require more copper
--d  First lab takes too long to craft without factory
--d  Copper is too slow to craft


data:extend(
{
  {
    type = "recipe",
    name = "iron-gear-wheel",
    energy_required = 1.5,	--na
    ingredients = {{"iron-plate", 5}},	--2
    result = "iron-gear-wheel"
  },
  {
    type = "item",
    name = "raw-wood",
    icon = "__base__/graphics/icons/raw-wood.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "2MJ",	--4
    subgroup = "raw-material",
    order = "a[raw-wood]",
    stack_size = 50
  },
  {
    type = "item",
    name = "coal",
    icon = "__base__/graphics/icons/coal.png",
    dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "4MJ",	--8
    subgroup = "raw-material",
    order = "b[coal]",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "burner-mining-drill",
    energy_required = 2,
    ingredients =
    {
      {"iron-gear-wheel", 5}, 	--3
      {"stone-furnace", 1},
      {"iron-plate", 10}	--3
    },
    result = "burner-mining-drill"
  },
}
)

-- recipe
data:extend(
{
  {
    type = "recipe",
    name = "steel-chest",
    enabled = false,
    ingredients = {{"steel-plate", 8}},
    result = "steel-chest"
  },
  {
    type = "recipe",
    name = "copper-cable",
    ingredients = {{"copper-plate", 10}},	--1
    energy_required = 2,	--na
    result = "copper-cable",
    result_count = 2
  },
  {
    type = "recipe",
    name = "electronic-circuit",
    energy_required = 8,	--na
    ingredients =
    {
      {"iron-plate", 10},	--1
      {"copper-cable", 10}	--3
    },
    result = "electronic-circuit"
  },
  {
    type = "recipe",
    name = "advanced-circuit",
    enabled = false,
    energy_required = 16,	--8
    ingredients =
    {
      {"electronic-circuit", 5},	--2
      {"plastic-bar", 5},	--2
      {"copper-cable", 10}	--4
    },
    result = "advanced-circuit"
  },
  {
    type = "recipe",
    name = "battery",
    category = "chemistry",
    energy_required = 6,	--5
    enabled = false,
    ingredients =
    {
      {type="fluid", name="sulfuric-acid", amount=3},	--2
      {"iron-plate", 10},	--1
      {"copper-plate", 10}	--1
    },
    result= "battery"
  },
  {
    type = "recipe",
    name = "basic-mining-drill",
    energy_required = 10,	--2
    ingredients =
    {
      {"electronic-circuit", 25},	--3
      {"iron-gear-wheel", 25},	--5
      {"iron-plate", 100}	---10
    },
    result = "basic-mining-drill"
  },
  {
    type = "recipe",
    name = "steel-furnace",
    ingredients = {{"steel-plate", 25}, {"stone-brick", 10}},	--8,10
    result = "steel-furnace",
    energy_required = 10,	--3
    enabled = false
  },
  {
    type = "recipe",
    name = "steam-engine",
    ingredients =
    {
      {"iron-gear-wheel", 100},	--5
      {"pipe", 50},	--5
      {"iron-plate", 100}	--5
    },
    energy_required = 60,	--1
    result = "steam-engine"
  },
  {
    type = "recipe",
    name = "boiler",
    ingredients = {{"stone-furnace", 2}, {"pipe", 15}},	--1,1
    result = "boiler"
  },
  {
    type = "recipe",
    name = "solar-panel",
    energy_required = 20,	--10
    enabled = false,
    ingredients =
    {
      {"steel-plate", 5},
      {"electronic-circuit", 15},
      {"copper-plate", 30}	--5
    },
    result = "solar-panel"
  },
  {
    type = "recipe",
    name = "basic-accumulator",
    energy_required = 20,	--10
    enabled = false,
    ingredients =
    {
      {"iron-plate", 10},	--2
      {"battery", 10}	--5
    },
    result = "basic-accumulator"
  },
  {
    type = "recipe",
    name = "assembling-machine-1",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 25},	--3
      {"iron-gear-wheel", 25},	--5
      {"iron-plate", 25}	--9
    },
    result = "assembling-machine-1"
  },
  {
    type = "recipe",
    name = "assembling-machine-2",
    enabled = false,
    ingredients =
    {
      {"iron-plate", 100},	--9
      {"electronic-circuit", 25},	--3
      {"iron-gear-wheel", 25},	--5
      {"assembling-machine-1", 1}
    },
    result = "assembling-machine-2"
  },
  {
    type = "recipe",
    name = "flying-robot-frame",
    energy_required = 20,
    ingredients =
    {
      {"electric-engine-unit", 5},	--1
      {"battery", 2},
      {"steel-plate", 1},
      {"electronic-circuit", 3}
    },
    result = "flying-robot-frame",
    enabled = false
  },


-- KeepOnBuilding additions:

-- item.lua
  {
    type = "item",
    name = "solid-fuel",
    icon = "__base__/graphics/icons/solid-fuel.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "10MJ",	-- 25
    subgroup = "raw-resource",
    order = "c[solid-fuel]",
    stack_size = 50
  },

-- ammo.lua
  {
    type = "recipe",
    name = "piercing-bullet-magazine",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"copper-plate", 25},	--5
      {"steel-plate", 1}
    },
    result = "piercing-bullet-magazine"
  },
  {
    type = "recipe",
    name = "rocket",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"explosives", 2},
      {"iron-plate", 10}	--2
    },
    result = "rocket"
  },
  {
    type = "recipe",
    name = "shotgun-shell",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"copper-plate", 10},	--2
      {"iron-plate", 10}	--2
    },
    result = "shotgun-shell"
  },
  {
    type = "recipe",
    name = "piercing-shotgun-shell",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"copper-plate", 10},	--2
      {"steel-plate", 2}
    },
    result = "piercing-shotgun-shell"
  },

--demo-recipe.lua
  {
    type = "recipe",
    name = "iron-stick",
    ingredients = {{"iron-plate", 5}},	--1
    result = "iron-stick",
    result_count = 2
  },
  {
    type = "recipe",
    name = "basic-transport-belt",
    ingredients =
    {
      {"iron-plate", 2},	--1
      {"iron-gear-wheel", 1}
    },
    result = "basic-transport-belt",
    result_count = 2
  },
  {
    type = "recipe",
    name = "basic-inserter",
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-gear-wheel", 1},
      {"iron-plate", 2}	--1
    },
    result = "basic-inserter"
  },
  {
    type = "recipe",
    name = "burner-inserter",
    ingredients =
    {
      {"iron-plate", 2},	--1
      {"iron-gear-wheel", 2}	--1
    },
    result = "burner-inserter"
  },
  {
    type = "recipe",
    name = "pipe",
    ingredients = {{"iron-plate", 2}},	--1
    result = "pipe"
  },
  {
    type = "recipe",
    name = "pistol",
    energy_required = 1,
    ingredients =
    {
      {"copper-plate", 25},	--5
      {"iron-plate", 25}	--5
    },
    result = "pistol"
  },
  {
    type = "recipe",
    name = "submachine-gun",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {"iron-gear-wheel", 25},	--10
      {"copper-plate", 25},	--5
      {"iron-plate", 25}	--10
    },
    result = "submachine-gun"
  },
  {
    type = "recipe",
    name = "basic-bullet-magazine",
    energy_required = 2,
    ingredients = {{"iron-plate", 5}},	--2
    result = "basic-bullet-magazine",
    result_count = 1
  },
  {
    type = "recipe",
    name = "basic-armor",
    enabled = false,
    energy_required = 3,
    ingredients = {{"iron-plate", 100}},	--40
    result = "basic-armor"
  },
  {
    type = "recipe",
    name = "radar",
    ingredients =
    {
      {"electronic-circuit", 5},
      {"iron-gear-wheel", 5},
      {"iron-plate", 25}	--10
    },
    result = "radar"
  },
  {
    type = "recipe",
    name = "small-lamp",
    enabled = false,
    ingredients =
    {
      {"electronic-circuit", 1},
      {"iron-stick", 3},
      {"iron-plate", 2}	--1
    },
    result = "small-lamp"
  },
  {
    type = "recipe",
    name = "pipe-to-ground",
    ingredients =
    {
      {"pipe", 10},
      {"iron-plate", 10}	--5
    },
    result_count = 2,
    result = "pipe-to-ground"
  },

--demo-turret.lua
  {
    type = "recipe",
    name = "gun-turret",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"iron-gear-wheel", 50},	--10
      {"copper-plate", 50},	--10
      {"iron-plate", 50}	--20
    },
    result = "gun-turret"
  },

--fluid-recipe.lua
  {
    type = "recipe",
    name = "sulfuric-acid",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type="item", name="sulfur", amount=5},
      {type="item", name="iron-plate", amount=2},	--1
      {type="fluid", name="water", amount=10}
    },
    results=
    {
      {type="fluid", name="sulfuric-acid", amount=2}	--5
    },
    subgroup = "fluid-recipes"
  },
  {
    type = "recipe",
    name = "solid-fuel-from-light-oil",
    category = "chemistry",
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="light-oil", amount=4}	--1
    },
    results=
    {
      {type="item", name="solid-fuel", amount=1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-light-oil.png",
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]"
  },

  {
    type = "recipe",
    name = "solid-fuel-from-petroleum-gas",
    category = "chemistry",
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="petroleum-gas", amount=8}	--2
    },
    results=
    {
      {type="item", name="solid-fuel", amount=1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-petroleum-gas.png",
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]"
  },

  {
    type = "recipe",
    name = "solid-fuel-from-heavy-oil",
    category = "chemistry",
    energy_required = 3,
    ingredients =
    {
      {type="fluid", name="heavy-oil", amount=6}	--2
    },
    results=
    {
      {type="item", name="solid-fuel", amount=1}
    },
    icon = "__base__/graphics/icons/solid-fuel-from-heavy-oil.png",
    subgroup = "fluid-recipes",
    enabled = false,
    order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]"
  },
  {
    type = "recipe",
    name = "sulfur",
    category = "chemistry",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {type="fluid", name="water", amount=3},
      {type="fluid", name="petroleum-gas", amount=3}
    },
    results=
    {
      {type="item", name="sulfur", amount=1}	--2
    }
  },
  {
    type = "recipe",
    name = "lubricant",
    category = "chemistry",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type="fluid", name="heavy-oil", amount=2}	--1
    },
    results=
    {
      {type="fluid", name="lubricant", amount=1}
    },
    subgroup = "fluid-recipes"
  },


--flame-thrower-ammo uses iron-plate

--inserter.lua
  {
    type = "recipe",
    name = "long-handed-inserter",
    enabled = false,
    ingredients =
    {
      {"iron-gear-wheel", 1},
      {"iron-plate", 5},	--1
      {"basic-inserter", 1}
    },
    result = "long-handed-inserter"
  },

--recipe.lua
  {
    type = "recipe",
    name = "straight-rail",
    enabled = false,
    ingredients =
    {
      {"stone", 2},	--1
      {"iron-stick", 2},	--1
      {"steel-plate", 1}
    },
    result = "straight-rail",
    result_count = 2
  },
  {
    type = "recipe",
    name = "curved-rail",
    enabled = false,
    ingredients = {{"stone", 8}, {"iron-stick", 8}, {"steel-plate", 4}},	--4,4,4
    result = "curved-rail",
    result_count = 2
  },
  {
    type = "recipe",
    name = "heavy-armor",
    enabled = false,
    energy_required = 8,
    ingredients = {{ "copper-plate", 500}, {"steel-plate", 50}},	--100,50
    result = "heavy-armor"
  },
  {
    type = "recipe",
    name = "iron-chest",
    enabled = true,
    ingredients = {{"iron-plate", 20}},	--8
    result = "iron-chest"
  },
  {
    type = "recipe",
    name = "shotgun",
    enabled = false,
    energy_required = 4,
    ingredients =
    {
      {"iron-plate", 25},	--15
      {"iron-gear-wheel", 10},	--5
      {"copper-plate", 50},	--10
      {"wood", 5}
    },
    result = "shotgun"
  },
  {
    type = "recipe",
    name = "combat-shotgun",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"steel-plate", 15},
      {"iron-gear-wheel", 10},	--5
      {"copper-plate", 50},	--10
      {"wood", 10}
    },
    result = "combat-shotgun"
  },
  {
    type = "recipe",
    name = "advanced-circuit",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {"electronic-circuit", 2},
      {"plastic-bar", 4},	--2
      {"copper-cable", 4}
    },
    result = "advanced-circuit"
  },
  {
    type = "recipe",
    name = "big-electric-pole",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 5},
      {"copper-plate", 25}	--5
    },
    result = "big-electric-pole"
  },
  {
    type = "recipe",
    name = "substation",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 10},
      {"advanced-circuit", 5},
      {"copper-plate", 25}	--5
    },
    result = "substation"
  },
  {
    type = "recipe",
    name = "medium-electric-pole",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 2},
      {"copper-plate", 10}	--2
    },
    result = "medium-electric-pole"
  },
  {
    type = "recipe",
    name = "low-density-structure",
    energy_required = 30,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {"steel-plate", 10},
      {"copper-plate", 25},	--5
      {"plastic-bar", 10}	--5
    },
    result= "low-density-structure"
  },
}
)
