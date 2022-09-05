Colors = {
    BLUE = {
        r = 0,
        g = 0,
        b = 1,
        a = 0.8
    },
    RED = {
        r = 1,
        g = 0,
        b = 0,
        a = 0.8
    },
    GREEN = {
        r = 0,
        g = 1,
        b = 0,
        a = 0.8
    },
    ORANGE = {
        r = 1,
        g = 0.6,
        b = 0,
        a = 0.8
    },
    YELLOW = {
        r = 1,
        g = 1,
        b = 1,
        a = 0.8
    },
    WHITE = {
        r = 1,
        g = 1,
        b = 1,
        a = 0.8
    },
    BLACK = {
        r = 0,
        g = 0,
        b = 0,
        a = 0.8
    },
    TRANSPARENT_BLACK = {
        r = 0,
        g = 0,
        b = 0,
        a = 0.5
    }
}

Artist = {}

function Artist:new(player)
    local obj = {
        first_point = nil,
        second_point = nil,
        line = nil
    }

    function obj:drawPointA(target, player)
        return obj.draw_sprite({
            surface = player.surface,
            sprite = "point-sprite",
            target = target,
            target_offset = {0, 0},
            tint = player.color
        })
    end

    function obj:drawPointB(target, player)
        return obj.draw_sprite({
            surface = player.surface,
            sprite = "point-sprite",
            target = target,
            target_offset = {0, 0},
            tint = player.color
        })
    end
    
    function obj:drawLine(target, player)
        Line:new(context, first_point, cursor_position, player)
        
        return rendering.draw_sprite({
            surface = player.surface,
            sprite = "point-sprite",
            target = target,
            target_offset = {0, 0},
            tint = player.color
        })
    end
    
    function obj:setDestroyTimers(items, time)
        if time == nil then
            time = 120
        end
    
        for i, e in ipairs(items) do
            rendering.set_time_to_live(e, time)
        end
    end

    setmetatable(obj, self)
    self.__index = self

    return obj
end

Artists = {}

function addArtist(player)
    Artists[player.name] = Artist:new(player)
end