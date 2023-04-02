-- For in
-- Notice the usage from iparis to iterate which key/value

local lines = {
  title = "Green is true",
  subtitle = "Keep your green friend really close.",
  content = "Lorem ipsum dolor sit amet consectetur adipisicing elit."
}

-- pairs for non numeric keys
for key, value in pairs(lines) do
  print(key, value)
end


-- ipairs for numeric table
local positions = {}

positions[1] = "Thomas"
positions[2] = "Billy"
positions[3] = "Nelson"


for key, value in pairs(positions) do
  print(key, value)
end