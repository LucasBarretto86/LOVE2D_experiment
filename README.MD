# LUA / LOVE Framework

- [LUA / LOVE Framework](#lua--love-framework)
  - [LUA Languange](#lua-languange)
    - [Syntax](#syntax)
      - [Functions](#functions)
      - [Code Block](#code-block)
      - [`:` self operator](#-self-operator)
      - [`#` unary operator](#-unary-operator)
    - [Hello World](#hello-world)
    - [Loops / Iterators](#loops--iterators)
      - [For Loop](#for-loop)
    - [Math](#math)
  - [LOVE Framework](#love-framework)
  - [Running Game](#running-game)
  - [Configuring general stuff and modules before loads](#configuring-general-stuff-and-modules-before-loads)
  - [Main functions](#main-functions)
    - [load](#load)
    - [update](#update)
    - [draw](#draw)
  - [Drawing shapes](#drawing-shapes)
    - [Rectangle](#rectangle)
    - [Circle](#circle)
  - [Class Implementation](#class-implementation)
  - [References](#references)

## LUA Languange

Lua (/ˈluːə/ LOO-ə; from Portuguese: lua [ˈlu.(w)ɐ] meaning moon) is a lightweight, high-level, multi-paradigm programming language designed primarily for embedded use in applications. Lua is cross-platform, since the interpreter of compiled bytecode is written in ANSI C, and Lua has a relatively simple C API to embed it into applications.

[References](#references)

### Syntax

#### Functions

Lua syntax is very similar to ruby and python but the keyword for functions is `function` and `end`  not `def` like ruby and python or brackets like other languages

```lua
function any_function()
    -- do stuff here
end
```

#### Code Block

Lua also handle with blocks of code like ruby `do` and `end`

```lua
for 1 = 0, 10, 1 do
    -- do stuff here
end
```

#### `:` self operator

The `:` it's called self operator, is used to implicitily send to a function the caller of this function itself as it's first arg

```lua
 image:getHeight();
```

#### `#` unary operator

The `#` it's called unary operator it returns the length from a table type objects = {

}

```lua
 image:getHeight();
```

### Hello World

```lua
print("Hello World")
```

```shell
$ lua Learning/hello_world.lua

Hello World
```

### Loops / Iterators

#### For Loop

for loop in lua is a little bit different, first set the initial state, after you set the minimum or maximum value to be reached and then you set a incrementational ratio

```lua
for i = 0, 10, 1 do 
    print(i) 
end
```

```shell
$ lua for_loop.lua
0
1
2
3
4
5
6
7
8
9
10
```

### Math

Math lib for Lua

```lua
math.sqrt(3)
```

```shell
$ lua Learning/Math/main.lua 

3.0
```

## LOVE Framework

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

## Class Implementation

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

- [Lua (programming language) - Wiki](https://en.wikipedia.org/wiki/Lua_(programming_language))
- [Lua.org - Official website](https://www.lua.org/)
- [LÖVE (game engine) - Wiki](https://en.wikipedia.org/wiki/L%C3%B6ve_(game_engine))
- [LÖVE - Official website](https://love2d.org/)
- [LÖVE 3D](https://github.com/groverburger/g3d)
