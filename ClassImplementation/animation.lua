require("class")
local Animation = Class:create("Animation")

function Animation:constructor(label, spritesheet, width, height, length, duration)
    self.label = string.lower(label or "")
    self.spritesheet = love.graphics.newImage(spritesheet)
    self.duration = duration
    self.currentTime = 0
    self.currentFrame = 0
    self.quads = {}
    self.spritesheet:setFilter("nearest", "nearest")

    for x = 0, (width * length), width do
        table.insert(self.quads, love.graphics.newQuad(x, 0, width, height, self.spritesheet:getDimensions()))
    end
end

function Animation:play(dt)
    self.currentTime = self.currentTime + dt

    if self.currentTime >= self.duration then
        self.currentTime = self.currentTime - self.duration
    end

    self.currentFrame = math.floor(self.currentTime / self.duration * #self.quads) + 1
end

return Animation