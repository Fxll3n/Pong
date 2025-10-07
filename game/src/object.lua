Object = {}
Object.__index = Object

function Object:new(x,y,w,h)
    local obj = setmetatable({}, Object)

    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.vel = {x=0, y=0}

    return obj
end

function Object:update(dt)
end

function Object:draw()
end
