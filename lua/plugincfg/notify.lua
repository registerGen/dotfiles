local M = {}

M.config = function()
  require('notify').setup {
    icons = {
      WARN = '',
    },
  }
end

return M
