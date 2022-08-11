require("utils")

Info = {}

function Info:new(line)
    local obj = {
        x = 0,
        y = 0,
        area = -1,
        lineLength = -1,
        tiledLineLength = -1,
        boxScale = -1
    }

    function obj:calculate()
        obj.x = line:getLengthX() + 1
        obj.y = line:getLengthY() + 1
        obj.area = obj.x * obj.y
        obj.lineLength = line:getLength()
        obj.lineLength = math.floor(obj.lineLength) + math.floorPrecision(obj.lineLength, 0.1)
        obj.tiledLineLength = obj.x + obj.y - 1
    end

    obj:calculate()

    setmetatable(obj, self)
    self.__index = self

    return obj
end
