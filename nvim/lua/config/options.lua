vim.opt.background = 'dark'
vim.opt.backup = false
vim.opt.cmdheight = 0
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.foldlevel = 10000
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = false
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 500
vim.opt.wrap = false

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    opt_local.signcolumn = 'no'
  end,
})

vim.g.tex_flavor = 'latex'

local disabled_builtins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'man',
  'matchit',
  'matchparen',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'paste',
  'rrhelper',
  'spellfile_plugin',
  'tar',
  'tarPlugin',
  'tutor',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, plugin in ipairs(disabled_builtins) do
  vim.g['loaded_' .. plugin] = 1
end

if vim.fn.exists 'g:neovide' ~= 0 then
  opt.cursorline = false
  opt.guifont = 'CaskaydiaCove Nerd Font Mono:h14'
  vim.g.neovide_cursor_vfx_mode = 'railgun'
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_transparency = 0.7
end
