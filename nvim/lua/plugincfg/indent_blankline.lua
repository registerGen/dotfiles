local M = {}

M.config = function()
  require("ibl").setup({
    indent = {
      char = "▏",
      smart_indent_cap = true,
    },
    scope = {
      enabled = true,
      char = "▎",
    },
  })
end

return M
