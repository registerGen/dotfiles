local M = {}

M.config = function()
  local board = require 'dashboard'
  board.custom_header = {
    '',
    '',
    '',
    '',
    '',
    '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    '',
    '',
  }
  board.custom_center = {
    {
      icon = '  ',
      desc = 'Recently opened files                   ',
      action = 'Telescope oldfiles',
    },
    {
      icon = '  ',
      desc = 'Find File                               ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
    },
    {
      icon = '  ',
      desc = 'Find word                               ',
      action = 'Telescope live_grep',
    },
  }
  board.hide_statusline = true
  board.hide_tabline = true
end

return M
