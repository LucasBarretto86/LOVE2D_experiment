require("class")
local Animation = require("animation")
local Avatar = Class:create("Avatar")

function Avatar:constructor(name, width, height)
    self.name = name
    self.width = width
    self.height = height
    self.animations = {}
    self.animation = {}
end

function Avatar:set_animation(label)
    local length = #self.animations
    if (length > 0) then
        for index = 1, #self.animations, 1 do
            if (self.animations[index].label == string.lower(label)) then
                self.animation = self.animations[index]
            end
        end
    end
end

function Avatar:add_animation(label, frames, duration)
    frames = frames - 1 
    local spritesheet = SPRITESHEETS_PATH .. self.name .. "/" .. label .. ".png"
    table.insert(self.animations, Animation:new(label, spritesheet, self.width, self.height, frames, duration))
end

return Avatar
