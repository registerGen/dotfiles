local M = {}

local gs = require 'gitsigns'
local u = require 'utils'

M.config = function()
  gs.setup {
    signcolumn = true,
    numhl = true,
    current_line_blame = true,
  }

  u.set_map_prefix ''
  u.nmap(']h', function()
    if vim.wo.diff then
      return ']h'
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return '<Ignore>'
  end, { expr = true, desc = 'Next git diff hunk' })

  u.nmap('[h', function()
    if vim.wo.diff then
      return '[h'
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return '<Ignore>'
  end, { expr = true, desc = 'Previous git diff hunk' })
end

return M
