local M = {}

local icons = require "icons"

M.config = function()
  require("nvim-lightbulb").setup {
    autocmd = {
      enabled = true,
    },
    sign = {
      text = icons.misc.bulb,
    },
  }
end

return M
