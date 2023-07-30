local M = {}

local api = vim.api

local r, g, b = {}, {}, {}

for _, group_name in pairs({ "Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Red" }) do
  local fg = api.nvim_get_hl(0, { name = group_name }).fg
  r[#r + 1] = bit.rshift(fg, 16)
  g[#g + 1] = bit.band(bit.rshift(fg, 8), 255)
  b[#b + 1] = bit.band(fg, 255)
end

for i = 1, 6, 1 do
  for j = 1, 6, 1 do
    local group_name = "Clock" .. tostring(i) .. tostring(j)
    local R, G, B
    R = math.floor(r[i] * (7 - j) / 6 + r[i + 1] * (j - 1) / 6 + 0.5)
    G = math.floor(g[i] * (7 - j) / 6 + g[i + 1] * (j - 1) / 6 + 0.5)
    B = math.floor(b[i] * (7 - j) / 6 + b[i + 1] * (j - 1) / 6 + 0.5)
    local value = string.format("#%X%X%X", R, G, B)
    api.nvim_set_hl(0, group_name, { fg = value })
  end
end

M.config = function()
  require("clock").setup({
    hl_group_pixel = function(c, _, position, _, pixel_col)
      if c == ":" then
        return position == 3 and "Yellow" or "Blue"
      end

      if position >= 7 then
        position = position - 2
      elseif position >= 4 then
        position = position - 1
      end

      return "Clock" .. tostring(position) .. tostring(pixel_col)
    end,
  })
end

return M
