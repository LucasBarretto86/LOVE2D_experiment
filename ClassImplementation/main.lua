local Player = require("player")
local player = Player:new({x = 0, y = 0}, 32, 32)

function love.load()
    player:setAvatar("boy")
    player.avatar:addAnimation("idle", 4, {2, 0.25, 0.1, 0.25})
    player.avatar:addAnimation("run", 10, 0.8)
    player.avatar:addAnimation("jump", 10, 0.8)
end

function love.update(dt)
    player:setState("idle")
    player.avatar:setAnimation(player.state)
    player.avatar.animation:play(dt)
end

function love.draw()
    player:draw()
end
