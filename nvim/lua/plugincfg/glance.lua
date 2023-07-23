local M = {}

local icons = require("icons")

M.config = function()
  require("glance").setup({
    folds = {
      fold_closed = icons.fold.close,
      fold_open = icons.fold.open,
    },
  })
end

return M
