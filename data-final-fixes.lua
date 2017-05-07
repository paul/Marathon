
-- log('DATA RAW RECIPE')
-- log(serpent.block(data.raw.recipe))
-- log('DATA RAW ITEM')
-- log(serpent.block(data.raw.item))
-- log('DATA RAW')
-- log(serpent.block(data.raw))

-- convert every recipe in data.raw.recipe to "normal"/"marathon" version
-- do this by keeping "name" and "type" fields and moving everything else to inside "normal" / "expensive" field

-- log(serpent.block(data.raw.recipe))

if marathon ~= nil then
  log('Error! Marathon mod detected -- cannot continue.')
  marathomaton.incompatible = true
else
  marathomaton.incompatible = false
  require("prototypes.item")
  require("prototypes.recipe")
  require("prototypes.recipe-smelting")
  
  -- i don't think these break even if bobs is not loaded
  --[[
  if bobmods and bobmods.config then
	  require("prototypes.bobsmods.item")
	  require("prototypes.bobsmods.recipe")
	  require("prototypes.bobsmods.recipe-circuit")
	  require("prototypes.bobsmods.recipe-module")
	  require("prototypes.bobsmods.recipe-misc")
	  require("prototypes.bobsmods.recipe-production")
	  require("prototypes.bobsmods.recipe-logistics")
	  -- require("prototypes.bobsmods.recipe-power")
	  require("prototypes.bobsmods.recipe-intermediate")
	  require("prototypes.bobsmods.recipe-smelting")
  end

  if angelsmods then
    log('applying angel mods')
    require("prototypes.bobsmods.angelthon.recipe-smelting")
    require("prototypes.bobsmods.angelthon.recipe-production")
  else
    log('angels mods not found!!')
  end
  --]]
end

