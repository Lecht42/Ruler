Line = {}

function Line:new (point_A, point_B, player)
    local emptyPoint = {x = 0, y = 0}
    local obj = {
        point_A = point_A or emptyPoint,
        point_B = point_B or emptyPoint
    }

    function obj:getLength()
        local a = obj.point_B.x - obj.point_A.x
        local b = obj.point_B.y - obj.point_A.y
    
        return math.sqrt(math.pow(a, 2) + math.pow(b, 2))
    end
    
    function obj:getMiddle()
        local a = obj.point_B.x + obj.point_A.x
        local b = obj.point_B.y + obj.point_A.y
    
        return {x = a / 2, y = b / 2}
    end

    function obj:render()
        local surface = player.character.surface

        rendering.draw_text({text = obj:getLength(), surface = surface, target = obj:getMiddle(), color = player.color, scale = 3.2})
        rendering.draw_line({surface = surface, from = obj.point_A, to = obj.point_B, color = player.color, width = 3})
    end

    setmetatable(obj, self)
    self.__index = self

    return obj
end