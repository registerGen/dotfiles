local M = {}

M.config = function()
  local telescope = require 'telescope'
  telescope.setup {
    defaults = {
      prompt_prefix = ' ',
      selection_caret = '► ',
    },
  }
  telescope.load_extension 'fzf'
  telescope.load_extension 'aerial'
  telescope.load_extension 'notify'
end

return M
