local Animation = require("animation")
local RENDER_SCALE = 4

local char = {
    x = 0,
    y = 0,
    orientation = 0,
    animations = {},
    animation = {},
    set_animation = function(self, label, mirrored)
        local flips = mirrored or false
        setAnimation(self, label, flips)
    end,
    draw = function(self)
        draw(self)
    end
}

function love.load()
    char.animations = {
        Animation:new("idle", "assets/sprites/boy.png", 32, 32, 1),
        Animation:new("walking", "assets/sprites/boy.png", 32, 32, 1),
        Animation:new("running", "assets/sprites/boy.png", 32, 32, 1),
        Animation:new("jumping", "assets/sprites/boy.png", 32, 32, 1)
    }
end

function love.update(dt)
    char:set_animation("idle")
    char.animation:play(dt)
end

function love.draw()
    char:draw()
end

function draw(drawable)
    love.graphics.draw(
        drawable.animation.spritesheet,
        drawable.animation.quads[drawable.animation.currentFrame],
        drawable.x,
        drawable.y,
        drawable.orientation,
        RENDER_SCALE
    )
end

function setAnimation(drawable, label, flips)
    local animation = {}
    if (#drawable.animations == 0) then
        return
    end

    for index = 1, #drawable.animations, 1 do
        animation = drawable.animations[index]

        if (animation.label == string.lower(label)) then
            drawable.animation = animation
        end
    end

    if flips == true then
        drawable.orientation = -1
    end
end
