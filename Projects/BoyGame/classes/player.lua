local Avatar = require("classes.avatar")
local Player = Class:create("Player")

function Player:constructor(width, height, orientation)
    self.x = 0
    self.y = 0
    self.width = width
    self.height = height
    self.state = "idle"
    self.flipped = false
    self.orientation = 1 or orientation
    self.avatar = {}
end

function Player:draw()
    love.graphics.draw(
        self.avatar.animation.spritesheet,
        self.avatar.animation.current_frame.quad,
        self:origin().x,
        self:origin().y,
        0,
        RENDER_SCALE * self.orientation,
        RENDER_SCALE,
        self.width * 0.5,
        self.height * 0.5
    )
end

function Player:setAvatar(name)
    self.avatar = Avatar:new(name, self.width, self.height, self)
end

function Player:setState(state)
    self.state = string.lower(state)
end

function Player:flip(flip)
    self.flipped = flip

    if self.flipped then
        self.orientation = -1
    else
        self.orientation = 1
    end
end

function Player:origin()
    return {
        x = (self.x + self.width * 0.5) * RENDER_SCALE,
        y = (self.y + self.height * 0.5) * RENDER_SCALE
    }
end

return Player
