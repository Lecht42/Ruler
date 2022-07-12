require("direction")
require("info")

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
        size = copy(InfoBoxStandartSize),
        info = Info:new(context.line)
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
        
        local info = obj.info
        
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

            rendering.draw_text{color=Colors.BLUE, text={ "", info.x }, target=position, surface=surface }
            position.y = position.y + offset_Y
            rendering.draw_text{color=Colors.RED, text={ "", info.y }, target=position, surface=surface }
            position.y = position.y + offset_Y
            rendering.draw_text{color=Colors.ORANGE, text={ "", info.area  }, target=position, surface=surface }
        end

        function drawLengths() 
            local position = {x = obj.text_pos.x + margin_X + (offset_X * 2), y = obj.text_pos.y + (margin_Y * 3)}
            local scale = 2.0

            rendering.draw_text{color=Colors.WHITE, scale = scale, text={ "", "⁄" }, target=position, surface=surface }
            position.x = position.x + (offset_X / 2)
            rendering.draw_text{color=Colors.WHITE, scale = scale, text={ "", info.lineLength }, target=position, surface=surface }
        end

        drawNamesColumn()
        drawValuesColumn()
        drawLengths()
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