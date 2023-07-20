local M = {}

local u = require "utils"

M.config = function()
  require("iswap").setup {
    autoswap = true,
  }

  u.set_map_prefix "<leader>s"
  u.nmap("", "<cmd>ISwap<CR>", { desc = "Swap nodes" })
end

return M
