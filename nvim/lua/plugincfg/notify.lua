local M = {}

M.config = function()
  require("notify").setup({
    icons = {
      WARN = "",
    },
  })
  vim.notify = require("notify")
end

return M
