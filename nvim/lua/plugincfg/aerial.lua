local M = {}

M.config = function()
  require('aerial').setup {
    backends = { 'lsp', 'treesitter', 'markdown' },
  }
end

return M
