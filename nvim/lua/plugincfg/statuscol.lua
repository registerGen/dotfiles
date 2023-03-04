local M = {}

M.config = function()
  local builtin = require 'statuscol.builtin'
  require('statuscol').setup {
    segments = {
      { text = { '%s' }, click = 'v:lua.ScSa' },
      { text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
      { text = { ' ', builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
    },
    setopt = true,
  }
end

return M
