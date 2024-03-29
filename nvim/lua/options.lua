local opt, opt_local = vim.opt, vim.opt_local

local icons = require("icons")

opt.background = "dark"
opt.backup = false
opt.cmdheight = 0
opt.cinoptions:append("j1")
opt.cinoptions:append("g0")
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 2
opt.cursorline = true
opt.expandtab = true
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldclose = icons.fold.close,
  foldopen = icons.fold.open,
  foldsep = " ",
}
opt.foldcolumn = "1"
opt.foldlevel = 10000
opt.guifont = "Caskaydia Cove NFP:h14"
opt.ignorecase = true
opt.laststatus = 3
opt.lazyredraw = false
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.spell = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 500
opt.updatetime = 500
opt.wrap = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    opt_local.number = false
    opt_local.relativenumber = false
    opt_local.signcolumn = "no"
    opt_local.spell = false
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    opt_local.spell = false
  end,
})

vim.g.tex_flavor = "latex"

local disabled_builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "man",
  "matchit",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "paste",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in ipairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 1
end

if vim.fn.exists("g:neovide") ~= 0 then
  opt.cursorline = false
  opt.guifont = "CaskaydiaCove Nerd Font Mono:h14"
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_transparency = 0.7
end
