require("utils")

players_graphics = {}

function addToPlayerGraphics(player, shape, id)
    players_graphics[player.name][shape] = id
end

function clearPlayerGraphics(player)
    players_graphics[player.name] = {}
end