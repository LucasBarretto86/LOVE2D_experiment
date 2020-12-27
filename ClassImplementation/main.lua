local Player = require("player")
local player = Player:new(32, 32)

function love.load()
    player:setAvatar("boy")
    player.avatar:addAnimation("idle", 4, {2, 0.25, 0.1, 0.25}, true)
    player.avatar:addAnimation("run", 10, 0.8, true)
    player.avatar:addAnimation("jump", 10, 0.8)
    player.avatar:setAnimation("idle")
end

function love.update(dt)
    player.avatar.animation:play(dt)
end

function love.draw()
    player:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" then
        player.avatar:setAnimation("jump")
    elseif key == "left" then
        player.avatar:setAnimation("run")
    elseif key == "right" then
        player.avatar:setAnimation("run")
    else
        player.avatar:setAnimation("idle")
    end
end
