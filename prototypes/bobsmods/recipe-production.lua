update_recipe("air-pump",
{
	energy_required = 5,
	ingredients = {
		{type="item", name="iron-plate", amount=10},
		{type="item", name="iron-gear-wheel", amount=10},
		{type="item", name="electronic-circuit", amount=10},
		{type="item", name="pipe", amount=10},
	}
})

update_recipe("air-pump-2",
{
	ingredients = {
		{type="item", name="air-pump", amount=1},
		{type="item", name="steel-plate", amount=10},
		{type="item", name="steel-gear-wheel", amount=10},
		{type="item", name="advanced-circuit", amount=8},
		{type="item", name="pipe", amount=6},
	}
})

update_recipe("chemical-plant",
{
	ingredients = {
		{type="item", name="steel-plate", amount=20},
		{type="item", name="iron-gear-wheel", amount=30},
		{type="item", name="electronic-circuit", amount=10},
		{type="item", name="pipe", amount=15},
	}
})

update_recipe("chemical-plant-2",
{
	ingredients = {
		{type="item", name="chemical-plant", amount=1},
		{type="item", name="glass", amount=15},
		{type="item", name="steel-bearing", amount=30},
		{type="item", name="steel-gear-wheel", amount=15},
		{type="item", name="advanced-circuit", amount=8},
		{type="item", name="pipe", amount=10},
	}
})

update_recipe("electrolyser",
{
	ingredients = {
		{type="item", name="stone-brick", amount=10},
		{type="item", name="electronic-circuit", amount=10},
		{type="item", name="pipe", amount=15},
	}
})

update_recipe("electrolyser-2",
{
	ingredients = {
		{type="item", name="electrolyser", amount=1},
		{type="item", name="glass", amount=15},
		{type="item", name="steel-plate", amount=30},
		{type="item", name="advanced-circuit", amount=8},
		{type="item", name="pipe", amount=10},
	}
})

update_recipe("water-pump",
{
	energy_required = 7,
	ingredients = {
		{type="item", name="iron-plate", amount=10},
		{type="item", name="iron-gear-wheel", amount=15},
		{type="item", name="electronic-circuit", amount=10},
		{type="item", name="pipe", amount=20},
	}
})

update_recipe("water-pump-2",
{
	ingredients = {
		{type="item", name="water-pump", amount=1},
		{type="item", name="steel-plate", amount=10},
		{type="item", name="steel-gear-wheel", amount=10},
		{type="item", name="advanced-circuit", amount=8},
		{type="item", name="pipe", amount=15},
	}
})

update_recipe("void-pump",
{
	ingredients = {
		{type="item", name="iron-plate", amount=10},
		{type="item", name="iron-gear-wheel", amount=15},
		{type="item", name="electronic-circuit", amount=10},
		{type="item", name="pipe", amount=10},
	}
})

if data.raw.item["basic-circuit-board"] then
	bobmods.lib.replace_recipe_item ("electrolyser", "electronic-circuit", "basic-circuit-board")
end

if data.raw.item["steel-pipe"] then
	bobmods.lib.replace_recipe_item ("chemical-plant-2", "pipe", "steel-pipe")
end

if data.raw.item["stone-pipe"] then
	bobmods.lib.replace_recipe_item ("electrolyser", "pipe", "stone-pipe")
end

if data.raw.item["plastic-pipe"] then
	bobmods.lib.replace_recipe_item ("electrolyser-2", "pipe", "plastic-pipe")
end

if data.raw.item["copper-pipe"] then
	bobmods.lib.replace_recipe_item ("air-pump", "pipe", "copper-pipe")
	bobmods.lib.replace_recipe_item ("water-pump", "pipe", "copper-pipe")
	bobmods.lib.replace_recipe_item ("void-pump", "pipe", "copper-pipe")
end

if data.raw.item["bronze-pipe"] then
	bobmods.lib.replace_recipe_item ("air-pump-2", "pipe", "bronze-pipe")
	bobmods.lib.replace_recipe_item ("water-pump-2", "pipe", "bronze-pipe")
end
