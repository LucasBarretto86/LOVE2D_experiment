function love.load()
    obj = {
        width = 50,
        height = 50,
        x = 250,
        y = 250,
        moves = {
            left = false,
            right = true,
            up = false,
            down = false,
        },
        
        collides = {
            left = false,
            right = false,
            top = false,
            bottom = false
        }
    }
end

function love.update(dt)
    if (obj.moves.right) then
        if (not obj.collides.right) then
            obj.x = obj.x + 5
        else
            obj.moves.right = false
            obj.moves.left = true
            changeColor()
        end
    else
        if (not obj.collides.left) then
            obj.x = obj.x - 5
        else
            obj.moves.right = true
            obj.moves.left = false
            changeColor()
        end
    end
    isCollingWithBoundary(obj)
end

function love.draw()
    love.graphics.rectangle("fill", getAnchorX(obj), getAnchorY(obj), obj.width, obj.height)
end

-- COLLISION
function isCollingWithBoundary(object)
    if (getAnchorX(object) + object.width == love.graphics.getWidth()) then 
        object.collides.right = true
        object.collides.left = false
    end
    
    if (getAnchorX(object) == 0) then 
        object.collides.left = true
        object.collides.right = false
    end

    if (getAnchorY(object) + object.height == love.graphics.getHeight()) then 
        object.collides.bottom = true
        object.collides.top = false
    end
    
    if (getAnchorY(object) == 0) then 
        object.collides.top = true
        object.collides.bottom = false
    end
end

-- OBJECTS
function getAnchorX(object)
    return object.x - (object.width / 2)
end

function getAnchorY(object)
    return object.y - (object.height / 2)
end

-- OTHERS
function  changeColor()
    love.graphics.setColor(math.random(),math.random(),math.random())
    obj.changeColor = false
end