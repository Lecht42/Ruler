EmptyPoint = {x = 0, y = 0}

Colors = {
    BLUE = { r = 0, g = 0, b = 1, a = 0.8 },
    RED = { r = 1, g = 0, b = 0, a = 0.8 },
    GREEN = { r = 0, g = 1, b = 0, a = 0.8 },
    ORANGE = {  r = 1, g = 0.6, b = 0, a = 0.8 },
    YELLOW = { r = 1, g = 1, b = 1, a = 0.8 },
    WHITE = { r = 1, g = 1, b = 1, a = 0.8 },
    BLUE = { r = 0, g = 0, b = 1, a = 0.8 },
    BLACK = { r = 0, g = 0, b = 0, a = 0.8 },
    TRANSPARENT_BLACK = { r = 0, g = 0, b = 0, a = 0.5 },
}

function math.flip(x)
    if x < 0 then 
        return math.abs(x) 
    end

    return x - (x * 2)
end

function math.floorPrecision(x, digit)
    local part = 1 / digit

    return (math.floor((x - math.floor(x)) * part) / part)
end

function copy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else
        copy = orig
    end

    return copy
end

function setDestroyTimers(items, time)
    if time == nil then time = 120 end
    
    for i,e in ipairs(items) do
        rendering.set_time_to_live(e, time)
    end 
end

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