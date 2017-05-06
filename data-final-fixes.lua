
-- log('DATA RAW RECIPE')
-- log(serpent.block(data.raw.recipe))
-- log('DATA RAW ITEM')
-- log(serpent.block(data.raw.item))
-- log('DATA RAW')
-- log(serpent.block(data.raw))

-- convert every recipe in data.raw.recipe to "normal"/"marathon" version
-- do this by keeping "name" and "type" fields and moving everything else to inside "normal" / "expensive" field
