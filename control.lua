from = nil

script.on_event("ruler-hotkey", function(event)
    local player = game.get_player(event.player_index)
    local stack = player.cursor_stack

    stack.set_stack({name="ruler-selection", count=1})
end)

script.on_event("mouse-memorizer", function(event)
    from = event.cursor_position
end)

script.on_event(defines.events.on_player_selected_area, function(event)
    local player = game.get_player(event.player_index)
    local area = event.area
    local to = (() => {
        return "test"
      })()

    game.print(to)

    if(event.item == "ruler-selection") then
        rendering.draw_line({surface = player.character.surface, from = from, to = area.left_top, color = player.color, width = 3})   
    end
end)