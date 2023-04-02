-- Table
-- Kinda like Hash in Ruby and Dictionary in Python it's the only data structing mechanism in Lua, tables are basically objects

local alien_0 = {
  color = "green",
  points = 5
}

print(alien_0.color)
print(alien_0["points"])
print(alien_0)

-- Assign new keys and values
alien_0["x"] = 25
alien_0.y = 0

print(alien_0.x)
print(alien_0.y)

-- Tables and local variables allocation
local a = {name = "Thomas"}
local b = a

print(a)
print(b)

a.name = "Johnny"
print(b.name)

-- Numeric indexed Tables, the closes you can get to regular arrays
local cart = {}
cart.items = {}
cart.items[1] = "Phaser Gun"
cart.items[2] = "Medic Kit"
cart.items[3] = "Coins"

for index, item in ipairs(cart.items) do
  print(index, item)
end
