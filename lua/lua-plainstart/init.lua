local value = 10

local function printWindowSize()
  print(
    vim.api.nvim_win_get_width(0),
    vim.api.nvim_win_get_height(0)
  )
  print(value, vim.g["value2"])
end
return {
  printWindowSize = printWindowSize
}
