local M = {}

local icons = require("icons")

M.config = function()
  require("aerial").setup({
    backends = { "lsp", "treesitter", "markdown" },
    icons = icons.kinds,
    layout = {
      default_direction = "prefer_left",
    },
  })
end

return M
