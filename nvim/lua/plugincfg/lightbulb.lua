local M = {}

local icons = require 'icons'

M.config = function()
  require('nvim-lightbulb').setup {
    sign = {
      priority = 100,
    },
  }

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    callback = function()
      require('nvim-lightbulb').update_lightbulb()
    end,
  })

  vim.fn.sign_define(
    'LightBulbSign',
    { text = icons.misc.bulb, texthl = 'DiagnosticSignInformation' }
  )
end

return M
