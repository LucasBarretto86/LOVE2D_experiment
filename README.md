# Learning LÖVE

- [Learning LÖVE](#learning-löve)
  - [Running Game](#running-game)
  - [Configuring general stuff and modules before loads](#configuring-general-stuff-and-modules-before-loads)
  - [Main functions](#main-functions)
    - [load](#load)
    - [update](#update)
    - [draw](#draw)
  - [Drawing shapes](#drawing-shapes)
    - [Rectangle](#rectangle)
    - [Circle](#circle)
  - [Implementing class](#implementing-class)
  - [References](#references)
  - [Snippets](#snippets)
    - [Centralized Anchors](#centralized-anchors)
    - [MATH](#math)
      - [Diference between two "points"](#diference-between-two-points)
    - [Class Implementation](#class-implementation)
      - [`class.lua`](#classlua)
      - [usage `sfx.lua`](#usage-sfxlua)

## Running Game

All game in Love is created inside a `main.lua` file, to run it you have to call love specifying the folder containing it.

```lua
$../MyGame/main.lua

love MyGame
```

## Configuring general stuff and modules before loads

Love also accept previews configurantion and modules imports, for that we use a additional file called `conf.lua`, inside this file we call a function `love.conf(t)` where we will put or configuration like window initial width, height, if it will allow joysticks and etc.. There's lots of configurations so all this kind of stuff seems to go there.

```lua
function love.conf(t)
    t.window.width = 1024
    t.window.height = 768
    t.modules.joysticks = true
    t.modules.physics = false 
end
```

## Main functions

### load

This is a function used to instantiate all global variables, window viewports, resolution and etc in love before the game starts

### update

This is a function that will run 60 times per second executing the game logics itself

### draw

It's the fuction tha will render all the graphical elements we will see in our game, this function also run 60 per second

```lua
function love.load()
    number = 0 --instantiating number variable
end

function love.update(deltaTime)
    number = number + 1  --every frame our global variable will be increased by 1
end

function love.draw()
    love.graphics.print(number) --prints our variable value every frame
end
```

## Drawing shapes

Love has a very intuitive way to draw shapes it has rectangles, circles, arcs, ellipses and etc... Each shape names a function, so it's intuitive, check: <https://love2d.org/wiki/love.graphics>

### Rectangle

```lua
love.graphics.rectangle("line", 0, 0, 32, 16)
```

Draws a white rectangle, where it's initial x and y coordinate are on pixel 0 from screen then it extends horizontally 32 pixels and vertically 16 pixels, this shape is outlined. To maked it filled, the first arg should be `fill`

### Circle

```lua
love.graphics.circle("line", 16, 16, 8)
```

Draws a white circle, where it's center x and y coordinate are on pixel 0 from screen then it has radius of 8 pixels each means we have a circile of 16x16.

## Implementing class

Lua doesn't have class orientend structure, since it's based in C, however it's possible to achieve that by creating a local table that will be like a backbone a factory for new tables class-ish.

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

## References

- [LÖVE (game engine) - Wiki](https://en.wikipedia.org/wiki/L%C3%B6ve_(game_engine))
- [LÖVE - Official website](https://love2d.org/)
- [LÖVE 3D](https://github.com/groverburger/g3d)

## Snippets

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

### MATH

#### Diference between two "points"

Method to check if two points(a point is a combination from coordinates x, y) have a delta between their positions

```lua
function distanceBetween(x1, y1, x2, y2)
   return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
```

### Class Implementation

An example of class implementation a usage

#### `class.lua`

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

#### usage `sfx.lua`

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
