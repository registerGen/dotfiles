local M = {}

M.config = function()
  require('noice').setup {
    cmdline = {
      icons = {
        ['/'] = { icon = '', hl_group = 'NormalFloat' },
        ['?'] = { icon = '', hl_group = 'NormalFloat' },
        [':'] = { icon = '', hl_group = 'NormalFloat', firstc = false },
      },
    },
    popupmenu = {
      backend = 'cmp',
    },
    views = {
      cmdline_popup = {
        position = {
          row = '30%',
        },
        win_options = {
          winhighlight = { NormalFloat = 'NormalFloat', FloatBorder = 'FloatBorder' },
        },
        filter_options = {
          {
            filter = { event = 'cmdline', find = '^%s*[/?]' },
            opts = {
              border = {
                text = {
                  top = ' Search ',
                },
              },
              win_options = {
                winhighlight = { NormalFloat = 'NormalFloat', FloatBorder = 'FloatBorder' },
              },
            },
          },
        },
      },
    },
  }
end

return M
