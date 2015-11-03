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
})
