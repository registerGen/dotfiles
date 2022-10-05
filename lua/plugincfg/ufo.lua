local M = {}

local handler = function(virt_text, lnum, end_lnum, width, truncate)
  local new_virt_text = {}
  local suffix = ('  %d '):format(end_lnum - lnum)
  local suf_width = vim.fn.strdisplaywidth(suffix)
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
      -- str width returned from truncate() may less than 2nd argument, need padding
      if cur_width + chunk_width < target_width then
        suffix = suffix .. (' '):rep(target_width - cur_width - chunk_width)
      end
      break
    end
    cur_width = cur_width + chunk_width
  end
  table.insert(new_virt_text, { suffix, 'MoreMsg' })
  return new_virt_text
end

M.config = function()
  require('ufo').setup {
    fold_virt_text_handler = handler,
  }
end

return M
