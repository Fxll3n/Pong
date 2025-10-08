Ball = {}
setmetatable(Ball, {__index = Object})
Ball.__index = Ball

function Ball:new(x, y, r)
    local obj = Object:new(x,y)
    setmetatable(obj, Ball)

    obj.radius = r
    obj.speed = 200
    

    local x_vel = math.random(-1, 1)
    local y_vel = math.random(-1, 1)

    obj.vel = {x=x_vel,y=y_vel}

    return obj
end

function Ball:update(dt)
    if self.vel ~= {x=0,y=0} then
        self.x = self.x + (self.speed * dt * self.vel.x)
        self.y = self.y + (self.speed * dt * self.vel.y)
    end

    self:check_for_bounce()
end

function Ball:check_for_bounce()
    local winWidth, winHeight = love.graphics.getDimensions()
    local diameter = self.radius
    
    if self.x <= 0 + diameter then
        self.x = 0 + diameter
        self.vel.x = -self.vel.x 
    elseif self.x >= winWidth - diameter then
        self.x = winWidth - diameter
        self.vel.x = -self.vel.x 
    end

    if self.y <= 0 + diameter then
        self.y = 0 + diameter
        self.vel.y = -self.vel.y 
    elseif self.y >= winHeight - diameter then
        self.y = winHeight - diameter
        self.vel.y = -self.vel.y 
    end
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end
