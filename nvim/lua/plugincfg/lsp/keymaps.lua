local M = {}

local u = require 'utils'

M.apply_keymaps = function()
  require('packer').loader 'goto-preview'
  local preview = require 'goto-preview'

  -- stylua: ignore start
  u.set_map_prefix '<leader>l'
  u.nmap('d',      function() preview.goto_preview_definition() end,                        { desc = 'Go to definition' })
  u.nmap('i',      function() preview.goto_preview_implementation() end,                    { desc = 'Go to implementation' })
  u.nmap('r',      function() preview.goto_preview_references() end,                        { desc = 'Go to references' })
  u.nmap('K',      function() vim.lsp.buf.hover() end,                                      { desc = 'Hover documentation' })
  u.nmap('c',      function() vim.lsp.buf.code_action() end,                                { desc = 'Code action' })
  u.nmap('n',      function() return ':IncRename ' .. vim.fn.expand '<cword>' end,          { desc = 'Rename', expr = true })
  u.nmap('f',      function() vim.lsp.buf.format { async = true } end,                      { desc = 'Format' })
  u.nmap('D',      function() vim.diagnostic.open_float { focus = false, scope = 'l' } end, { desc = 'Show line diagnostics' })
  u.nmap('<C-D>',  function() vim.diagnostic.open_float { focus = false, scope = 'b' } end, { desc = 'Show buffer diagnostics' })
  u.set_map_prefix ''
  u.nmap('[d',     function() vim.diagnostic.goto_prev() end,                               { desc = 'Previous diagnostic' })
  u.nmap(']d',     function() vim.diagnostic.goto_next() end,                               { desc = 'Next diagnostic' })
  -- stylua: ignore end
end

return M
