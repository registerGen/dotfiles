local M = {}

M.config = function()
  require('gitsigns').setup {
    signcolumn = true,
    numhl = true,
    word_diff = true,
    current_line_blame = true,
  }
end

return M
