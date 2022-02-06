local utf8 = require("utf8")
local font = love.graphics.newFont("assets/fonts/Consolas.ttf", 24, "normal", love.graphics.getDPIScale())
local text = love.graphics.newText(font)
local textchain = ""

function love.load()
    love.keyboard.setKeyRepeat(true)
end

function love.draw()
    love.graphics.draw(text)
end

function love.textinput(input)
    local originaltext = textchain
    textchain = textchain .. input
    text:set(textchain)

    if (text:getWidth() < love.graphics.getWidth()) then
        textchain = originaltext .. "\n" .. input
        text:set(textchain)
    end
end

function love.keypressed(key)
    if key == "backspace" then
        local byteoffset = utf8.offset(textchain, -1)

        if byteoffset then
            textchain = string.sub(textchain, 1, byteoffset - 1)
            text:set(textchain)
        end
    end
end
