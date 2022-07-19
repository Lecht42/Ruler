require("direction")
require("utils")
require("info")

InfoBoxStandartSize = {
    height = 2.0,
    width = 7.0,
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
        
        local padding_X = 0.2
        local padding_Y = 0.1
        local offset_X = 1.0
        local offset_Y = 0.5

        local surface = context.player.surface
        local write = rendering.draw_text

        rendering.draw_rectangle{ color=Colors.BLACK, filled=true, left_top=obj.corner_A, right_bottom=obj.corner_B, surface=surface }

        function drawNamesColumn() 
            local position = {x = obj.text_pos.x + padding_X, y = obj.text_pos.y + padding_Y}

            write{color=Colors.RED, text={ "", "  x" }, target=position, surface=surface }
            position.y = position.y + offset_Y
            write{color=Colors.GREEN, text={ "", "  y" }, target=position, surface=surface }
            position.y = position.y + offset_Y
            write{color=Colors.BLUE, text={ "", "x×y" }, target=position, surface=surface }
        end

        function drawValuesColumn() 
            local position = {x = obj.text_pos.x + padding_X + offset_X, y = obj.text_pos.y + padding_Y}

            write{color=Colors.RED, text={ "", info.x }, target=position, surface=surface }
            position.y = position.y + offset_Y
            write{color=Colors.GREEN, text={ "", info.y }, target=position, surface=surface }
            position.y = position.y + offset_Y
            write{color=Colors.BLUE, text={ "", info.area  }, target=position, surface=surface }
        end

        function drawLengths() 
            local position = {x = obj.text_pos.x + padding_X + (offset_X * 2), y = obj.text_pos.y + (padding_Y * 3)}
            local scale = 2.0

            write{color=Colors.YELLOW, scale = scale, text={ "", "◢" }, target=position, surface=surface }
            position.x = position.x + offset_X 
            write{color=Colors.YELLOW, scale = scale, text={ "", info.lineLength }, target=position, surface=surface }
            position.x = position.x + (offset_X * 1.5) 
            write{color=Colors.ORANGE, scale = scale, text={ "", "▟" }, target=position, surface=surface }
            position.x = position.x + offset_X 
            write{color=Colors.ORANGE, scale = scale, text={ "", info.tiledLineLength }, target=position, surface=surface }
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