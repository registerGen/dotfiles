local M = {}

M.config = function()
  require('colorizer').setup({
    '*',
  }, {
    mode = 'virtualtext',
  })
end

return M
