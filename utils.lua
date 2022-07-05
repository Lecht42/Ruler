EmptyPoint = {x = 0, y = 0}

function math.flip(x)
    if x < 0 then 
        return math.abs(x) 
    end

    return x - (x * 2)
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