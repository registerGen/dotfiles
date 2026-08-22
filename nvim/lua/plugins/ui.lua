local icons = require("icons")

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = {
          winbar = { "aerial" },
        },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "lsp_status", "diagnostics_modified" },
        lualine_c = { "filename", "searchcount" },
        lualine_x = { "filesize", "filetype", "fileformat" },
        lualine_y = { { "diff", symbols = require("icons").git_diff }, "branch" },
        lualine_z = { "progress", "location" },
      },
      tabline = {
        lualine_a = {
          { "datetime", style = "%a, %b %d" },
          { "datetime", icon = icons.misc.clock, style = "%H:%M:%S" },
        },
        lualine_b = { "buffers" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
      },
      winbar = {
        lualine_b = { { "filename", color = { fg = "#7F8490" }, path = 3 } },
        lualine_c = {
          {
            "aerial",
            draw_empty = true,
            sep = " " .. icons.misc.fold_closed .. " ",
            sep_highlight = "Grey",
            on_click = require("aerial").nav_open,
          },
        },
      },
      inactive_winbar = {
        lualine_c = { { "filename", path = 3 } },
      },
    },
  },
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
        },
      })
    end,
  },
  {
    "lewis6991/satellite.nvim",
    opts = {},
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      icons = {
        ERROR = icons.diagnostic.error,
        WARN = icons.diagnostic.warn,
        INFO = icons.diagnostic.info,
        DEBUG = icons.misc.debug,
        TRACE = icons.diagnostic.hint,
      },
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    opts = {},
    config = function(_, opts)
      require("ufo").setup(opts)
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    opts = {},
  },
  {
    "nvim-tree/nvim-tree.lua",
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    opts = {},
  },
}
