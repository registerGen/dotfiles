local M = {}

M.config = function()
  require("alpha").setup(require("alpha.themes.dashboard").config)
end

return M
