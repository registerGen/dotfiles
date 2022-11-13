local M = {}

M.config = function()
  require('flit').setup {
    labeled_modes = 'nvo',
  }
end

return M
