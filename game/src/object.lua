Object = {}
Object.__index = Object

function Object:new(x, y, w, h)
    local obj = setmetatable({}, Object)
    obj.x = x or 0
    obj.y = y or 0
    obj.w = w or 0
    obj.h = h or 0
    return obj
end

function Object:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end