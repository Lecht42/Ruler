EmptyPoint = {x = 0, y = 0}

Colors = {
    BLUE = { r = 0, g = 0, b = 1, a = 1 },
    RED = { r = 1, g = 0, b = 0, a = 1 },
    GREEN = { r = 0, g = 1, b = 0, a = 1 },
    ORANGE = {  r = 1, g = 0.6, b = 0, a = 1 },
    YELLOW = { r = 1, g = 1, b = 1, a = 1 },
    WHITE = { r = 1, g = 1, b = 1, a = 1 },
    BLUE = { r = 0, g = 0, b = 1, a = 1 },
    BLACK = { r = 0, g = 0, b = 0, a = 1 },
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
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end