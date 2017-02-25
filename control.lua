
--[[
function detect_marathon()
  if marathomaton.incompatible == true then
    game.print("Error detected! Marathomaton is incompatible with marathon mod. Changes have not been applied.") 
  end 
end
script.on_configuration_changed(detect_marathon)
--]]
