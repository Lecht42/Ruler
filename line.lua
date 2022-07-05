require("info_box")
require("direction")
require("utils")


Line = {}

function Line:new (context, point_A, point_B)
    local obj = {
        point_A = point_A or EmptyPoint,
        point_B = point_B or EmptyPoint
    }
    local surface = player.character.surface

    function obj:getTiledLength()
        local x = math.abs(obj.point_B.x - obj.point_A.x) 
        local y = math.abs(obj.point_B.y - obj.point_A.y) 

        return x + y + 1
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

    function obj:drawLabelBox()
        InfoBox:new(obj:getMiddle(), RelativeDirection:new(obj.point_A, obj.point_B))
    end

    rendering.draw_line({surface = surface, from = obj.point_A, to = obj.point_B, color = player.color, width = 3})
    obj:drawLabelBox();

    setmetatable(obj, self)
    self.__index = self

    return obj
end