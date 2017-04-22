if not marathomaton then marathomaton = {} end
if not marathomaton.config then marathomaton.config = {} end

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
