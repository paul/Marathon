local item2recipes = marathomaton.get_recipes_from_item
local multiply = marathomaton.multiply
local i2r = item2recipes

if settings.startup['marathomaton_wooden_board_requires_iron'].value == true then
  multiply({'__inputs__', '__time__', '__yield__'}, 2.0, i2r('wooden-board'))
  -- things that should happen AFTER all the plates etc. are exploded
  if bobmods and bobmods.lib then
    local boards = i2r('wooden-board')
    for board, _ in pairs(boards) do
      if data.raw.recipe[board] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item{'iron-plate'}.name) then
        bobmods.lib.item.add_new(data.raw.recipe[board].expensive.ingredients, bobmods.lib.item.basic_item{'iron-plate'})
      end
    end
  end
end
