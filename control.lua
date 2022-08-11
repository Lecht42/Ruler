require("line")
require("utils")

first_point = nil

script.on_event("ruler-set-pointA", function(event)
    rendering.clear()

    if (first_point == nil) then   
        local player = getPlayerFromEvent(event)
        local cursor_position = getCellCenter(event.cursor_position)

        first_point = cursor_position
        first_point.id = drawPoint(cursor_position, player) 
    else 
        first_point = nil
    end
end)

script.on_event("ruler-set-pointB", function(event)
    if first_point == nil then return end
    
    local player = getPlayerFromEvent(event)
    local cursor_position = getCellCenter(event.cursor_position)

    local context = { event = event, player = player }
    local line = Line:new(context, first_point, cursor_position, player)
    local time_to_exist = settings.get_player_settings(player)["time-to-exist"].value

    setDestroyTimers({first_point.id, line.id, drawPoint(cursor_position, player)}, time_to_exist)

    first_point = nil
end)