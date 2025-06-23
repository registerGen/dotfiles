return {
  {
    "m4xshen/hardtime.nvim",
    opts = {
      disable_mouse = false,
    },
  },
  {
    "Saghen/blink.pairs",
    build = "cargo build --release",
    opts = {
      highlights = {
        groups = { "Red", "Orange", "Yellow", "Green", "Blue", "Purple" },
        priority = math.floor((vim.hl.priorities.treesitter + vim.hl.priorities.semantic_tokens) / 2)
      },
      mappings = {
        pairs = {
          -- NOTE: remove this when it's not buggy
          ["_"] = {
            { "_", when = function() return false end },
          },
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = { char = "▎" },
    },
  },
  {
    "cappyzawa/trim.nvim",
    opts = {
      patterns = { [[%s/\(\n\n\)\n\+/\1/]] },
    }
  },
  {
    "is0n/jaq-nvim",
    opts = {
      behavior = { startinsert = true },
      cmds = {
        external = {
          cpp = vim.fn.stdpath("config") .. "/scripts/run_cpp.sh $file $fileBase",
          typst = "typst compile $file",
        },
      },
      ui = {
        float = { border = "rounded" },
      },
    },
    config = function(_, opts)
      require("jaq-nvim").setup(opts)
      vim.keymap.set("n", "<C-M-n>", "<cmd>Jaq<CR>")
    end
  },
}
