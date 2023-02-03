local M = {}

M.config = function()
  require('statuscol').setup {
    foldfunc = 'builtin',
    setopt = true,
  }
end

return M
