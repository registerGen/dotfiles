local M = {}

M.config = function()
  require('bufferline').setup {
    options = {
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = true,
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local result = ''
        for severity, count in pairs(diagnostics_dict) do
          if severity == 'error' then
            result = result .. ''
          end
          if severity == 'warning' then
            result = result .. ''
          end
          if severity == 'info' then
            result = result .. ''
          end
          if severity == 'hint' then
            result = result .. ''
          end
          result = result .. count .. ' '
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
