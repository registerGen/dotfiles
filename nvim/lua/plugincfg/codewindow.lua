local M = {}

M.config = function()
  local codewindow = require("codewindow")
  codewindow.setup({
    exclude_filetypes = { "dashboard", "startuptime", "gitcommit", "NvimTree", "help", "" },
    window_border = "",
  })
  codewindow.apply_default_keybinds()
end

return M
