local M = {}

M.config = function()
  require("hlargs").setup {
    highlight = { link = "TSParameter" },
    paint_catch_blocks = {
      declarations = true,
      usages = true,
    },
  }
end

return M
