local Frame = require("frame")
local Animation = Class:create("Animation")

function Animation:constructor(label, spritesheet_path, width, height, frames_count, duration)
    self.label = string.lower(label or "")
    self.spritesheet = love.graphics.newImage(IMAGES_PATH .. spritesheet_path)
    self.spritesheet:setFilter("nearest", "nearest")
    self.frames = {}
    self.frame = {}
    self.startTicking = 0
    self.time = 0
    self:setFrames(width, height, frames_count, duration)
end

function Animation:setFrames(width, height, frames_count, duration)
    local sprite = {
        width = width,
        height = height,
        offset = {x = -width, y = 0}
    }

    for index = 1, frames_count, 1 do
        sprite.position = index
        sprite.offset.x = sprite.offset.x + width

        table.insert(self.frames, Frame:new(sprite, self.spritesheet, duration, frames_count))
    end

    self.frame = self.frames[1]
end

function Animation:nextFrame()
    if self.frame.position < #self.frames then
        return self.frames[self.frame.position + 1]
    end

    return self.frames[1]
end

function Animation:play(deltaTime)
    self.time = self.time + deltaTime

    if self.time >= self.frame.duration then
        self.time = self.time - self.frame.duration
        self.frame = self:nextFrame()
    end
end

return Animation
