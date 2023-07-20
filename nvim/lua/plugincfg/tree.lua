local M = {}

M.config = function()
  require("nvim-tree").setup {
    diagnostics = {
      enable = true,
    },
    renderer = {
      highlight_git = true,
      indent_markers = {
        enable = true,
      },
    },
  }
end

return M
