local M = {}

local icons = require "icons"
local u = require "utils"

local function in_cmd_mode()
  return vim.api.nvim_get_mode().mode == "c"
end

M.config = function()
  local configuration = vim.fn["sonokai#get_configuration"]()
  local palette = vim.fn["sonokai#get_palette"](configuration.style, configuration.colors_override)

  require("lualine").setup {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          "branch",
          cond = function()
            return not in_cmd_mode()
          end,
        },
        {
          "diff",
          cond = function()
            return not in_cmd_mode()
          end,
          symbols = icons.git_diff,
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = icons.diagnostic,
          update_in_insert = true,
          diagnostics_color = {
            error = { fg = palette.red[1] },
            warn = { fg = palette.yellow[1] },
            info = { fg = palette.blue[1] },
            hint = { fg = palette.green[1] },
          },
          cond = function()
            return not in_cmd_mode()
          end,
        },
      },
      lualine_c = {
        {
          "filename",
          cond = function()
            return not in_cmd_mode()
          end,
        },
        {
          "%{getcmdline()}",
          color = { fg = palette.yellow[1] },
          cond = function()
            return in_cmd_mode()
          end,
        },
      },
      lualine_x = { "filesize", "encoding", "fileformat", "filetype" },
      lualine_y = { "progress", { "location", icon = icons.misc.location } },
      lualine_z = { { "%{strftime('%X')}", icon = icons.misc.time } },
    },
    winbar = {
      lualine_b = { { "filetype", icon_only = true }, { "filename", path = 3 } },
      lualine_c = { { "aerial", sep = u.pad(icons.arrow.right) } },
    },
    inactive_winbar = {
      lualine_b = { { "filetype", icon_only = true }, { "filename", path = 3 } },
    },
    extensions = { "nvim-tree", "fugitive", "aerial" },
  }
end

return M
