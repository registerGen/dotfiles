local M = {}

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
end

return M