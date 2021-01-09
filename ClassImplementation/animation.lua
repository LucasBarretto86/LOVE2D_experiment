local Frame = require("frame")
local Animation = Class:create("Animation")

function Animation:constructor(label, spritesheet_path, width, height, length, duration, loop, sfx)
    self.label = string.lower(label or "")
    self.spritesheet = love.graphics.newImage(IMAGES_PATH .. spritesheet_path)
    self.length = length
    self.loop = loop
    self.sfx = sfx
    self.frames = {}
    self.state = "loaded"
    self.current_frame = {}
    self.current_time = 0
    self.spritesheet:setFilter("nearest", "nearest")
    self:setFrames(width, height, length, duration)
end

function Animation:setFrames(width, height, length, duration)
    local sprite = {
        width = width,
        height = height,
        offset = {x = -width, y = 0}
    }

    for index = 1, length, 1 do
        sprite.position = index
        sprite.offset.x = sprite.offset.x + width
        table.insert(self.frames, Frame:new(sprite, self.spritesheet, duration, length))
    end

    self.current_frame = self.frames[1]
end

function Animation:play(deltaTime)
    if self.state ~= "finished" then
        self.current_time = self.current_time + deltaTime
        if self.current_time >= self.current_frame.duration then
            self.current_time = self.current_time - self.current_frame.duration
            self:nextFrame()
        end

        if self.sfx ~= nil then
            self.sfx:play(self.current_frame.position)
        end
    end
end

function Animation:nextFrame()
    if self.current_frame.position < self.length then
        self.state = "playing"
        self.current_frame = self.frames[self.current_frame.position + 1]
    elseif self.loop then
        self.state = "looped"
        self.current_frame = self.frames[1]
    else
        self.state = "finished"
        self.current_frame = self.frames[1]
    end
end

function Animation:isPlaying()
    if self.state == "playing" or self.state == "looped" then
        return true
    end

    return false
end

function Animation:isFinished()
    if self.state == "finished" then
        return true
    end

    return false
end

function Animation:reset()
    self.state = "loaded"
    self.current_frame = self.frames[1]
    self.current_time = 0
end

function Animation:allowedInterruption()
    if not self:isPlaying() or self.loop then
        return true
    end

    return false
end

return Animation
