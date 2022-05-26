script.on_event("ruler-start", function(event)
    local player = game.get_player(event.player_index)
    local cursor = event.cursor_position
    game.print(player.color)
    rendering.draw_line({surface = player.character.surface, from = {cursor.x, cursor.y}, to = {100, 100}, color = player.color, width = 2})
end)