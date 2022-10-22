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
  }
end

return M
