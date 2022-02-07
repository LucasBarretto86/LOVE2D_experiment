local Sound = Class:create("SFX")
function Sound:constructor(label, path, frame_trigger)
    self.label = label
    self.frame_trigger = frame_trigger or 0
    self.sound = love.audio.newSource(SFX_PATH .. path, "static")
end

function Sound:play(frame_count)
    if self.frame_trigger == frame_count then
        love.audio.play(self.sound)
    end
end

return Sound
