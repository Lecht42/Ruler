require("direction")
require("utils")

InfoBoxStandartSize = {
    height = 2,
    width = 3
}

InfoBox = {}

function InfoBox:new (surface, position, direction)
    local obj = {
        corner_A = position or EmptyPoint,
        corner_B = position or EmptyPoint,
        text_pos = position or EmptyPoint,
        direction = direction or Dirs.RIGHT_BOTTOM,
        size = copy(InfoBoxStandartSize)
    }

    function obj:calculateOrientation()
        local size = obj.size
        function setCorner_B()
            obj.corner_B = { x = obj.corner_A.x + size.width, y = obj.corner_A.y + size.height }
        end

        if obj.direction == Dirs.LEFT_TOP or obj.direction == Dirs.RIGHT_BOTTOM then
            size.width = math.flip(size.width)
            setCorner_B()
            obj.text_pos = { x = obj.corner_B.x, y = obj.corner_B.y - size.height  }
        else
            setCorner_B()
        end
    end

    function obj:drawBody()
        rendering.draw_rectangle{ color={a = 0.8}, filled=true, left_top=obj.corner_A, right_bottom=obj.corner_B, surface=surface }
        rendering.draw_text{color={  r = 0, g = 0, b = 1, a = 1 }, text={ "x" }, target=obj.text_pos, surface=surface }
    end

    function obj:draw()
        obj:calculateOrientation()
        obj:drawBody()
    end

    obj:draw()

    setmetatable(obj, self)
    self.__index = self

    return obj
end