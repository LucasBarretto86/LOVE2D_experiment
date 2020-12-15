# LOVE 2D Game development

## LUA STATEMENTS
### `Paradigms / Syntax and etc..`
#### `: operator`
The `:` it's called self operator, is used to implicitily send to a function the caller of this function itself as it's first arg 
~~~
 image:getHeight();
~~~
#### `# operator`
The `#` it's called unary operator it returns the length from a table type objects = {
    
} 
~~~
 image:getHeight();
~~~
#

### `Iterations / Loops`
#### `For Loop`
for loop in lua is a little bit different, first set the initial state, after you set the minimum or maximum value to be reached and then you set a incrementational ratio
~~~
for i = 0, 10, 1 do 
    print(i) 
end
~~~

~~~
$lua main.lua
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
~~~
#
### `Debugging`
#### `Print on console`
~~~
    print("any text")
~~~
#

### `Running Love2d Game`
All game in Love is created inside a `main.lua` file, to run it you have to call love specifying the folder containing it.

~~~
#../MyGame/main.lua

love MyGame
~~~
#

### `Configuring general stuff and modules before loads`
Love also accept previews configurantion and modules imports, for that we use a additional file called `conf.lua`, inside this file we call a function `love.conf(t)` where we will put or configuration like window initial width, height, if it will allow joysticks and etc.. There's lots of configurations so all this kind of stuff seems to go there.

~~~
function love.conf(t)
    t.window.width = 1024
    t.window.height = 768
    t.modules.joysticks = true
    t.modules.physics = false 
end
~~~
#

### `Main functions`
#### love.load()
This is a function used to instantiate all global variables, window viewports, resolution and etc in love before the game starts
#

#### love.update()
This is a function that will run 60 times per second executing the game logics itself 

#### love.draw()
It's the fuction tha will render all the graphical elements we will see in our game, this function also run 60 per second

~~~
function love.load()
    number = 0 --instantiating number variable
end

function love.update(deltaTime)
    number = number + 1  --every frame our global variable will be increased by 1
end

function love.draw()
    love.graphics.print(number) --prints our variable value every frame
end
~~~
#

### Drawing shapes
Love has a very intuitive way to draw shapes it has rectangles, circles, arcs, ellipses and etc... Each shape names a function, so it's intuitive, check: https://love2d.org/wiki/love.graphics
#

#### Rectangle
~~~
love.graphics.rectangle("line", 0, 0, 32, 16)
~~~

Draws a white rectangle, where it's initial x and y coordinate are on pixel 0 from screen then it extends horizontally 32 pixels and vertically 16 pixels, this shape is outlined. To maked it filled, the first arg should be `fill`
#

#### Circle
~~~
love.graphics.circle("line", 16, 16, 8)
~~~

Draws a white circle, where it's center x and y coordinate are on pixel 0 from screen then it has radius of 8 pixels each means we have a circile of 16x16.
#

### Class Implementation
Lua doesn't have class orientend structure, since it's based in C, however it's possible to achieve that by creating a local that will be like a backbone for classes.