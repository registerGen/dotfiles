local M = {}

-- Mappings
local map_prefix = ''

M.set_map_prefix = function(prefix)
  map_prefix = prefix
end

local function create_map_func(mode)
  return function(lhs, rhs, opts)
    opts = vim.tbl_deep_extend('keep', {}, { noremap = true, silent = true }, opts)
    vim.keymap.set(mode, map_prefix .. lhs, rhs, opts)
  end
end

M.nmap = create_map_func 'n'
M.imap = create_map_func 'i'
M.smap = create_map_func 's'

return M
