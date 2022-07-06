require("info_box")
require("direction")
require("utils")


Line = {}

function Line:new (context, point_A, point_B)
    local obj = {
        point_A = point_A or EmptyPoint,
        point_B = point_B or EmptyPoint
    }

    function obj:getX()
        return math.abs(obj.point_B.x  - obj.point_A.x) + 1
    end

    function obj:getY()
        return math.abs(obj.point_B.y  - obj.point_A.y) + 1
    end

    function obj:getTiledLength()
        return obj:getX() + obj:getY()
    end

    function obj:getLineLength()
        local a = obj.point_B.x - obj.point_A.x
        local b = obj.point_B.y - obj.point_A.y
    
        return math.sqrt(math.pow(a, 2) + math.pow(b, 2))
    end

    function obj:getMiddle()
        local a = obj.point_B.x + obj.point_A.x
        local b = obj.point_B.y + obj.point_A.y
    
        return {x = a / 2, y = b / 2}
    end

    function obj:drawInfoBox()
        context.line = obj

        InfoBox:new(context, obj:getMiddle(), RelativeDirection:new(obj.point_A, obj.point_B))
    end

    rendering.draw_line({surface = context.player.surface, from = obj.point_A, to = obj.point_B, color = context.player.color, width = 3})
    obj:drawInfoBox();

    setmetatable(obj, self)
    self.__index = self

    return obj
end