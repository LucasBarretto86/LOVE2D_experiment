require("class")

local Vector2 = Class:create("Vector2")

function Vector2:constructor(x, y)
    self.x = x or 0
    self.y = y or 0
end
