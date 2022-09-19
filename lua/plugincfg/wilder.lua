local M = {}

M.config = function()
  local wilder = require 'wilder'
  wilder.setup {
    modes = { ':', '/', '?' },
  }

  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.python_file_finder_pipeline {
        file_command = function(_, arg)
          if arg:byte(1) == ('.'):byte(1) then
            return { 'fd', '-tf', '-H' }
          else
            return { 'fd', '-tf' }
          end
        end,
        dir_command = { 'fd', '-td' },
        filters = { 'fuzzy_filter', 'difflib_sorter' },
      },
      wilder.cmdline_pipeline {
        language = 'python',
        fuzzy = 1,
      },
      wilder.python_search_pipeline {
        pattern = wilder.python_fuzzy_pattern(),
        sorter = wilder.python_difflib_sorter(),
        engine = 're',
      }
    ),
  })

  wilder.set_option(
    'renderer',
    wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
      border = 'rounded',
      max_height = '60%',
      min_height = 0,
      prompt_position = 'top',
      reverse = 0,
      pumblend = 15,
      highlighter = wilder.lua_fzy_highlighter(),
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
