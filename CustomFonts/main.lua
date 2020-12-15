function love.load()
    name = string.upper("Fuck the police")
    font = love.graphics.newFont("assets/fonts/LucasFont.ttf", 30, "normal", love.graphics.getDPIScale())
end

function love.update()
    
end

function love.draw()
    love.graphics.setFont(font)
    love.graphics.print(name)
end