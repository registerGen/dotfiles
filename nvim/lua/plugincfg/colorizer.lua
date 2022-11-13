local M = {}

M.config = function()
  require('colorizer').setup {
    user_default_options = {
      mode = 'virtualtext',
    },
  }
end

return M
