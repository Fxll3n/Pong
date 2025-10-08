require("game.src.object")
require("game.src.ball")

local ball

function love.load()
    math.randomseed(love.math.getRandomSeed())
    ball = Ball:new(10, 10, 10)
end

function love.update(dt)
    ball:update(dt)
end

function love.draw()
    ball:draw()
end