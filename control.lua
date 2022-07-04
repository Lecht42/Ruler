require("line")


first_point = nil

function drawPoint (target, player) 
    rendering.draw_sprite({surface = player.surface, sprite = "point-sprite", target = target, target_offset = {0, 0}, tint = player.color})
end

function getCellCenter (position)
    return {x = math.floor(position.x) + 0.5, y = math.floor(position.y) + 0.5}
end

function getPlayerFromEvent(event)
    return game.get_player(event.player_index)
end

script.on_event("ruler-set-pointA", function(event)
    rendering.clear()

    if (first_point == nil) then   
        local player = getPlayerFromEvent(event)
        local cursor_position = getCellCenter(event.cursor_position)

        drawPoint(cursor_position, player) 
        first_point = cursor_position
    else 
        first_point = nil
    end
end)

script.on_event("ruler-set-pointB", function(event)
    if (first_point == nil) then return end
    
    local player = getPlayerFromEvent(event)
    local cursor_position = getCellCenter(event.cursor_position)


    local line = Line:new(first_point, cursor_position, player)
    drawPoint(cursor_position, player)
    
    first_point = nil
end)