local M = {}

local icons = require("icons")

M.config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      prompt_prefix = icons.misc.find .. " ",
      selection_caret = icons.arrow.right .. " ",
    },
  })
  telescope.load_extension("fzf")
  telescope.load_extension("notify")
end

return M
