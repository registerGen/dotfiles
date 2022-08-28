local M = {}

M.config = function()
  require('hlargs').setup {
    highlight = { link = 'TSParameter' },
  }
end

return M
