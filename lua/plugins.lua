require('packer').init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
    prompt_border = 'rounded',
  },
  git = {
    default_url_format = 'https://ghproxy.com/https://github.com/%s',
  },
}

require('packer').startup(function(use)
  -- Plugin Manager {{{1
  use 'wbthomason/packer.nvim'

  -- Colorscheme {{{1
  use {
    'sainnhe/sonokai',
    config = function()
      require('plugincfg.sonokai').config()
    end,
  }

  -- LSP {{{1
  use {
    {
      'williamboman/mason.nvim',
      config = function()
        require('plugincfg.mason').config()
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require('plugincfg.mason_lspconfig').config()
      end,
    },
  }
  use {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    after = 'cmp-nvim-lsp',
    config = function()
      require('plugincfg.lsp').config()
    end,
  }
  use {
    'kosayoda/nvim-lightbulb',
    event = 'CursorHold',
    config = function()
      require('plugincfg.lightbulb').config()
    end,
  }
  use {
    'rmagatti/goto-preview',
    event = 'CursorHold',
    config = function()
      require('goto-preview').setup()
    end,
  }
  use {
    'stevearc/aerial.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugincfg.aerial').config()
    end,
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    event = 'BufRead',
    config = function()
      require('plugincfg.null_ls').config()
    end,
  }
  use {
    'lvimuser/lsp-inlayhints.nvim',
    config = function()
      require('lsp-inlayhints').setup()
    end,
  }

  -- Completion {{{1
  use {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      require('plugincfg.cmp').config()
    end,
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
  }
  use 'onsails/lspkind-nvim'

  -- Syntax {{{1
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('plugincfg.treesitter').config()
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    event = 'BufRead',
  }
  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
    event = 'BufRead',
  }
  use {
    'm-demare/hlargs.nvim',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('plugincfg.hlargs').config()
    end,
  }

  -- Snippet {{{1
  use {
    'hrsh7th/vim-vsnip',
    event = 'InsertEnter',
    config = function()
      vim.g.vsnip_snippet_dir = vim.fn.stdpath 'config' .. '/vsnip'
    end,
  }

  -- Fuzzy Finder {{{1
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    event = 'CursorHold',
    config = function()
      require('plugincfg.telescope').config()
    end,
  }

  -- Color {{{1
  use {
    'NvChad/nvim-colorizer.lua',
    event = 'CursorHold',
    config = function()
      require('plugincfg.colorizer').config()
    end,
  }

  -- Utility {{{1
  use {
    'rcarriga/nvim-notify',
    config = function()
      require('plugincfg.notify').config()
    end,
  }
  use 'stevearc/dressing.nvim'
  use 'antoinemadec/FixCursorHold.nvim'
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    event = 'CursorHold',
    after = 'nvim-lspconfig',
    config = function()
      require('plugincfg.ufo').config()
    end,
  }

  -- Neovim Lua Development {{{1
  use 'folke/lua-dev.nvim'

  -- Tabline {{{1
  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugincfg.bufferline').config()
    end,
  }

  -- Statusline {{{1
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugincfg.lualine').config()
    end,
  }

  -- Startup {{{1
  use {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  }
  use {
    'glepnir/dashboard-nvim',
    config = function()
      require('plugincfg.dashboard').config()
    end,
  }
  use 'lewis6991/impatient.nvim'

  -- Indent {{{1
  use {
    'lukas-reineke/indent-blankline.nvim',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('plugincfg.indent_blankline').config()
    end,
  }

  -- File Explorer {{{1
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    event = 'CursorHold',
    config = function()
      require('plugincfg.nvim_tree').config()
    end,
  }

  -- Git {{{1
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('gitsigns').setup()
    end,
  }
  use {
    'APZelos/blamer.nvim',
    event = 'CursorHold',
    config = function()
      require('plugincfg.blamer').config()
    end,
  }

  -- Comment {{{1
  use {
    'numToStr/Comment.nvim',
    keys = { 'gc', 'gcc', 'gbc' },
    config = function()
      require('Comment').setup()
    end,
  }

  -- Motion {{{1
  use {
    'ggandor/leap.nvim',
    keys = { 's', 'S' },
    requires = { 'tpope/vim-repeat' },
    config = function()
      require('leap').set_default_keymaps()
    end,
  }

  -- Code Runner {{{1
  use {
    'CRAG666/code_runner.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugincfg.code_runner').config()
    end,
  }

  -- Scrollbar {{{1
  use {
    'lewis6991/satellite.nvim',
    config = function()
      require('satellite').setup()
    end,
  }

  -- Editing Support {{{1
  use {
    'windwp/nvim-autopairs',
    event = 'InsertCharPre',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }
  use {
    'windwp/nvim-ts-autotag',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  }
  use {
    'p00f/nvim-ts-rainbow',
    after = 'nvim-treesitter',
    event = 'BufRead',
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('treesitter-context').setup()
    end,
  }
  use {
    'mg979/vim-visual-multi',
    config = function()
      vim.g.VM_leader = '<leader>v'
    end,
  }
  use {
    'booperlv/nvim-gomove',
    config = function()
      require('gomove').setup()
    end,
  }
  use {
    'RRethy/nvim-treesitter-endwise',
    after = 'nvim-treesitter',
    event = 'BufRead',
  }
  use {
    'mizlan/iswap.nvim',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = function()
      require('plugincfg.iswap').config()
    end,
  }

  -- Formatting {{{1
  use {
    'cappyzawa/trim.nvim',
    event = 'BufWritePre',
    config = function()
      require('trim').setup()
    end,
  }

  -- Keybinding {{{1
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  }

  -- }}}1
end)

-- vim:fdm=marker:fdl=0
