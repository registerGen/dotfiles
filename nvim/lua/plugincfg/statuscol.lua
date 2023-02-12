local M = {}

M.config = function()
  require('statuscol').setup {
    foldfunc = 'builtin',
    order = 'SNsFs',
    setopt = true,
  }
end

return M
