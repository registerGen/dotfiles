return {
  { "folke/lazy.nvim", priority = 10000 },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  { "kevinhwang91/promise-async", lazy = true },

  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 9999,
    init = function()
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_diagnostic_text_highlight = 1
      vim.g.sonokai_diagnostic_virtual_text = "colored"
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_menu_selection_background = "green"
      vim.g.sonokai_show_eob = 0

      vim.cmd.colors("sonokai")

      vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = "None", bg = "None", bold = true, force = true })
      vim.api.nvim_set_hl(0, "TSParameter", { link = "OrangeItalic", force = true })
      vim.api.nvim_set_hl(0, "TSParameterReference", { link = "OrangeItalic", force = true })
    end,
  }
}
