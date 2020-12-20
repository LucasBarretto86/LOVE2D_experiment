local Player = require("player")
local player = Player:new({x = 0, y = 0}, 32, 32)

function love.load()
    player:set_avatar("boy")
    player.avatar:add_animation("idle", 4, 1)
    player.avatar:add_animation("run", 10, 1)
    player.avatar:add_animation("jump", 10, 1)
end

function love.update(dt)
    player:set_state("idle")
    player.avatar:set_animation(player.state)
    player.avatar.animation:play(dt)
end

function love.draw()
    player:draw()
end
