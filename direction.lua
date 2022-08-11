Dirs = {
    NONE = -1,
    RIGHT_TOP = 0,
    RIGHT_BOTTOM = 1,
    LEFT_BOTTOM = 2,
    LEFT_TOP = 3
}

RelativeDirection = {}

function RelativeDirection:new(point_A, point_B)
    local obj = {
        direction = Dirs.NONE
    }

    if point_A.x < point_B.x and point_A.y > point_B.y then
        obj.direction = Dirs.RIGHT_TOP
    elseif point_A.x < point_B.x and point_A.y < point_B.y then
        obj.direction = Dirs.RIGHT_BOTTOM
    elseif point_A.x > point_B.x and point_A.y < point_B.y then
        obj.direction = Dirs.LEFT_BOTTOM
    else
        obj.direction = Dirs.LEFT_TOP
    end

    setmetatable(obj, self)
    self.__index = self

    return obj.direction
end
