local Avatar = require("avatar")
local Player = Class:create("Player")

function Player:constructor(offset, width, height, orientation, drawscale)
    self.x = 0 or offset.x
    self.y = 0 or offset.y
    self.width = width
    self.height = height
    self.state = "idle"
    self.orientation = 0 or orientation
    self.avatar = {}
    self.drawscale = drawscale or RENDER_SCALE
end

function Player:draw()
    love.graphics.draw(
        self.avatar.animation.spritesheet,
        self.avatar.animation.frame.quad,
        self.x,
        self.y,
        self.orientation,
        self.drawscale
    )
end

function Player:setAvatar(name)
    self.avatar = Avatar:new(name, self.width, self.height)
end

function Player:setState(state)
    self.state = string.lower(state)
end

function Player:setOrientation(orientation)
    self.orientation = orientation
end

return Player
