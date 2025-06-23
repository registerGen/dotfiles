return {
  {
    "let-def/texpresso.vim",
    ft = "latex",
    config = function()
      require("texpresso").texpresso_path = "/home/registergen/software/texpresso/build/texpresso"
    end,
  },
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    opts = {
      dependencies_bin = {
        tinymist = "tinymist",
      },
    },
  }
}
