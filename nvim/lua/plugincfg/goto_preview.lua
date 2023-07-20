local M = {}

local icons = require "icons"

M.config = function()
  require("goto-preview").setup {
    border = { icons.arrow.top_left, "─", "╮", "│", "╯", "─", "╰", "│" },
  }
end

return M
