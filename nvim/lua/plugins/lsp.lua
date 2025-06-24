return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      require("lsp")
    end,
  },
  {
    "Saghen/blink.cmp",
    build = "cargo build --release",
    dependencies = {
      "xzbdmw/colorful-menu.nvim",
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
    },
    opts = {
      appearance = { kind_icons = require("icons").kinds },
      completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        list = {
          selection = { preselect = false },
        },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
                highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
              },
            },
          },
        },
      },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "show_and_insert", "select_next", "fallback" },
        ["<S-Tab>"] = { "show_and_insert", "select_prev", "fallback" },
        ["<C-j>"] = { "snippet_forward", "fallback" },
        ["<C-k>"] = { "snippet_backward", "fallback" },
        ["<C-K>"] = { "show_signature", "hide_signature", "fallback" },
      },
      signature = {
        enabled = true,
      },
      sources = {
        default = { "lsp", "lazydev", "snippets" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
      icons = vim.tbl_extend("force", require("icons").kinds, {
        Collapsed = require("icons").misc.fold_closed
      }),
      show_guides = true,
    },
  },
}
