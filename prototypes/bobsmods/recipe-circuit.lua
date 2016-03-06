update_recipe("advanced-circuit",
{
	ingredients = {
		{type="item", name="circuit-board", amount=1},
		{type="item", name="basic-electronic-components", amount=6},
		{type="item", name="electronic-components", amount=6},
	}
})
update_recipe("advanced-processing-unit",
{
	energy_required = 25,
	ingredients = {
		{type="item", name="multi-layer-circuit-board", amount=1},
		{type="item", name="basic-electronic-components", amount=3},
		{type="item", name="electronic-components", amount=4},
		{type="item", name="intergrated-electronics", amount=6},
		{type="item", name="processing-electronics", amount=4},
	}
})
update_recipe("basic-electronic-components",
{
	energy_required = 3,
	ingredients = {
		{type="item", name="copper-cable", amount=1},
		{type="item", name="coal", amount=2},
	}
})
update_recipe("circuit-board",
{
	ingredients = {
		{type="item", name="phenolic-board", amount=1},
		{type="item", name="copper-plate", amount=4},
		{type="fluid", name="ferric-chloride-solution", amount=1.5}
	}
})
update_recipe("electronic-circuit",
{
	enabled = false,
	energy_required = 2.5,
	ingredients = {
		{type="item", name="basic-circuit-board", amount=1},
		{type="item", name="basic-electronic-components", amount=10},
	}
})
update_recipe("electronic-components",
{
	energy_required = 7,
	ingredients = {
		{type="item", name="copper-cable", amount=1},
		{type="item", name="plastic-bar", amount=2},
	}
})
update_recipe("fibreglass-board",
{
	result_count = 1
})
update_recipe("intergrated-electronics",
{
	energy_required = 8,
	ingredients = {
		{type="item", name="copper-cable", amount=4},
		{type="item", name="plastic-bar", amount=3},
		{type="fluid", name="sulfuric-acid", amount=1.5}
	}
})
update_recipe("multi-layer-circuit-board",
{
	ingredients = {
		{type="item", name="fibreglass-board", amount=1},
		{type="item", name="copper-plate", amount=8},
		{type="fluid", name="ferric-chloride-solution", amount=3}
	}
})
update_recipe("phenolic-board",
{
	result_count = 1,
	ingredients = {
		{type="item", name="wood", amount=1},
		{type="item", name="resin", amount=3},
	}
})
update_recipe("phenolic-board-synthetic",
{
	result_count = 1,
	ingredients = {
		{type="item", name="synthetic-wood", amount=1},
		{type="item", name="resin", amount=3},
	}
})
update_recipe("processing-electronics",
{
	ingredients = {
		{type="item", name="copper-cable", amount=4},
		{type="item", name="plastic-bar", amount=3},
		{type="fluid", name="sulfuric-acid", amount=1.5}
	}
})
update_recipe("processing-unit",
{
	energy_required = 15,
	ingredients = {
		{"superior-circuit-board", 1},
		{"basic-electronic-components", 6},
		{"electronic-components", 6},
		{"intergrated-electronics", 4},
	}
})

if data.raw.item["solder-alloy"] then
	update_recipe("solder",
	{
		energy_required = 4,
		result_count = 4
	})
end

update_recipe("superior-circuit-board",
{
	ingredients = {
		{type="item", name="fibreglass-board", amount=1},
		{type="item", name="copper-plate", amount=4},
		{type="fluid", name="ferric-chloride-solution", amount=1.5}
	}
})

-- Update Marathon recipes w/bob items
if data.raw.item["tinned-copper-cable"] then
	bobmods.lib.replace_recipe_item("basic-electronic-components", "copper-cable", "tinned-copper-cable")
	bobmods.lib.replace_recipe_item("electronic-components", "copper-cable", "tinned-copper-cable")
	bobmods.lib.replace_recipe_item("intergrated-electronics", "copper-cable", "tinned-copper-cable")
end

if data.raw.item["carbon"] then
	bobmods.lib.replace_recipe_item("basic-electronic-components", "coal", "carbon")
end

if data.raw.item["silicon-wafer"] then
	bobmods.lib.add_recipe_item("electronic-components", {"silicon-wafer", 4})
	bobmods.lib.add_recipe_item("intergrated-electronics", {"silicon-wafer", 6})
	bobmods.lib.add_recipe_item("processing-electronics", {"silicon-wafer", 10})
else
	if data.raw.item["silicon"] then
		bobmods.lib.add_recipe_item("electronic-components", {"silicon", 3})
		bobmods.lib.add_recipe_item("intergrated-electronics", {"silicon", 4})
		bobmods.lib.add_recipe_item("processing-electronics", {"silicon", 5})
	else
		bobmods.lib.add_recipe_item("electronic-components", {"copper-plate", 3})
		bobmods.lib.add_recipe_item("intergrated-electronics", {"copper-plate", 5})
		bobmods.lib.add_recipe_item("processing-electronics", {"copper-plate", 7})
	end
end

if data.raw.item["gilded-copper-cable"] then
	bobmods.lib.replace_recipe_item("processing-electronics", "copper-cable", "gilded-copper-cable")
else
	if data.raw.item["tinned-copper-cable"] then
		bobmods.lib.replace_recipe_item("processing-electronics", "copper-cable", "tinned-copper-cable")
	end
end

if data.raw.item["silicon-nitride"] then
	bobmods.lib.replace_recipe_item("processing-electronics", "plastic-bar", "silicon-nitride")
end

if data.raw.item["tin-plate"] then
	bobmods.lib.add_recipe_item("circuit-board", {"tin-plate", 2})
else
	bobmods.lib.add_recipe_item("circuit-board", {"copper-plate", 2})
end

if data.raw.item["gold-plate"] then
	bobmods.lib.add_recipe_item("superior-circuit-board", {"gold-plate", 2})
	bobmods.lib.add_recipe_item("multi-layer-circuit-board", {"gold-plate", 4})
else
	if data.raw.item["tin-plate"] then
		bobmods.lib.add_recipe_item("superior-circuit-board", {"tin-plate", 2})
		bobmods.lib.add_recipe_item("multi-layer-circuit-board", {"tin-plate", 4})
	else
		bobmods.lib.add_recipe_item("superior-circuit-board", {"copper-plate", 2})
		bobmods.lib.add_recipe_item("multi-layer-circuit-board", {"copper-plate", 4})
	end
end

if data.raw.item["solder"] then
	bobmods.lib.add_recipe_item("electronic-circuit", {"solder", 2})
	bobmods.lib.add_recipe_item("advanced-circuit", {"solder", 2})
	bobmods.lib.add_recipe_item("processing-unit", {"solder", 3})
	bobmods.lib.add_recipe_item("advanced-processing-unit", {"solder", 6})
end
