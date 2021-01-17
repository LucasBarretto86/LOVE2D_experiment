local Keyboard = {}

local key_states = {}

function Keyboard:update(deltaTime)
    for key, values in pairs(key_states) do
        key_states[key] = nil
    end
end

function Keyboard:addEventsListener()
    function love.keypressed(key, scancode, isrepeat)
        key_states[key] = true
    end

    function love.keyreleased(key, scancode)
        key_states[key] = false
    end
end

function Keyboard:key(key)
    return love.keyboard.isDown(key)
end

function Keyboard:keyPressed(key)
    return key_states[key]
end

function Keyboard:keyReleased(key)
    return key_states[key] == false
end

return Keyboard
