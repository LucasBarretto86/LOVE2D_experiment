local Frame = Class:create("Frame")

function Frame:constructor(sprite, spritesheet, duration, factor)
    self.quad =
        love.graphics.newQuad(
        sprite.offset.x,
        sprite.offset.y,
        sprite.width,
        sprite.height,
        spritesheet:getDimensions()
    )
    self.position = sprite.position
    self.duration = self:setDuration(duration, factor)
end

function Frame:setDuration(duration, factor)
    if (type(duration) == "table") then
        return duration[self.position]
    else
        return duration / factor
    end
end

return Frame
