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
* Clean up lua code (wip), handle errors better, pass in params dict instead of lots of args
* Adjust crating alien artifacts:
  - 1 limestone to 2 calcium carbonate in 1.5 sec in ore crusher, unlocked by limestone unlock (ie washing)
  - alien bacteria from spores should have 30% success rate
  - alien pre-artifact from bacteria makes 0-3 preartifacts
  - pink alien pre-artifact from preartifact needs 50 crystal seedling
  - colored alien pre-arttact from preartifact has 20% success rate
  - Extracting small alien artifacts now gives: 5, 5%; 1, 25%; 0, 70%; effectively down from 5 to 0.5
  - recoloring artifacts doesnt work anymore
  - Making big colored from small colored requires 1 big pink alien artifact in addition to 25 small colored. big pink artifact recipe not changed
  - everything uses 20x colored artifact
* Add settings flag for not-really-marathon content (e.g. technology changes, pipe stack size change, fuel changes, etc.) and make sure it happens in the correct phase (data-updates)
* disable uranium ore deposits when angels refining exists
* Add settings flag to provide *some* materials on startup (otherwise way too tedious)
* nerf wood -> coal -> fracking recipes. disable vanilla coal fracking if petrochem coal fracking enabled. also disable/modify bio fuel cracking
* Apply GCF factoring to some alloy recipes (eg brass plate should be dialed down 5x) and in general for all recipes after exploding (?)
* make molten metals unable to be barreled, or nerf somewhat (require special plastic/tungsten barrels?)
* Apply 0.5x yield to all products of products of gas: ethane, methane, butane (to match oil's plastic sulfur and solid-fuel), and possibly some other key products-of-products
* Un-increase heat exchanger & heat turbine recipes so much
* Handle all burner buildings the same way
* Autaomtically deduce smelting categories
* Automatically deduce circuit board names in bobs
* Automatically deduce seedling recipe names
* Fix disassembly recipes (burner drill, steel furnace)

Wishlist
========
* SpaceMod working with Bob's endgame again. Hopefully by adding tiers to the space science techs? CMHMod as stopgap for now.
* Burner assembling machine 0
* fixed biofuel, bioplastic, coal liquefication recipes
* steel mixing & chemical furnaces
