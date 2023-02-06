local M = {}

M.config = function()
  require('statuscol').setup {
    foldfunc = 'builtin',
    order = 'SNFs',
    setopt = true,
  }
end

return M
