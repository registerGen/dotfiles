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
    vim.opt_local.signcolumn = 'no'
  end,
})

vim.g.tex_flavor = 'latex'
