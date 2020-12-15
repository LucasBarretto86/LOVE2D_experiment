_G.Class = {}

Class.__index = Class

function Class:create(name)
    local class = {}
    class.__index = class
    class.super = self
    class.name = name
    setmetatable(class, self)
    return class
end

function Class:new(...)
    local class = setmetatable({}, self)
    class:constructor(...)
    return class
end

function Class:constructor(...)
end