# SNIPPETS Worth to be saved

### Centralized Anchors

!Notice that by standard every obj is drawed from top left corner, that's why it has to be translated!

This is a method to translate obj.x -50% to allow it to be centralized when it gets drawed

```lua
function getAnchorX(object)
    return object.x - (object.width / 2)
end

```lua
This is a method to translate obj.y -50% to allow it to be centralized when it gets drawed

```lua
function getAnchorY(object)
    return object.y - (object.height / 2)
end
```

## MATH

### Diference between two "points"

Method to check if two points(a point is a combination from coordinates x, y) have a delta between their positions

```lua
function distanceBetween(x1, y1, x2, y2)
   return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
```

## Class Implementation

An example of class implementation a usage

### `class.lua`

```lua
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
```

### usage `sfx.lua`

```lua
local Sound = Class:create("SFX")
function Sound:constructor(label, path, frame_trigger)
    self.label = label
    self.frame_trigger = frame_trigger or 0
    self.sound = love.audio.newSource(SFX_PATH .. path, "static")
end

function Sound:play(frame_count)
    if self.frame_trigger == frame_count then
        love.audio.play(self.sound)
    end
end

return Sound
```
