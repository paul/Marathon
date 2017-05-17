data:extend(
{
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
    name = "marathomaton_rebalance_bobmodules",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  --[[
  {
    type = "bool-setting",
    name = "marathomaton_no_NE_harder_endgame",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  --]]
  {
    type = "bool-setting",
    name = "marathomaton_greenhouse_revamp",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_expensive_steel",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_wooden_board_requires_iron",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_enable_all_bobartifacts",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_fixup_angels_smelting_tech_order",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
  {
    type = "bool-setting",
    name = "marathomaton_rebalance_angels_bio_artifacts",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },
})


local names = { "bobmods-enemies-enableartifacts" ,"bobmods-enemies-enablesmallartifacts",  "bobmods-enemies-enablenewartifacts", "bobmods-enemies-aliensdropartifacts"}
for _, name in ipairs(names) do
  local s = data.raw['bool-setting'][name] or {}
  s.default_value = true
end

-- log("MARATHOMATON settings lua " .. serpent.block(data.raw['bool-setting']))
