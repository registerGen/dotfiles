local u = require 'utils'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LSP
vim.api.nvim_create_autocmd('CursorHold', {
  group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
  callback = function()
    local preview = require 'goto-preview'
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
  end,
})

-- code runner
u.set_map_prefix ''
u.nmap('<C-M-N>', '<cmd>RunFile<CR>', { desc = 'Run code' })

-- vsnip
vim.api.nvim_set_keymap('i', '<C-j>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-j>']], { expr = true })
vim.api.nvim_set_keymap('s', '<C-j>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-j>']], { expr = true })
vim.api.nvim_set_keymap('i', '<C-k>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>']], { expr = true })
vim.api.nvim_set_keymap('s', '<C-k>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>']], { expr = true })

-- iswap
u.set_map_prefix '<leader>s'
u.nmap('', '<cmd>ISwap<CR>', { desc = 'Swap nodes' })

-- ufo
vim.api.nvim_create_autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('UfoKeymaps', { clear = true }),
  callback = function()
    u.set_map_prefix ''
    local ufo = require 'ufo'
    u.nmap('zR', function() ufo.openAllFolds()               end, {})
    u.nmap('zM', function() ufo.closeAllFolds()              end, {})
    u.nmap('zr', function() ufo.openFoldsExceptKinds()       end, {})
    u.nmap('zm', function() ufo.closeFoldsWith()             end, {})
    u.nmap('zp', function() ufo.peekFoldedLinesUnderCursor() end, {})
  end,
})
