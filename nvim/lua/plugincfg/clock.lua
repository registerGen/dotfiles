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

local function update_hl_group()
  local new_hl_group = vim.deepcopy(hl_group)
  new_hl_group[1] = hl_group[8]
  new_hl_group[2] = hl_group[1]
  new_hl_group[4] = hl_group[2]
  new_hl_group[5] = hl_group[4]
  new_hl_group[7] = hl_group[5]
  new_hl_group[8] = hl_group[7]
  hl_group = new_hl_group
end

-- assert(vim.loop.new_timer()):start(500, 500, update_hl_group)

M.config = function()
  require("clock").setup({
    hl_group = function(_, _, position)
      return hl_group[position]
    end,
  })
end

return M
