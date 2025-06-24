vim.loader.enable()

vim.cmd.set("nu rnu et ts=2 sw=2 cul nowrap cole=2 sb spr nobk noswf fdc=1 fdl=999 fdls=999 ls=3 scl=yes:1")
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
  vim.g.clipboard = {
    name = "WSLClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
      ["*"] = "powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
    },
  }
end

vim.g.neovide_title_background_color = string.format(
  "%x",
  vim.api.nvim_get_hl(0, {
    id = vim.api.nvim_get_hl_id_by_name("Normal")
  }).bg
)
vim.g.neovide_opacity = 0.95
vim.g.neovide_normal_opacity = 0.95
vim.g.neovide_cursor_vfx_mode = "railgun"

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
