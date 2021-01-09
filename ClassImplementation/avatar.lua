local Animation = require("animation")
local SFX = require("sfx")
local Avatar = Class:create("Avatar")

function Avatar:constructor(name, width, height)
    self.name = name
    self.width = width
    self.height = height
    self.animations = {}
    self.animation = {}
end

function Avatar:addAnimation(label, frames_count, duration, loop, has_sfx, delay)
    local spritesheet_path = self.name .. "/" .. label .. ".png"
    local sfx = nil

    if (has_sfx) then
        sfx = self:newSFX(label, delay or 0)
    end

    table.insert(
        self.animations,
        Animation:new(label, spritesheet_path, self.width, self.height, frames_count, duration, loop, sfx)
    )
end

function Avatar:setAnimation(label)
    if #self.animations <= 0 then
        return
    end

    if (label ~= self.animation.label and (not self:hasAnimationPlaying() or self.animation.loop)) then
        for index = 1, #self.animations, 1 do
            if (self.animations[index].label == string.lower(label)) then
                self.animation = self.animations[index]
                self.animation:reset()
            end
        end
    end
end

function Avatar:playAnimation(deltaTime)
    self.animation:play(deltaTime)
end

function Avatar:hasAnimationPlaying()
    if self.animation.state == "playing" or self.animation.state == "looped" then
        return true
    end

    return false
end

function Avatar:newSFX(label, delay)
    local sfx_path = self.name .. "/" .. label .. ".wav"
    return SFX:new(label, sfx_path, delay)
end

return Avatar
