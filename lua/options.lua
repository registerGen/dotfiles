local opt = vim.opt

opt.background = 'dark'
opt.backup = false
opt.cmdheight = 0
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.conceallevel = 2
opt.cursorline = true
opt.expandtab = true
opt.foldlevel = 10000
opt.ignorecase = true
opt.laststatus = 3
opt.lazyredraw = false
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 500
opt.updatetime = 500
opt.wrap = false

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
  opt.guifont = 'CaskaydiaCovePL Nerd Font Mono:h14'
  vim.g.neovide_cursor_vfx_mode = 'railgun'
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_transparency = 0.7
end
