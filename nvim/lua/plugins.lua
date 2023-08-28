local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://ghproxy.com/https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/lazy.nvim" },

  -- Colorscheme {{{1
  {
    "sainnhe/sonokai",
    priority = 1000,
    lazy = false,
    config = function()
      require("plugincfg.sonokai").config()
    end,
  },

  -- LSP {{{1
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
    build = ":MasonUpdate",
    config = function()
      require("plugincfg.mason").config()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = { "Mason" },
    config = function()
      require("plugincfg.mason_lspconfig").config()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
    config = function()
      require("plugincfg.lsp").config()
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "LspAttach",
    config = function()
      require("plugincfg.lightbulb").config()
    end,
  },
  {
    "DNLHC/glance.nvim",
    event = "LspAttach",
    config = function()
      require("plugincfg.glance").config()
    end,
  },
  {
    "stevearc/aerial.nvim",
    event = "LspAttach",
    config = function()
      require("plugincfg.aerial").config()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugincfg.null_ls").config()
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    event = "LspAttach",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- Completion {{{1
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "folke/neodev.nvim" },
    },
    config = function()
      require("plugincfg.cmp").config()
    end,
  },

  -- Syntax {{{1
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugincfg.treesitter").config()
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugincfg.hlargs").config()
    end,
  },

  -- Snippet {{{1
  {
    "hrsh7th/vim-vsnip",
    event = "InsertEnter",
    config = function()
      require("plugincfg.vsnip").config()
    end,
  },

  -- Fuzzy Finder {{{1
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    config = function()
      require("plugincfg.telescope").config()
    end,
  },

  -- Utility {{{1
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugincfg.notify").config()
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = function()
      require("plugincfg.noice").config()
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async", lazy = true },
    },
    event = "VeryLazy",
    config = function()
      require("plugincfg.ufo").config()
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    event = "VeryLazy",
    config = function()
      require("plugincfg.statuscol").config()
    end,
  },
  {
    "glacambre/firenvim",
    lazy = true,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
  },
  {
    "registerGen/clock.nvim",
    dev = true,
    event = "VeryLazy",
    config = function()
      require("plugincfg.clock").config()
    end,
  },

  -- Tabline {{{1
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugincfg.bufferline").config()
    end,
  },

  -- Statusline {{{1
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("plugincfg.lualine").config()
    end,
  },

  -- Indent {{{1
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugincfg.indent_blankline").config()
    end,
  },

  -- File Explorer {{{1
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugincfg.tree").config()
    end,
  },

  -- Git {{{1
  {
    "tpope/vim-fugitive",
    cmd = "G",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugincfg.gitsigns").config()
    end,
  },

  -- Comment {{{1
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Motion {{{1
  {
    "folke/flash.nvim",
    event = { "BufReadPost", "BufNewFile" },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end,
                                                                                                  desc =
        "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc =
      "Toggle Flash Search" },
    },
  },

  -- Code Runner {{{1
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<C-M-N>", "<cmd>RunFile<CR>" } },
    config = function()
      require("plugincfg.code_runner").config()
    end,
  },

  -- Scrollbar {{{1
  {
    "lewis6991/satellite.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("satellite").setup()
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    event = "LspAttach",
    config = function()
      require("plugincfg.codewindow").config()
    end,
  },

  -- Editing Support {{{1
  {
    "windwp/nvim-autopairs",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      require("plugincfg.rainbow_delimiters").config()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("treesitter-context").setup()
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.g.VM_leader = "<leader>v"
    end,
  },
  {
    "booperlv/nvim-gomove",
    keys = { "<M-j>", "<M-k>", "<M-J>", "<M-K>" },
    config = function()
      require("gomove").setup()
    end,
  },
  {
    "RRethy/nvim-treesitter-endwise",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Formatting {{{1
  {
    "cappyzawa/trim.nvim",
    event = "BufWritePre",
    config = function()
      require("trim").setup()
    end,
  },

  -- Keybinding {{{1
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },

  -- }}}1
}, {
  ui = {
    size = { width = 0.9, height = 0.9 },
  },
  git = {
    url_format = "https://ghproxy.com/https://github.com/%s.git",
  },
  checker = {
    enabled = true,
  },
  rtp = {
    disabled_plugin = {
      "gzip",
      "matchit",
      "matchparen",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
})

-- vim:fdm=marker:
