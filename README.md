Repository for the factorio Marathon mod.

Description
===========
Do you find factorio too quick to complete and would like a challenge that requires you to scale a bigger factory, spend more effort on research, plan investments more carefully and require the use the train feeding bases? Do you like the feel of the base game as-is? This is the mod for you!

This mod is designed to increase the length and difficulty of the game without changing the recipes. It makes the following major changes:
* Power generation is more costly and fuel yield are halved.
* Science costs drastically increased.
* Most costs are increased, particularly electronics circuits.
* Electronics circuits changes cause the cost of automation (assembly machines, non burner inserter, electric drills) to be very costly. The player has to weigh investments early on.
* Biter evolution is unchanged. Since the game is significantly slowed down this means that you'll like need to use gun turrent against spitter and you'll face biter evolution with less research completed making biters harder.
* Copper outputs significantly more plates per ore (5 to 1 right now) and copper costs are significantly increased. This will cause significant copper bandwidth issues.
* Various build times are increased.

Expect the following:
* The game to take roughly 10 times as long.
* Burner stage (turrets) can't be skipped.
* Getting your first research (lab, power) will take over an hour.
* Higher tier research are very costly.
* Be forced to use trains.

Mod compatibility
=================
This mod has been tested with bobs mods, and works intended. Other then that this mod's compatibility hasn't been tested, if it works the balance will likely be completely off thus it's not suggested.

Contributing
============
Contributions are welcomed. The aim of this mod is to not change recipes at the moment so I'd suggest forking this repo if you'd like to explore that.

To do
=====
Things in progress on this fork:
* Clean up lua code (wip)
* Dial down craft times of pumpjacks
* Dial up burner assembling machine slightly (to match burner drill/inserter)
* Dial up crafting times of assembling machines 3-6 to match 1&2
* Same for electronics assembling
* Dial down alien science requirements (ie don't do 5x)?
* Apply GCF factoring to some alloy recipes (eg brass plate should be dialed down 5x) and in general for all recipes after exploding
* Need separate multipliers for all the different types of assembling machines (ore crusher, ore sorter ,floatation ,leaching ,filtration, crystallize, water plants, electrolyser, greenhouse, compressor, pump, chemical/mixing furnaces, liquier, oil/gas separator, gas refiner, air filter, steam cracker, chemical plants, refinery, ...)

* Autaomtically deduce smelting categories
* Automatically deduce circuit board names in bobs
* Fix disassembly recipes (burner drill, steel furnace)
