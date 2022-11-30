local M = {}

M.config = function()
  vim.g.vsnip_snippet_dir = vim.fn.stdpath 'config' .. '/vsnip'

  local map = vim.api.nvim_set_keymap
  map('i', '<C-j>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-j>']], { expr = true })
  map('s', '<C-j>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-j>']], { expr = true })
  map('i', '<C-k>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>']], { expr = true })
  map('s', '<C-k>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-k>']], { expr = true })
end

return M
