local M = {}

M.config = function()
  require('iswap').setup {
    autoswap = true,
  }
end

return M
