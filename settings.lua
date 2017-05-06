data:extend(
{
  {
    type = "bool-setting",
    name = "marathomaton_modify_science",
    setting_type = "startup",
    default_value = false,
    per_user = false,
  },
  {
    type = "double-setting",
    name = "marathomaton_multiplier_adjust_factor",
    setting_type = "startup",
    default_value = 1.0,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_no_bob_cheaper_steel",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_enable_ingot_explosion",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_rebalance_bobmods",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_no_NE_harder_endgame",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
})


-- if false, don't do the 5x science costs for any science
-- default true
marathomaton.config.modify_science = true

-- if < 1.0, all multipliers are scaled down by that much (so a 2x multiplier becomes 1.41x).
-- default 1.0
marathomaton.config.multiplier_adjust_factor = 1.0

-- if true, sets bob's cheaper steel to false if it was true.
-- default true
marathomaton.config.no_bob_cheaper_steel = true

-- if true, explodes ingot volume by 2-10x (varying).
-- default true
marathomaton.config.enable_ingot_explosion = true

-- if true, adjust bobmods (if they exist) to be not as OP
-- default true
marathomaton.config.rebalance_bobmods = true

-- if true, override NE harder endgame (which doubles rocket cost and adds waves upon building first silo)
-- default true
marathomaton.config.no_NE_harder_endgame = true
