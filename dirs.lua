Dirs = {
    RIGHT_TOP = 0,
    RIGHT_BOTTOM = 1,
    LEFT_BOTTOM = 2,
    LEFT_TOP = 3
}

function getDirectionFromPoints( point_A, point_B )
    if point_A.x < point_B.x and point_A.y > point_B.y then
        return Dirs.RIGHT_TOP
    elseif point_A.x < point_B.x and point_A.y < point_B.y then
        return Dirs.RIGHT_BOTTOM
    elseif point_A.x < point_B.x and point_A.y > point_B.y then
        return Dirs.LEFT_BOTTOM
    end

    return Dirs.LEFT_TOP
end

require("dirs")


InfoBox = {}

function InfoBox:new (position, direction, player)
    local emptyPoint = {x = 0, y = 0}
    local width = 3
    local height = 2
    local obj = {
        position = left_top or emptyPoint,
        direction = direction or Dirs.RIGHT_BOTTOM
    }
    local surface = player.character.surface


    function obj:drawCoordinates()
        rendering.draw_text{color={  r = 0, g = 0, b = 1, a = 1 }, text={ "x:" }, target=obj.left_top, surface=surface }
    end

    function obj:drawLengths()
        
    end

    function obj:draw()
        if point_A.x < point_B.x and point_A.y > point_B.y then
            return Dirs.RIGHT_TOP
        elseif point_A.x < point_B.x and point_A.y < point_B.y then
            return Dirs.RIGHT_BOTTOM
        elseif point_A.x < point_B.x and point_A.y > point_B.y then
            return Dirs.LEFT_BOTTOM
        else
            
        end


        rendering.draw_rectangle{ color={a = 0.8}, filled=true, left_top=obj.left_top, right_bottom=obj.right_bottom, surface=surface }
        obj:drawCoordinates()
    end

    obj:draw()

    setmetatable(obj, self)
    self.__index = self

    return obj
end