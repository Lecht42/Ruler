width = 3
pointA = nil

function drawPoint (target, player) 
    rendering.draw_sprite({surface = player.surface, sprite = "point-sprite", target = target, target_offset = {0, 0}, tint = player.color})
end

script.on_event("ruler-set-pointA", function(event)
    local player = game.get_player(event.player_index)
    local cursor_position = {x = math.floor(event.cursor_position.x) + 0.5, y = math.floor(event.cursor_position.y) + 0.5}

    rendering.clear()
    if (pointA == nil) then   
        drawPoint(cursor_position, player) 
        pointA = cursor_position
    else 
        pointA = nil
    end
end)

script.on_event("ruler-set-pointB", function(event)
    if (pointA ~= nil) then
        local player = game.get_player(event.player_index)
        local cursor_position = {x = math.floor(event.cursor_position.x) + 0.5, y = math.floor(event.cursor_position.y) + 0.5}

        rendering.draw_line({surface = player.character.surface, from = pointA, to = cursor_position, color = player.color, width = width})  
        drawPoint(cursor_position, player)
        
        pointA = nil
    end
end)