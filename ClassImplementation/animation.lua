require("class")

local Animation = Class:create("Animation")

function Animation:constructor(label, spritesheet, width, height, duration)
    self.label = string.lower((label or ""))
    self.spritesheet = love.graphics.newImage(spritesheet)
    self.width = width
    self.height = height
    self.duration = duration
    self.length = 0
    self.currentTime = 0
    self.currentFrame = 0
    self.quads = {}
    self.spritesheet:setFilter("nearest", "nearest")
    self.set_quads(self)
    
    return Animation
end
function Animation:set_quads()
    for y = 0, self.spritesheet:getHeight() - self.height, self.height do
        for x = 0, self.spritesheet:getWidth() - self.width, self.width do
            table.insert(
                self.quads,
                love.graphics.newQuad(x, y, self.width, self.height, self.spritesheet:getDimensions())
            )
        end

        self.length = #self.quads
    end
end

function Animation:play(dt)
    self.currentTime = self.currentTime + dt

    if self.currentTime >= self.duration then
        self.currentTime = self.currentTime - self.duration
    end

    self.currentFrame = math.floor(self.currentTime / self.duration * self.length) + 1
end

return Animation
