Class = {}
Class.__index = Class

function Class:create(classname)
    local class = {}
    class.__index = class
    class.super = self
    class.classname = classname
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

function Class:getClassname()
    return self.classname
end
