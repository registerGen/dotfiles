local M = {}

M.config = function()
  vim.g.sonokai_better_performance = 1
  vim.g.sonokai_diagnostic_text_highlight = 1
  vim.g.sonokai_diagnostic_virtual_text = 'colored'
  vim.g.sonokai_disable_terminal_colors = 1
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_show_eob = 0

  vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('Sonokai', { clear = true }),
    pattern = 'sonokai',
    callback = function()
      vim.api.nvim_set_hl(0, 'TSParameter', { link = 'OrangeItalic', default = false })
      vim.api.nvim_set_hl(0, 'TSParameterReference', { link = 'OrangeItalic', default = false })
    end,
  })
  vim.cmd.colors 'sonokai'
end

return M
