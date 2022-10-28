local M = {}

M.config = function()
  require('noice').setup {
    presets = {
      command_palette = true,
      inc_rename = true,
    },
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      hover = {
        enabled = true,
      },
      signature = {
        enabled = true,
      },
      message = {
        enabled = true,
      },
    },
  }
end

return M
