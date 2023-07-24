local M = {}

local hl_group = {
  "Red",
  "Orange",
  "Grey",
  "Yellow",
  "Green",
  "Grey",
  "Blue",
  "Purple",
}

M.config = function()
  require("clock").setup({
    hl_group = function(_, _, position)
      return hl_group[position]
    end,
  })
end

return M
