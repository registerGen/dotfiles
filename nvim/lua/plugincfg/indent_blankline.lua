local M = {}

M.config = function()
  require("indent_blankline").setup {
    char = "▏",
    show_current_context = true,
    show_current_context_start = true,
    context_char = "▎",
    filetype_exclude = {
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "lsp-installer",
      "dashboard",
      "",
    },
    buftype_exclude = { "nofile", "terminal" },
  }
end

return M
