local M = {}

local icons = require("icons")
local u = require("utils")

local handler = function(virt_text, lnum, end_lnum, width, truncate)
  local new_virt_text = {}
  local suffix1 = u.pad(icons.misc.ellipsis)
  local suffix2 = (icons.arrow.bottom_left .. " %d "):format(end_lnum - lnum)
  local suf_width = vim.fn.strdisplaywidth(suffix1 .. suffix2)
  local target_width = width - suf_width
  local cur_width = 0

  for _, chunk in ipairs(virt_text) do
    local chunk_text = chunk[1]
    local chunk_width = vim.fn.strdisplaywidth(chunk_text)
    if target_width > cur_width + chunk_width then
      table.insert(new_virt_text, chunk)
    else
      chunk_text = truncate(chunk_text, target_width - cur_width)
      local hlgroup = chunk[2]
      table.insert(new_virt_text, { chunk_text, hlgroup })
      chunk_width = vim.fn.strdisplaywidth(chunk_text)
      if cur_width + chunk_width < target_width then
        suffix1 = suffix1 .. (" "):rep(target_width - cur_width - chunk_width)
      end
      break
    end
    cur_width = cur_width + chunk_width
  end

  table.insert(new_virt_text, { suffix1, "UfoFoldedEllipsis" })
  table.insert(new_virt_text, { suffix2, "MoreMsg" })
  return new_virt_text
end

M.config = function()
  local ufo = require("ufo")
  ufo.setup({
    fold_virt_text_handler = handler,
  })

  -- stylua: ignore start
  u.set_map_prefix ''
  u.nmap('zR', function() ufo.openAllFolds()               end, {})
  u.nmap('zM', function() ufo.closeAllFolds()              end, {})
  u.nmap('zr', function() ufo.openFoldsExceptKinds()       end, {})
  u.nmap('zm', function() ufo.closeFoldsWith()             end, {})
  u.nmap('zp', function() ufo.peekFoldedLinesUnderCursor() end, {})
  -- stylua: ignore end
end

return M
