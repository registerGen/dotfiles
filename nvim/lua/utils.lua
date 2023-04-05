local M = {}

-- Mappings
local map_prefix = ''

M.set_map_prefix = function(prefix)
  map_prefix = prefix
end

local function create_map_func(mode)
  return function(lhs, rhs, opts)
    if opts == nil then
      opts = {}
    end
    opts = vim.tbl_deep_extend('force', {}, { noremap = true, silent = true }, opts)
    vim.keymap.set(mode, map_prefix .. lhs, rhs, opts)
  end
end

M.nmap = create_map_func 'n'
M.noxmap = create_map_func { 'n', 'o', 'x' }

M.pad = function(content)
  return ' ' .. content .. ' '
end

return M
