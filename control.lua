script.on_event("ruler-start", function(event)
    game.print("Ran on tick: " .. tostring(event.tick))
    rendering.draw_line{surface = 1, from = {0, 0}, to = {100, 100}, color = {1, 1, 1}, width = 2}
end)