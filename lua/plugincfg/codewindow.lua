local M = {}

M.config = function()
  local codewindow = require 'codewindow'
  codewindow.setup {
    auto_enable = true,
    exclude_filetypes = { 'dashboard', 'startuptime', 'gitcommit', 'NvimTree', '' },
  }
  codewindow.apply_default_keybinds()
end

return M
