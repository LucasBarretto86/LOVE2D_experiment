local Avatar = require("avatar")
local Player = Class:create("Player")

function Player:constructor(width, height, orientation, drawscale)
    self.x = 0
    self.y = 0
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
        self.avatar.animation.current_frame.quad,
        self.x,
        self.y,
        0,
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

function Player:origin()
    return {
        x = (self.x + self.width * 0.5) * self.drawscale,
        y = (self.y + self.height * 0.5) * self.drawscale
    }
end

return Player
