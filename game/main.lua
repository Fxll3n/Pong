require("game.src.object")
require("game.src.ball")

local ball
local shader

function love.load()
    love.window.setFullscreen(true)

    math.randomseed(love.math.getRandomSeed())

    local image = love.graphics.newImage("assets/dvd.png")

    shader = love.graphics.newShader("assets/CRT.fs")

    ball = Ball:new(10, 10, image:getWidth(), image:getHeight(), image)
end

function love.update(dt)
    ball:update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.setShader(shader)
    ball:draw()
    local winWidth, winHeight = love.graphics.getDimensions()
    love.graphics.rectangle("line", 0, 0, winWidth, winHeight)
end