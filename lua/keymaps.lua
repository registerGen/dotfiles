local u = require 'utils'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- LSP
local preview = require 'goto-preview'
u.set_map_prefix '<leader>l'
u.nmap('d', function() preview.goto_preview_definition() end, { desc = 'Go to definition' })
u.nmap('i', function() preview.goto_preview_implementation() end, { desc = 'Go to implementation' })
u.nmap('r', function() preview.goto_preview_references() end, { desc = 'Go to references' })
u.nmap('K', function() vim.lsp.buf.hover() end, { desc = 'Hover documentation' })
u.nmap('c', function() vim.lsp.buf.code_action() end, { desc = 'Code action' })
u.nmap('n', function() vim.lsp.buf.rename() end, { desc = 'Rename' })
u.nmap('f', function() vim.lsp.buf.format { async = true } end, { desc = 'Format' })
u.nmap('D', function() vim.diagnostic.open_float { focus = false, scope = 'l' } end, { desc = 'Show line diagnostics' })
u.nmap('<C-D>', function() vim.diagnostic.open_float { focus = false, scope = 'b' } end, { desc = 'Show buffer diagnostics' })

-- code runner
u.set_map_prefix ''
u.nmap('<C-M-N>', '<cmd>RunCode<CR>', { desc = 'Run code' })

-- vsnip
vim.api.nvim_set_keymap('i', '<C-j>', 'vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\' : \'<C-j>\'', { expr = true })
vim.api.nvim_set_keymap('s', '<C-j>', 'vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\' : \'<C-j>\'', { expr = true })
vim.api.nvim_set_keymap('i', '<C-k>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<C-k>\'', { expr = true })
vim.api.nvim_set_keymap('s', '<C-k>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<C-k>\'', { expr = true })

-- iswap.nvim
u.set_map_prefix '<leader>s'
u.nmap('', '<cmd>ISwap<CR>', { desc = 'Swap nodes'})
