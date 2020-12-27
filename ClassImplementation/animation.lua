local Frame = require("frame")
local Animation = Class:create("Animation")

function Animation:constructor(label, spritesheet_path, width, height, frames_count, duration, loop)
    self.label = string.lower(label or "")
    self.spritesheet = love.graphics.newImage(IMAGES_PATH .. spritesheet_path)
    self.frames = {}
    self.frame = {}
    self.length = frames_count
    self.time = 0
    self.loop = loop
    self.state = "loaded"
    self.spritesheet:setFilter("nearest", "nearest")
    self:setFrames(width, height, frames_count, duration)
end

function Animation:setState(state)
    self.state = state
end

function Animation:getState()
    if self.frame.position < self.length then
        return "playing"
    end

    if self.frame.position >= self.length then
        return "ended"
    end

    if self.paused then
        return "paused"
    end
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

function Animation:getFrame()
    if self.frame.position < self.length then
        return self.frames[self.frame.position + 1]
    end

    return self.frames[1]
end

function Animation:play(deltaTime)
    if self.state ~= "ended" or self.loop then
        self.time = self.time + deltaTime

        if self.time >= self.frame.duration then
            self.time = self.time - self.frame.duration
            self.frame = self:getFrame()
            self.state = self:getState()
        end
    end
end

return Animation
