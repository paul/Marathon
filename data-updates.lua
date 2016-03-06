if bobmods and bobmods.config then
	function update_recipe(name, values)
		local recipe = data.raw.recipe[name]
		if recipe then
			for key, value in pairs(values) do
				recipe[key] = value
			end
		end
	end
	require("prototypes.bobsmods.item")
	require("prototypes.bobsmods.recipe-chemistry")
	require("prototypes.bobsmods.recipe-circuit")
	require("prototypes.bobsmods.recipe-intermediate")
	require("prototypes.bobsmods.recipe-logistics")
	require("prototypes.bobsmods.recipe-power")
	require("prototypes.bobsmods.recipe-production")
	require("prototypes.bobsmods.recipe-resource")
	require("prototypes.bobsmods.recipe-smelting")
	require("prototypes.bobsmods.recipe-turret")
	
	print("Debug marathon")
	print("Num recipes: " .. #data.raw.recipe)
	for name, recipe in pairs(data.raw.recipe) do
		print("recipe: " .. name .. " | " .. serpent.line(recipe))
	end
end
