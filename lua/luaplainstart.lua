local M = {}

-- Create commands
-- TODO: Was bedeuten bang und nargs
local function create_commands()
  vim.cmd("command! -bang -nargs=0 HelloWorldGerman :lua require('luaplainstart').german()" )
  vim.cmd("command! -bang -nargs=0 HelloWorldEnglish :lua require('luaplainstart').english()" )
end

function M.german()
  print("Hallo Welt")
end

function M.english()
  print("Hello World")
end

local function say_hello()
  print("Hello World")
end

function M.hello_world()
  say_hello()
end

function M.init()
  create_commands()
end

return {
  M
}
