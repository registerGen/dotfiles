local M = {}

local u = require("utils")

M.config = function()
  u.set_map_prefix("")
  u.noxmap("w", "<cmd>lua require('spider').motion 'w'<CR>")
  u.noxmap("e", "<cmd>lua require('spider').motion 'e'<CR>")
  u.noxmap("b", "<cmd>lua require('spider').motion 'b'<CR>")
  u.noxmap("ge", "<cmd>lua require('spider').motion 'ge'<CR>")
end

return M
