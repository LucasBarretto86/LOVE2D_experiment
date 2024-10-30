# Learning LUA

- [Learning LUA](#learning-lua)
  - [Interactive Mode](#interactive-mode)
    - [Load external files](#load-external-files)
    - [Running multiple chunks on interactive mode](#running-multiple-chunks-on-interactive-mode)
  - [Lexical Conventions](#lexical-conventions)
  - [Chunks](#chunks)
  - [Variables](#variables)
    - [Global variables](#global-variables)
    - [Local variables](#local-variables)
  - [Types and values](#types-and-values)
    - [String](#string)
    - [Number](#number)
    - [Boolean](#boolean)
    - [Table](#table)
    - [Array - Numeric indexed tables](#array---numeric-indexed-tables)
  - [Operators](#operators)
    - [`:` self operator](#-self-operator)
    - [`#` unary operator](#-unary-operator)
  - [Hello World](#hello-world)
  - [Loops / Iterators](#loops--iterators)
    - [`for` Loop](#for-loop)
    - [`for in` Loop](#for-in-loop)
    - [`pair` and `ipair` iterators](#pair-and-ipair-iterators)
  - [`if` Statement](#if-statement)
  - [Math](#math)
  - [References](#references)

Lua is a lightweight, high-level, multi-paradigm programming language designed primarily for embedded use in applications. Lua is cross-platform, since the interpreter of compiled bytecode is written in ANSI C, and Lua has a relatively simple C API to embed it into applications.

---

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

1. **Variable Naming**:
   - Use lowercase letters and underscores for variable names (snake_case).
   - Example: `my_variable`, `player_health`, `max_iterations`.

2. **Function Naming**:
   - Use lowercase letters and underscores for function names (snake_case).
   - Example: `calculate_damage`, `draw_menu`, `update_player_position`.

3. **File and Directory Naming**:
   - Use lowercase letters and underscores for file and directory names.
   - Example: `main.lua`, `utils.lua`, `lua_scripts/`, `data_files/`.

4. **Indentation**:
   - Use consistent indentation (usually 4 spaces or a tab) for code blocks to improve readability.

5. **Commenting**:
   - Use comments (`--` for single-line comments, `--[[ ... ]]` for multi-line comments) to document your code, explaining its purpose, logic, and any important details.

6. **Global Variables**:
   - Avoid excessive use of global variables to prevent naming conflicts and improve code maintainability.
   - Use local variables whenever possible within functions and limit the scope of variables to where they are needed.
   - Example:
  
     ```lua
     local global_variable = 10
     function my_function()
         local local_variable = 20
     end
     ```

7. **Code Organization**:
   - Organize code into logical modules or files based on functionality.
   - Use modules and require statements to manage dependencies and keep related code together.
   - Example:
  
     ```lua
     -- main.lua
     local utils = require("utils")
     ```

8. **Error Handling**:
   - Use assert or error functions for error handling to catch and handle unexpected conditions in your code.
   - Handle errors gracefully to prevent crashes and improve user experience.
   - Example:

     ```lua
     local result = calculate_value()
     assert(result ~= nil, "Error: Calculation result is nil")
     ```

9. **Code Readability**:
   - Write clear and concise code with meaningful variable and function names.
   - Use whitespace and formatting to improve readability, such as consistent indentation and spacing.
   - Example:

     ```lua
     local function calculate_total_damage(player)
         -- Calculate total damage here
     end
     ```

## Chunks

Each piece of code that Lua execute is a chunk. Chunk simply is a sequence of statements.

```lua
a = 1 ; b = a*2
```

## Variables

### Global variables

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

### Local variables

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

Table in lua is a general term for Lua's data structure that can hold key-value pairs of various types, including arrays (with numerical indices) and associative arrays (with non-numeric keys). Tables are highly versatile and can be used for a wide range of data storage and manipulation tasks.

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

### Array - Numeric indexed tables

Array typically refers to a table with numerical indices used for storing ordered collections of elements, following Lua's convention of starting indices at 1.

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

### `:` self operator

The `:` it's called self operator, is used to implicitily send to a function the caller of this function itself as it's first arg

```lua
 image:getHeight();
```

### `#` unary operator

The `#` it's called unary operator and it's used to returns the length from string or tables

```lua
local str = "Hello, Lua!"
print(#str)  -- Outputs: 12

local tbl = {10, 20, 30, 40}
print(#tbl)  -- Outputs: 4
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

### `for` Loop

`for` loop in lua is a little bit different, first set the initial state, after you set the minimum or maximum value to be reached and then you set a incrementational ratio

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

### `for in` Loop

`for-in` is used to iterate in tables

```lua
- Notice the usage from iparis to iterate which key/value

local lines = {
  title = "Green is true",
  subtitle = "Keep your green friend really close.",
  content = "Lorem ipsum dolor sit amet consectetur adipisicing elit."
}

-- pairs for non numeric keys
for key, value in pairs(lines) do
  print(key, value)
end
```

**Outpu:**

```mono
title   Green is true
subtitle        Keep your green friend really close.
content Lorem ipsum dolor sit amet consectetur adipisicing elit.
```

### `pair` and `ipair` iterators

**`pairs`:**

Is a iterator function iterates over all key-value pairs in a table, regardless of whether the keys are numerical or not. It does not guarantee any specific order of iteration.

**`ipairs`:**

Is a iterator function specifically iterates over the numerical indices (keys starting from 1) and their corresponding values in the array part of a table. It guarantees that the iteration will be in ascending order of indices.

## `if` Statement

`if` statement on Lua is very straight forward

```lua

local is_green
```

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
- [Lua.org - Documentation](https://www.lua.org/manual/5.4/)
- [Game development](https://www.youtube.com/watch?v=I549C6SmUnk)
