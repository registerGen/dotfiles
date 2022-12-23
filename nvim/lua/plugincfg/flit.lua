local M = {}

M.config = function()
  require('packer').loader 'leap.nvim'
  require('flit').setup {
    labeled_modes = 'nvo',
  }
end

return M
