local M = {}

M.config = function()
  require('notify').setup {
    stages = 'fade',
    icons = {
      WARN = '',
    },
  }
  vim.notify = require 'notify'
end

return M
