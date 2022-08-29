vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('Packer', { clear = true }),
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile',
})

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
    event = 'BufReadPre',
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
    event = 'InsertLeave',
    config = function()
      require('goto-preview').setup()
    end,
  }
  use {
    'stevearc/aerial.nvim',
    event = 'BufRead',
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

  -- Markdown {{{1
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = 'markdown',
    config = function()
      require('plugincfg.markdown_preview').config()
    end,
  }

  -- Syntax {{{1
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugincfg.treesitter').config()
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use {
    'm-demare/hlargs.nvim',
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
    config = function()
      require('plugincfg.telescope').config()
    end,
  }

  -- Color {{{1
  use {
    'NvChad/nvim-colorizer.lua',
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

  -- Neovim Lua Development {{{1
  use '~/dev/lua-dev.nvim'

  -- Tabline {{{1
  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugincfg.bufferline').config()
    end,
  }

  -- Statusline {{{1
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugincfg.lualine').config()
    end,
  }

  -- Startup {{{1
  use 'dstein64/vim-startuptime'
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
  use 'tpope/vim-rhubarb'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }
  use {
    'APZelos/blamer.nvim',
    config = function()
      require('plugincfg.blamer').config()
    end,
  }

  -- Comment {{{1
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  -- Motion {{{1
  use {
    'ggandor/leap.nvim',
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
    config = function()
      require('nvim-autopairs').setup()
    end,
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  }
  use {
    'p00f/nvim-ts-rainbow',
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
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
  use 'RRethy/nvim-treesitter-endwise'
  use {
    'mizlan/iswap.nvim',
    config = function()
      require('plugincfg.iswap').config()
    end,
  }

  -- Formatting {{{1
  use {
    'cappyzawa/trim.nvim',
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
