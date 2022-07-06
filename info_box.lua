require("direction")
require("utils")

InfoBoxStandartSize = {
    height = 1.9,
    width = 4
}

InfoBox = {}

function InfoBox:new (context, position, direction)
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
        local margin_X = 0.2
        local margin_Y = 0.1
        local offset_X = 0.8
        local offset_Y = 0.5

        local surface = context.player.surface


        rendering.draw_rectangle{ color={}, filled=true, left_top=obj.corner_A, right_bottom=obj.corner_B, surface=surface }

        function drawNamesColumn() 
            local position = {x = obj.text_pos.x + margin_X, y = obj.text_pos.y + margin_Y}

            rendering.draw_text{color=Colors.BLUE, text={ "", "  x" }, target=position, surface=surface }
            position.y = position.y + offset_Y
            rendering.draw_text{color=Colors.RED, text={ "", "  y" }, target=position, surface=surface }
            position.y = position.y + offset_Y
            rendering.draw_text{color=Colors.ORANGE, text={ "", "x×y" }, target=position, surface=surface }
        end

        function drawValuesColumn() 
            local position = {x = obj.text_pos.x + margin_X + offset_X, y = obj.text_pos.y + margin_Y}

            local x = context.line:getX()
            local y = context.line:getY()

            rendering.draw_text{color=Colors.BLUE, text={ "", x }, target=position, surface=surface }
            position.y = position.y + offset_Y
            rendering.draw_text{color=Colors.RED, text={ "", y }, target=position, surface=surface }
            position.y = position.y + offset_Y
            rendering.draw_text{color=Colors.ORANGE, text={ "", x * y  }, target=position, surface=surface }
        end

        function drawLengths() 
            local position = {x = obj.text_pos.x + margin_X + (offset_X * 2), y = obj.text_pos.y + margin_Y}

            rendering.draw_text{color={  r = 0, g = 0, b = 1, a = 1 }, text={ "", "  x" }, target=position, surface=surface }
            position.y = position.y + offset_Y
            rendering.draw_text{color={  r = 1, g = 0, b = 0, a = 1 }, text={ "", "  y" }, target=position, surface=surface }
        end

        drawNamesColumn()
        drawValuesColumn()
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