local M = {}

M.config = function()
  vim.g.rainbow_delimiters = {
    highlight = { "Red", "Orange", "Yellow", "Green", "Blue", "Purple" },
  }
end

return M
