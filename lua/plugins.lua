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
    'williamboman/nvim-lsp-installer',
    config = function()
      require('nvim-lsp-installer').setup {
        github = {
          download_url_template = 'https://ghproxy.com/https://github.com/%s/releases/download/%s/%s',
        },
      }
    end,
  }
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugincfg.lsp').config()
    end,
  }
  use {
    'kosayoda/nvim-lightbulb',
    config = function()
      require('nvim-lightbulb').setup {
        sign = {
          priority = 100,
        },
      }

      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        callback = function()
          require('nvim-lightbulb').update_lightbulb()
        end,
      })
    end,
  }
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {
        border = { '🢄', '─', '╮', '│', '╯', '─', '╰', '│' },
      }
    end,
  }
  use {
    'stevearc/aerial.nvim',
    config = function()
      require('aerial').setup {
        backends = { 'lsp', 'treesitter', 'markdown' },
      }
    end,
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.code_actions.gitsigns.with {
            condition = function(utils)
              local bufname = vim.api.nvim_buf_get_name(0)
              local exclude_dirs = { os.getenv 'HOME' .. '/oi/prob' }
              if vim.fn.isdirectory(bufname .. '/.git') == 1 then
                return not vim.tbl_contains(exclude_dirs, bufname)
              end
              for dir in vim.fs.parents(bufname) do
                if vim.fn.isdirectory(dir .. '/.git') == 1 then
                  return not vim.tbl_contains(exclude_dirs, dir)
                end
              end
              return false
            end,
          },
          null_ls.builtins.diagnostics.zsh,
        },
      }
    end,
  }

  -- Completion {{{1
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('plugincfg.cmp').config()
    end,
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    after = 'nvim-cmp',
  }
  use 'onsails/lspkind-nvim'

  -- Markdown {{{1
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    ft = 'markdown',
    config = function()
      local id = vim.api.nvim_create_augroup('MarkdownPreview', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        group = id,
        command = 'MarkdownPreview',
      })
      vim.g.mkdp_highlight_css = vim.fn.stdpath 'config' .. '/utils/solarized_dark.css'
      vim.g.mkdp_markdown_css = vim.fn.stdpath 'config' .. '/utils/github.css'
      vim.g.mkdp_theme = 'dark'
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
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use {
    'nvim-treesitter/playground',
    after = 'nvim-treesitter',
  }
  use {
    'm-demare/hlargs.nvim',
    after = 'nvim-treesitter',
    config = function()
      require('hlargs').setup {
        highlight = { link = 'TSParameter' },
      }
    end,
  }

  -- Snippet {{{1
  use {
    'hrsh7th/vim-vsnip',
    config = function()
      vim.g.vsnip_snippet_dir = vim.fn.stdpath 'config' .. '/vsnip'

      vim.api.nvim_set_keymap(
        'i',
        '<C-j>',
        'vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\' : \'<C-j>\'',
        { expr = true }
      )
      vim.api.nvim_set_keymap(
        's',
        '<C-j>',
        'vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\' : \'<C-j>\'',
        { expr = true }
      )
      vim.api.nvim_set_keymap(
        'i',
        '<C-k>',
        'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<C-j>\'',
        { expr = true }
      )
      vim.api.nvim_set_keymap(
        's',
        '<C-k>',
        'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<C-j>\'',
        { expr = true }
      )
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
      require('telescope').load_extension 'fzf'
      require('telescope').load_extension 'aerial'
      require('telescope').load_extension 'notify'
    end,
  }

  -- Color {{{1
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        '*',
      }, {
        mode = 'virtualtext',
      })
    end,
  }

  -- Utility {{{1
  use {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        stages = 'fade',
        icons = {
          WARN = '',
        },
      }
      vim.notify = require 'notify'
    end,
  }
  use 'stevearc/dressing.nvim'
  use 'antoinemadec/FixCursorHold.nvim'

  -- Neovim Lua Development {{{1
  use '~/dev/lua-dev.nvim'
  use 'milisims/nvim-luaref'

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
      require('indent_blankline').setup {
        char = '▏',
        show_current_context = true,
        show_current_context_start = true,
        context_char = '▎',
        filetype_exclude = {
          'lspinfo',
          'packer',
          'checkhealth',
          'help',
          'lsp-installer',
          'dashboard',
          '',
        },
        buftype_exclude = { 'nofile', 'terminal' },
      }
    end,
  }

  -- File Explorer {{{1
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        diagnostics = {
          enable = true,
        },
        renderer = {
          highlight_git = true,
          indent_markers = {
            enable = true,
          },
        },
      }
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
      vim.g.blamer_enabled = 1
      vim.g.blamer_delay = 200
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
      require('code_runner').setup {
        startinsert = true,
        filetype = {
          cpp = 'cd $dir && '
            .. vim.fn.stdpath 'config'
            .. '/utils/run_cpp.sh $fileName $fileNameWithoutExt',
          python = 'cd $dir && python $fileName',
          tex = 'cd $dir && latexmk $fileName && latexmk -c',
        },
      }
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
    after = 'nvim-treesitter',
  }
  use {
    'nvim-treesitter/nvim-treesitter-context',
    after = 'nvim-treesitter',
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
