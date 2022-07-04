InfoBox = {}

function InfoBox:new (left_top, right_bottom, player)
    local emptyPoint = {x = 0, y = 0}
    local obj = {
        left_top = left_top or emptyPoint,
        right_bottom = right_bottom or emptyPoint
    }
    local surface = player.character.surface


    function obj:drawCoordinates()
    

    end

    rendering.draw_rectangle{color={}, filled=true, left_top=obj.left_top, right_bottom=obj.right_bottom, surface=surface}

    setmetatable(obj, self)
    self.__index = self

    return obj
end