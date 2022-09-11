local M = {}

M.config = function()
  local wilder = require 'wilder'
  wilder.setup {
    modes = { ':', '/', '?' },
  }

  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline {
        fuzzy = 1,
      },
      wilder.python_search_pipeline {
        pattern = 'fuzzy',
      }
    ),
  })

  wilder.set_option(
    'renderer',
    wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
      border = 'rounded',
      max_height = '50%',
      min_height = 0,
      prompt_position = 'top',
      reverse = 0,
      highlighter = wilder.basic_highlighter(),
      highlights = {
        default = 'WilderDefualt',
        selected = 'WilderSelected',
        accent = 'WilderAccent',
        selected_accent = 'WilderSelectedAccent',
      },
      left = { ' ', wilder.popupmenu_devicons() },
    })
  )
end

return M
