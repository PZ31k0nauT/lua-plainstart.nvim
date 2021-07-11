local M = {}

function M.hello_world()
  vim.api.nvim_command('echo "Hello, World!')
end

return M
