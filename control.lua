require("line")
require("utils")

first_point = nil

function drawPoint (target, player) 
    return rendering.draw_sprite({surface = player.surface, sprite = "point-sprite", target = target, target_offset = {0, 0}, tint = player.color})
end

function getCellCenter (position)
    local half = 0.5

    return {x = math.floor(position.x) + half, y = math.floor(position.y) + half}
end

function getPlayerFromEvent(event)
    return game.get_player(event.player_index)
end

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
    
    setDestroyTimers({first_point.id, line.id, drawPoint(cursor_position, player)})

    first_point = nil
end)