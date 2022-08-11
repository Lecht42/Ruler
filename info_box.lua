require("direction")
require("utils")
require("info")

InfoBoxStandartSize = {
    height = 0.9,
    width = 4.0
}

InfoBox = {}

function InfoBox:new(context, position, direction)
    local obj = {
        corner_A = position or EmptyPoint,
        corner_B = position or EmptyPoint,
        text_pos = position or EmptyPoint,
        direction = direction or Dirs.RIGHT_BOTTOM,
        info = Info:new(context.line),
        size = InfoBoxStandartSize,
        sizeMultiplier = 1.0
    }

    obj.sizeMultiplier = math.max(obj.sizeMultiplier, obj.info.lineLength / 16.0)

    local size = copy(InfoBoxStandartSize)
    for i, e in ipairs(size) do
        e = e * obj.sizeMultiplier
    end
    obj.size = size

    function obj:calculateGeometry()
        local size = obj.size
        local multiplier = obj.sizeMultiplier

        function setCorner_B()
            obj.corner_B = {
                x = obj.corner_A.x + (size.width * multiplier),
                y = obj.corner_A.y + (size.height * multiplier)
            }
        end

        if obj.direction == Dirs.LEFT_TOP or obj.direction == Dirs.RIGHT_BOTTOM then
            size.width = math.flip(size.width)
            setCorner_B()
            obj.text_pos = {
                x = obj.corner_B.x,
                y = obj.corner_B.y - (size.height * multiplier)
            }
        else
            setCorner_B()
        end
    end

    function obj:drawBody()
        local info = obj.info
        local multiplier = obj.sizeMultiplier
        local rendering_ids = {}

        local padding_X = 0.1 * multiplier
        local padding_Y = 0.05 * multiplier
        local offset_X = 0.5 * multiplier
        local offset_Y = 0.25 * multiplier

        local surface = context.player.surface

        table.insert(rendering_ids, rendering.draw_rectangle {
            color = Colors.TRANSPARENT_BLACK,
            filled = true,
            left_top = obj.corner_A,
            right_bottom = obj.corner_B,
            surface = surface
        })

        local position = {
            x = obj.text_pos.x + padding_X,
            y = obj.text_pos.y + padding_Y
        }
        local starting_position = copy(position)

        local baseScale = 0.45

        local scale = baseScale * multiplier

        function nextColumn(quantity)
            position.y = starting_position.y

            quantity = quantity or 1
            for i = 1, quantity do
                position.x = position.x + offset_X
            end
        end

        function nextRow()
            position.y = position.y + offset_Y
        end

        function center()
            position.y = position.y + (offset_Y / 2)
        end

        function write(color, text)
            table.insert(rendering_ids, rendering.draw_text {
                color = color,
                text = text,
                scale = scale,
                target = position,
                surface = surface
            })
        end

        write(Colors.RED, {"", "  x"})
        nextRow()
        write(Colors.GREEN, {"", "  y"})
        nextRow()
        write(Colors.BLUE, {"", "x×y"})

        nextColumn()

        write(Colors.RED, {"", info.x})
        nextRow()
        write(Colors.GREEN, {"", info.y})
        nextRow()
        write(Colors.BLUE, {"", info.area})

        scale = (baseScale * 2.0) * multiplier

        nextColumn()
        center()

        write(Colors.YELLOW, {"", "◢"})
        position.x = position.x + offset_X
        write(Colors.YELLOW, {"", info.lineLength})

        nextColumn(2)
        center()

        write(Colors.ORANGE, {"", "▟"})
        position.x = position.x + offset_X
        write(Colors.ORANGE, {"", info.tiledLineLength})

        local time_to_exist = settings.get_player_settings(context.event.player_index)["time-to-exist"].value
        setDestroyTimers(rendering_ids, time_to_exist)
    end

    function obj:draw()
        obj:calculateGeometry()
        obj:drawBody()
    end

    obj:draw()

    setmetatable(obj, self)
    self.__index = self

    return obj
end
