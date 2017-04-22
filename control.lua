
script.on_event(defines.events.on_player_created, function(event)
  if event and event.player_index and game and game.players then
    local player = game.players[event.player_index]
    local _ = player and player.insert({name='iron-plate', count=1})
  end
end)

--[[
function detect_marathon()
  if marathomaton.incompatible == true then
    game.print("Error detected! Marathomaton is incompatible with marathon mod. Changes have not been applied.") 
  end 
end

script.on_configuration_changed(detect_marathon)
--]]


