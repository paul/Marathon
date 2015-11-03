data:extend({
  {
    type = "recipe",
    name = "basic-armor",
    enabled = false,

    energy_required = 3,
    ingredients = {{"iron-plate", 100}},
    result = "basic-armor",
  },
  {
    type = "recipe",
    name = "heavy-armor",
    enabled = false,

    energy_required = 8,
    ingredients = {
      {"copper-plate", 500},
      {"steel-plate", 50},
    },
    result = "heavy-armor",
  },
})
