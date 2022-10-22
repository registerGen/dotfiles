local M = {}

M.config = function()
  require('noice').setup {
    views = {
      cmdline_popup = {
        position = {
          row = '30%',
        },
      },
    },
    cmdline = {
      format = {
        IncRename = {
          pattern = '^:%s*IncRename%s+',
          icon = '',
          conceal = true,
          opts = {
            relative = 'cursor',
            size = { min_width = 20 },
            position = { row = -3, col = 0 },
            buf_options = { filetype = 'text' },
          },
        },
      },
    },
  }
end

return M
