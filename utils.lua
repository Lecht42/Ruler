EmptyPoint = {
    x = 0,
    y = 0
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

function getCellCenter(position)
    local half = 0.5

    return {
        x = math.floor(position.x) + half,
        y = math.floor(position.y) + half
    }
end

function getPlayerFromEvent(event)
    return game.get_player(event.player_index)
end