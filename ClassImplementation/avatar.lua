local Animation = require("animation")
local SFX = require("sfx")
local Avatar = Class:create("Avatar")

function Avatar:constructor(name, width, height)
    self.name = name
    self.width = width
    self.height = height
    self.animations = {}
    self.animation = nil
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

    if (self.animation == nil or (self.animation.label ~= label and self.animation:allowedInterruption())) then
        for index = 1, #self.animations, 1 do
            if (self.animations[index].label == string.lower(label)) then
                self.animation = self.animations[index]
                self.animation:reset()
            end
        end
    end
end

function Avatar:playAnimation(deltaTime)
    if self.animation:isFinished() == true then
        self:setAnimation("idle") -- whole logic will change to followe player state based on behavioral logics
    end

    self.animation:play(deltaTime)
end

function Avatar:newSFX(label, delay)
    local sfx_path = self.name .. "/" .. label .. ".wav"
    return SFX:new(label, sfx_path, delay)
end

return Avatar
