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
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = { char = "▎", show_end = false },
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
          rust = "cargo run --bin $fileBase",
          tex = "latexmk $file && latexmk -c",
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
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_mappings()
      require("leap").opts.preview_filter = function(ch0, ch1, ch2)
        return not (
          ch1:match("%s") or
          ch0:match("%a") and ch1:match("%a") and ch2:match("%a")
        )
      end
    end,
  }
}
