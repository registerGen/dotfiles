vim.loader.enable()

vim.cmd([[
set nu rnu
set et ts=2 sw=2
set cul
set nowrap
set cole=2
set sb spr
set nobk noswf
set fdc=1 fdl=999 fdls=999
set ls=3 scl=yes:1
set cino+=:0,g0,j1,N-s,E-s:(0:U1
set spell
autocmd TermOpen * setlocal nospell
]])
vim.o.fcs = table.concat({
  "eob: ",
  "fold: ",
  "foldclose:" .. require("icons").misc.fold_closed,
  "foldopen:" .. require("icons").misc.fold_open,
  "foldsep: ",
}, ",")

if not vim.g.neovide then
  require("vim._extui").enable({})
end

vim.g.tex_flavor = "latex"

if vim.fn.has("wsl") then
  vim.g.clipboard = "win32yank"
end

vim.g.neovide_opacity = 0.95
vim.g.neovide_normal_opacity = 0.95
vim.g.neovide_cursor_vfx_mode = "railgun"

vim.api.nvim_create_user_command("FollowSymlink", function()
  local fname = vim.uv.fs_readlink(vim.fn.expand("%:p"))
  if not fname then return end
  vim.cmd.bwipeout()
  vim.cmd.e(fname)
end, {})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.cmd.packadd("nohlsearch")
vim.cmd.packadd("nvim.undotree")
