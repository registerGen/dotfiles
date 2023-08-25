local M = {}

local u = require("utils")

M.apply_keymaps = function()
  -- stylua: ignore start
  u.set_map_prefix '<leader>l'
  u.nmap('d',      '<cmd>Glance definitions<CR>',                                           { desc = 'Go to definitions' })
  u.nmap('i',      '<cmd>Glance implementations<CR>',                                       { desc = 'Go to implementations' })
  u.nmap('r',      '<cmd>Glance references<CR>',                                            { desc = 'Go to references' })
  u.nmap('t',      '<cmd>Glance type_definitions<CR>',                                      { desc = 'Go to type definitions' })
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
