function love.load()
    score = 0

    button = {}
    button.x = 100
    button.y = 100
    button.size = 50
end

function love.update(deltaTime)
end

function love.draw()
    love.graphics.setColor(1, 0.2, 0)
    love.graphics.circle("fill", button.x, button.y, button.size)

    love.graphics.setFont(love.graphics.newFont(40))
    love.graphics.setColor(1,1,1)
    love.graphics.print(score)
end


function love.mousepressed(x, y, mousebutton, istouch)
    if (mousebutton  == 1)
    then
        if (distanceBetween(x, y, button.x, button.y) < button.size) 
        then
            score = score + 1
        else if(score > 0) then
            score = score - 1
        end
        end

        button.x = math.random(button.size, (love.graphics.getWidth() - button.size))
        button.y = math.random(button.size, (love.graphics.getHeight() - button.size))
    end
end



function distanceBetween(x1, y1, x2, y2)
   return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
