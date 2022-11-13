local M = {}

local icons = require 'icons'

M.config = function()
  require('bufferline').setup {
    options = {
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = true,
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local result = ''
        for severity, count in pairs(diagnostics_dict) do
          result = result .. icons.diagnostic[severity] .. count .. ' '
        end
        return result
      end,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  }
end

return M
