update_recipe("bob-resin-oil",
{
	energy_required = 2.5,
	ingredients = {
		{type="fluid", name="heavy-oil", amount=3}
	}
})

update_recipe("bob-resin-wood",
{
	energy_required = 5
})

update_recipe("bob-rubber",
{
	energy_required = 7,
	ingredients = {
		{type="item", name="resin", amount=3}
	}
})

update_recipe("empty-canister",
{
	result_count = 1
})

update_recipe("gas-canister",
{
	energy_required = 2,
	ingredients = {
		{"steel-plate", 3},
	}
})

update_recipe("silicon-wafer",
{
	result_count = 6
})

update_recipe("solid-fuel-from-hydrogen",
{
	energy_required = 5,
	ingredients = {
		{type="fluid", name="hydrogen", amount=75}
	}
})
