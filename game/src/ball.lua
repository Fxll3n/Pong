Ball = {}
setmetatable(Ball, {__index = Object})
Ball.__index = Ball

function Ball:new(x, y, w, h, img)
    local obj = Object:new(x,y, w, h)
    setmetatable(obj, Ball)

    obj.speed = 200
    obj.img = img
    

    local x_vel = math.random(-1, 1)
    local y_vel = math.random(-1, 1)

    obj.vel = {x=x_vel,y=y_vel}

    return obj
end

function Ball:update(dt)
    if self.vel.x ~= 0 or self.vel.y ~= 0 then
        self.x = self.x + (self.speed * dt * self.vel.x)
        self.y = self.y + (self.speed * dt * self.vel.y)
    end
    self:check_for_bounce()
end

function Ball:check_for_bounce()
    local winWidth, winHeight = love.graphics.getDimensions()
    if self.x <= 0 + self.w/2 then
        self.x = 0 + self.w/2
        self.vel.x = -self.vel.x
    elseif self.x >= winWidth - self.w/2 then
        self.x = winWidth - self.w/2
        self.vel.x = -self.vel.x
    end
    if self.y <= 0 + self.h/2 then
        self.y = 0 + self.h/2
        self.vel.y = -self.vel.y
    elseif self.y >= winHeight - self.h/2 then
        self.y = winHeight - self.h/2
        self.vel.y = -self.vel.y
    end
end

function Ball:draw()
    love.graphics.draw(self.img, self.x - self.w/2, self.y - self.h/2)
    -- Debug: draw collision rectangle
    love.graphics.setColor(1, 0, 0, 0.3)
    love.graphics.rectangle("line", self.x - self.w/2, self.y - self.h/2, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
    local str = string.format("(%d,%d)", self.x, self.y)
    love.graphics.print(str, self.x - self.w/2, self.y - self.h)
end