function Context:new (surface, position, direction)
    local obj = {}

    function obj:add(table)
        

    end

    function obj:remove(table)
        

    end

    setmetatable(obj, self)
    self.__index = self

    return obj
end