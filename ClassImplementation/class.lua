_G.Class = {}

Class.__index = Class

function Class:new()
    local instance = {}
    instance.__index = instance
    instance.super = self
    setmetatable(instance, self)
    return instance
end

function Class:constructor()
end

function Class:__call(...) --metamethod
    local instance = setmetatable({}, self)
    instance:constructor(...)
    return instance
end
