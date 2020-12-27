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
        newAnimation("idle", "assets/sprites/boy.png", 32, 32, 1),
        newAnimation("walking", "assets/sprites/boy.png", 32, 32, 1),
        newAnimation("running", "assets/sprites/boy.png", 32, 32, 1),
        newAnimation("jumping", "assets/sprites/boy.png", 32, 32, 1)
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

function newAnimation(label, spritesheet, width, height, duration)
    -- Creates animation table
    local animation = {
        label = string.lower((label or "")),
        spritesheet = love.graphics.newImage(spritesheet), -- Create image object using the imagePath for an spritesheet given
        width = width,
        height = height,
        duration = duration, --Defines whole animation duration
        length = 0, --Will defines the length of our animation
        time = 0, --Animation frame time accumulator
        currentFrame = 0, --Animation frame number accumulator
        quads = {},
        play = function(self, dt)
            play(self, dt)
        end,
        set_quads = function(self)
            setQuads(self, self.width, self.height)
        end,
        set_filter = function(self, filter)
            self.spritesheet:setFilter(filter, filter)
        end
    }
    animation:set_filter("nearest")
    animation:set_quads()

    return animation
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

function setQuads(animation, width, height)
    for y = 0, animation.spritesheet:getHeight() - height, height do
        -- Lua for loops means = init, min/max, incremetation
        -- Gets spritesheet image height, then it substracts height to find the initial coordinate y from the image

        for x = 0, animation.spritesheet:getWidth() - width, width do
            -- Gets spritesheet image width, then it substracts width to find the initial coordinate x from the image

            table.insert(
                animation.quads,
                love.graphics.newQuad(x, y, width, height, animation.spritesheet:getDimensions())
            )
            -- inserts to the table animation.quads a new quad that correspond to each frame as it iterates
        end

        animation.length = #animation.quads
    end
end

function play(animation, dt)
    animation.time = animation.time + dt

    if animation.time >= animation.duration then
        animation.time = animation.time - animation.duration
    end

    animation.currentFrame = math.floor(animation.time / animation.duration * animation.length) + 1
end
