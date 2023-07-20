local M = {}

local icons = require "icons"

M.config = function()
  require("aerial").setup {
    backends = { "lsp", "treesitter", "markdown" },
    icons = icons.kinds,
  }
end

return M
