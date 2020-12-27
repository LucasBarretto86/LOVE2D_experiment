local Frame = Class:create("Frame")

function Frame:constructor(sprite, spritesheet, duration, animation_length)
    self.quad =
        love.graphics.newQuad(
        sprite.offset.x,
        sprite.offset.y,
        sprite.width,
        sprite.height,
        spritesheet:getDimensions()
    )
    self.position = sprite.position
    self.animation_length = animation_length
    self.duration = self:setDuration(duration)
end

function Frame:setDuration(duration)
    if (type(duration) == "table") then
        return duration[self.position]
    else
        return duration / self.animation_length
    end
end

return Frame
