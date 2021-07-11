local function say_hello()
  print("Hello World")
end

local function hello_world()
  say_hello()
end

return {
  hello_world = hello_world
}
