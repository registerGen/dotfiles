local M = {}

local icons = require("icons")

M.config = function()
  local symbols = require("dropbar.configs").opts
  require("dropbar").setup({
    icons = {
      kinds = {
        symbols = vim.tbl_deep_extend(
          "force",
          symbols,
          vim.tbl_map(function(s)
            return s .. " "
          end, icons.kinds)
        ),
      },
      ui = {
        bar = {
          separator = " " .. icons.fold.close .. " ",
          extends = icons.misc.ellipsis,
        },
        menu = {
          indicator = icons.fold.close,
        },
      },
    },
  })
end

return M
