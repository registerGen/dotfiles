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
    opts = {
      fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
        local new_virt_text = {}
        local suffix = (" %s %d "):format(icons.arrow.bottom_left, end_lnum - lnum)
        local suf_width = vim.fn.strdisplaywidth(suffix)
        local target_width = width - suf_width
        local cur_width = 0
        for _, chunk in ipairs(virt_text) do
          local chunk_text = chunk[1]
          local chunk_width = vim.api.nvim_strwidth(chunk_text)
          if target_width > cur_width + chunk_width then
            table.insert(new_virt_text, chunk)
          else
            chunk_text = truncate(chunk_text, target_width - cur_width)
            local hl_group = chunk[2]
            table.insert(new_virt_text, { chunk_text, hl_group })
            chunk_width = vim.api.nvim_strwidth(chunk_text)
            if cur_width + chunk_width < target_width then
              suffix = suffix .. (" "):rep(target_width - cur_width - chunk_width)
            end
            break
          end
          cur_width = cur_width + chunk_width
        end
        table.insert(new_virt_text, { suffix, "MoreMsg" })
        return new_virt_text
      end,
    },
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
}
