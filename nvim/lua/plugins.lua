local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://ghproxy.com/github.com/wbthomason/packer.nvim',
      install_path,
    }
    vim.cmd.packadd 'packer.nvim'
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
      event = { 'BufReadPre', 'BufNewFile' },
      cmd = { 'Mason' },
      config = function()
        require('plugincfg.mason').config()
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      config = function()
        require('plugincfg.mason_lspconfig').config()
      end,
    },
  }
  use {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    after = { 'cmp-nvim-lsp', 'neodev.nvim', 'mason.nvim' },
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
    'DNLHC/glance.nvim',
    event = 'CursorHold',
    config = function()
      require('plugincfg.glance').config()
    end,
  }
  use {
    'stevearc/aerial.nvim',
    event = { 'BufReadPre', 'BufNewFile', 'CursorHold' },
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
    event = 'BufRead',
    config = function()
      require('lsp-inlayhints').setup()
    end,
  }
  use {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    event = 'InsertEnter',
    config = function()
      require('inc_rename').setup()
    end,
  }

  -- Completion {{{1
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require('plugincfg.cmp').config()
    end,
  }
  use {
    { 'hrsh7th/cmp-nvim-lsp', event = { 'BufReadPre', 'BufNewFile' } },
    { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
  }

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
      require('plugincfg.vsnip').config()
    end,
  }

  -- Fuzzy Finder {{{1
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    after = { 'aerial.nvim', 'nvim-notify' },
    event = 'CursorHold',
    cmd = 'Telescope',
    config = function()
      require('plugincfg.telescope').config()
    end,
  }

  -- Utility {{{1
  use {
    'rcarriga/nvim-notify',
    event = { 'BufRead', 'CursorHold' },
    config = function()
      require('plugincfg.notify').config()
    end,
  }
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    event = { 'BufRead', 'CmdlineEnter' },
    config = function()
      require('plugincfg.noice').config()
    end,
  }
  use {
    'stevearc/dressing.nvim',
    event = 'BufRead',
  }
  use {
    'kevinhwang91/nvim-ufo',
    requires = { {
      'kevinhwang91/promise-async',
      module = 'promise',
    } },
    event = 'BufRead',
    config = function()
      require('plugincfg.ufo').config()
    end,
  }
  use {
    'luukvbaal/statuscol.nvim',
    event = 'BufRead',
    config = function()
      require('plugincfg.statuscol').config()
    end,
  }
  use {
    'glacambre/firenvim',
    opt = true,
    run = function()
      vim.fn['firenvim#install'](0)
    end,
  }

  -- Neovim Lua Development {{{1
  use {
    'folke/neodev.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
  }

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
    config = function()
      vim.g.startuptime_tries = 20
    end,
  }
  use {
    'goolord/alpha-nvim',
    config = function()
      require('plugincfg.alpha').config()
    end,
  }
  -- use 'lewis6991/impatient.nvim'

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
    'nvim-tree/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    event = 'CursorHold',
    config = function()
      require('plugincfg.tree').config()
    end,
  }

  -- Git {{{1
  use {
    'tpope/vim-fugitive',
    cmd = 'G',
  }
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      require('plugincfg.gitsigns').config()
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
    keys = { 's', 'S', 'f', 'F', 't', 'T' },
    requires = { 'tpope/vim-repeat' },
    config = function()
      require('leap').set_default_keymaps()
    end,
  }
  use {
    'ggandor/flit.nvim',
    keys = { 'f', 'F', 't', 'T' },
    requires = { 'ggandor/leap.nvim' },
    after = 'leap.nvim',
    config = function()
      require('plugincfg.flit').config()
    end,
  }
  use {
    'chrisgrieser/nvim-spider',
    keys = { 'w', 'e', 'b', 'ge' },
    config = function()
      require('plugincfg.spider').config()
    end,
  }

  -- Code Runner {{{1
  use {
    'CRAG666/code_runner.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    event = 'CursorHold',
    config = function()
      require('plugincfg.code_runner').config()
    end,
  }

  -- Scrollbar {{{1
  use {
    'lewis6991/satellite.nvim',
    event = 'BufRead',
    config = function()
      require('satellite').setup()
    end,
  }
  use {
    'gorbit99/codewindow.nvim',
    event = 'BufRead',
    config = function()
      require('plugincfg.codewindow').config()
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
    'mrjones2014/nvim-ts-rainbow',
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
    event = 'CursorHold',
    config = function()
      vim.g.VM_leader = '<leader>v'
    end,
  }
  use {
    'booperlv/nvim-gomove',
    event = 'CursorHold',
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
    cmd = 'ISwap',
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
    event = 'BufRead',
    config = function()
      require('which-key').setup()
    end,
  }

  -- }}}1

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- vim:fdm=marker:
