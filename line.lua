require("info_box")

Line = {}

function Line:new (point_A, point_B, player)
    local emptyPoint = {x = 0, y = 0}
    local obj = {
        point_A = point_A or emptyPoint,
        point_B = point_B or emptyPoint
    }
    local surface = player.character.surface

    function obj:getTiledLength()
        local x = math.abs(obj.point_B.x - obj.point_A.x) 
        local y = math.abs(obj.point_B.y - obj.point_A.y) 

        return x + y + 1
    end
    
    function obj:getTrueLength()
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
        local width = 5
        local height = 4
        local middle = obj:getMiddle()
        local left_top = { x = middle.x - width, y = middle.y - height}
        local right_bottom = middle

        game.print(obj.point_A.y)
        if obj.point_A.x < obj.point_B.x and obj.point_A.y < obj.point_B.y then
            left_top.y = left_top.y + (height * 2)
        elseif obj.point_A.x > obj.point_B.x and obj.point_A.y > obj.point_B.y then
            left_top.y = left_top.y + (height * 2)
        end
        
        InfoBox:new(left_top, right_bottom,  player)
    end

    rendering.draw_line({surface = surface, from = obj.point_A, to = obj.point_B, color = player.color, width = 3})
    obj:drawLabelBox();

    setmetatable(obj, self)
    self.__index = self

    return obj
end