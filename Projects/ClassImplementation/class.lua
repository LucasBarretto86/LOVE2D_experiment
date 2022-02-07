Class = {}
Class.__index = Class

function Class.create(self, classname)
    local class = {}
    class.__index = class
    class.super = self
    class.classname = classname
    setmetatable(class, self)
    return class
end

function Class.new(self, ...)
    local class = setmetatable({}, self)
    class:constructor(...)
    return class
end

function Class.init(...)
end

function Class.getClassname(self)
    return self.classname
end
