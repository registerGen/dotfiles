local M = {}

M.config = function()
  require("noice").setup({
    presets = {
      command_palette = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
  })
end

return M
