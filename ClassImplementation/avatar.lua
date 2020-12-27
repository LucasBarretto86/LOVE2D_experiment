local Animation = require("animation")
local Avatar = Class:create("Avatar")

function Avatar:constructor(name, width, height)
    self.name = name
    self.width = width
    self.height = height
    self.animations = {}
    self.animation = {}
end

function Avatar:setAnimation(label)
    if (#self.animations > 0) then
        for index = 1, #self.animations, 1 do
            if (self.animations[index].label == string.lower(label)) then
                self.animation = self.animations[index]
                self.animation:reset()
            end
        end
    end
end

function Avatar:addAnimation(label, frames_count, duration, loop)
    local spritesheet_path = self.name .. "/" .. label .. ".png"
    table.insert(
        self.animations,
        Animation:new(label, spritesheet_path, self.width, self.height, frames_count, duration, loop)
    )
end

return Avatar
