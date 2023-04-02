# Learning LUA

Lua (/ˈluːə/ LOO-ə; from Portuguese: lua [ˈlu.(w)ɐ] meaning moon) is a lightweight, high-level, multi-paradigm programming language designed primarily for embedded use in applications. Lua is cross-platform, since the interpreter of compiled bytecode is written in ANSI C, and Lua has a relatively simple C API to embed it into applications.

[References](#references)

- [Learning LUA](#learning-lua)
  - [Interactive Mode](#interactive-mode)
    - [Load external files](#load-external-files)
    - [Running multiple chunks on interactive mode](#running-multiple-chunks-on-interactive-mode)
  - [Lexical Conventions](#lexical-conventions)
  - [Chunks](#chunks)
  - [Variables](#variables)
  - [Types and values](#types-and-values)
    - [String](#string)
    - [Number](#number)
    - [Boolean](#boolean)
    - [Table](#table)
  - [Operators](#operators)
  - [Hello World](#hello-world)
  - [Loops / Iterators](#loops--iterators)
    - [For Loop](#for-loop)
  - [if Statement](#if-statement)
  - [Math](#math)
  - [References](#references)

## Interactive Mode

Similar to python and some other languages lua has it's own live interpreter to enter the interpreter/interactive mode just type `lua` on terminal without any paramenter

```shell
$ lua
Lua 5.4.4  Copyright (C) 1994-2022 Lua.org, PUC-Rio
> print("Teste")
Teste
```

### Load external files

Inside the interpreter you can load and run external files using the `dofile` function

```lua
-- hello_world.lua

print("Hello World")
```

```shell
$ lua
Lua 5.4.4  Copyright (C) 1994-2022 Lua.org, PUC-Rio
> dofile("src/hello_world.lua")
```

### Running multiple chunks on interactive mode

To run multiple modules that may have relation one to another use the option flag `-l` for each module path in order without lua extension

```shell
$ lua -lLearning.for_loop -lLearning.hello_world
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
Hello World
Lua 5.4.4  Copyright (C) 1994-2022 Lua.org, PUC-Rio
>
```

note it will always starts interactive mode afterwards but you can use option flag `-i` to intialize the interative mode and load the files and run it within

```shell
$ lua -lLearning.for_loop -lLearning.hello_world -i
Lua 5.4.4  Copyright (C) 1994-2022 Lua.org, PUC-Rio
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
Hello World
> 
```

## Lexical Conventions

- Lua is case sentive

- Do not name functions or variables staring with `_`

- Single cararacter variables are only used for indexes within an iteration

- Single underscore (`_`) is a dummy variable like in ruby, it keeps the value from the last function return

- Lua uses the keyword `function` and `end` to define methods

    ```lua
    function function_name(args)
        -- do stuff here
    end
    ```

- Lua handle code blocks similar to ruby using the keywords `do` and `end`

    ```lua
    for 1 = 0, 10, 1 do
        -- do stuff here
    end
    ```

- Semicolon may optionally follow any statement, by convetion semicolons are used to separate two or more statements written in the same line

- Reserved keywords

    ```nil
    and       break     do        else      elseif
    end       false     for       function  if
    in        local     nil       not       or
    repeat    return    then      true      until
    while
    ```

- To comment a single line is used `--` and for comment blocks `--[[` and  `--]]`

    ```lua
    print("Hello") -- Single line comment

    --]]
    -- Block comment
      print("Hello")
    --]]
    ```

## Chunks

Each piece of code that Lua execute is a chunk. Chunk simply is a sequence of statements.

```lua
a = 1 ; b = a*2
```

## Variables

Global variables

to set global variables simple name it and assign a value, by convention global variables starts with capital letter

```lua
-- global_variable.lua

Name = "Lucas"

print(name)
```

```shell
$ lua src/global_variable.lua

Lucas
```

Local variables

to set local variables use the keyword `local` follow by it's name

```lua
-- local_variable.lua

local full_name = "Lucas Barretto e Silva"

print(full_name)
```

```shell
$ lua src/local_variable.lua

Lucas Barretto e Silva
```

## Types and values

| Values        |   Type   | Obs.                                           |
| :------------ | :------: | :--------------------------------------------- |
| "Hello"       |  string  |                                                |
| 10.4          |  number  |                                                |
| print         | function |                                                |
| type          | function |                                                |
| true          | boolean  |                                                |
| nil           |   nil    |                                                |
| type(type(x)) |  string  | because the return of type is always a string. |
| type(a)       |   nil    | because 'a' is not initialized                 |

### String

String can be defined using single or double quotes, strings in lua also na use C-like escapes

| C-like escapes | Description     |
| :------------- | :-------------- |
| \a             | bell            |
| \b             | back space      |
| \f             | form feed       |
| \n             | newline         |
| \r             | carriage return |
| \t             | horizontal tab  |
| \v             | vertical tab    |
| \\             | backslash       |
| \"             | double quote    |
| \'             | single quote    |

Formatting strings

Lua also have methods to handle formatted strings just like C and Java, method `string.format(string, args)`

```lua
-- string.lua

print(string.format( "Number %d", 100))
```

```shell
$ lua src/string.lua 

Number: 100
```

### Number

In Lua there's no interger the number type is a real (double-precision floating-point)

We can write numeric constants with an optional decimal part, plus an optional decimal exponent. Examples of valid numeric constants are:

|   4   |  0.4  | 4.57e-3 | 0.3e12 | 5e+20 |
| :---: | :---: | :-----: | :----: | :---: |

### Boolean

Basic `true` and `false`, although `nil` is considered `false` in conditional statements empty strings and 0 are considered `true`

### Table

Table type in lua an associative array, can be indexed by numers and strings, similar to a hash in ruby and dictionary in python, tables are the only data strucuring mechanism in Lua, there's no regular Array in Lua. Table aren't variables they are objects.

You create tables by means of a constructor expression `{}`:

```lua
local alien_0 = {
  color = "green",
  points = 5
}

print(alien_0.color)
print(alien_0["points"])
```

```shell
$ lua src/table.lua

green
5
```

Table can be changed and incremented dinamically

```lua
local alien_0 = {
  color = "green",
  points = 5
}
alien_0["x"] = 25
alien_0.y = 0

print(alien_0.x)
print(alien_0.y)
```

```shell
$ lua src/table.lua

25
0
```

Tables are only referenced by local variables there's no direct relation between variables and tables, which means that a single table can be referenced by n number of variables, variables only stores the memory address from a table and sets the pointer to that address, it doesn't references the table itself.

```lua
local a = {name = "Thomas"}
local b = a

print(a)
print(b)

a.name = "Johnny"
print(b.name)
```

```shell
$ lua src/table.lua

table: 0x55bced1e1ef0
table: 0x55bced1e1ef0
Johnny
```

Numeric indexed tables

Numeric indexed tables is the closes we can get to a regular Array of values, to have numeric indexes tables we have to instanciate which index by hand

```lua
cart = {}
cart.items = {}
cart.items[1] = "Phaser Gun"
cart.items[2] = "Medic Kit"
cart.items[3] = "Coins"

for index, item in ipairs(cart.items) do
  print(index, item)
end
```

```shell
$ lua src/table.lua

1       Phaser Gun
2       Medic Kit
3       Coins
```

## Operators

`:` self operator

The `:` it's called self operator, is used to implicitily send to a function the caller of this function itself as it's first arg

```lua
 image:getHeight();
```

`#` unary operator

The `#` it's called unary operator it returns the length from a table type

```lua

```

## Hello World

```lua
print("Hello World")
```

```shell
$ lua src/hello_world.lua

Hello World
```

## Loops / Iterators

### For Loop

for loop in lua is a little bit different, first set the initial state, after you set the minimum or maximum value to be reached and then you set a incrementational ratio

```lua
for i = 0, 10, 1 do 
    print(i) 
end
```

```shell
$ lua src/for_loop.lua
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

## if Statement

## Math

Math lib for Lua

```lua
math.sqrt(3)
```

```shell
$ lua src/math.lua 

3.0
```

## References

- [Lua (programming language) - Wiki](https://en.wikipedia.org/wiki/Lua_(programming_language))
- [Lua.org - Official website](https://www.lua.org/)
- [Game development](https://www.youtube.com/watch?v=I549C6SmUnk)
