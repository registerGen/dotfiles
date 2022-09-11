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
      local configuration = vim.fn['sonokai#get_configuration']()
      local palette =
        vim.fn['sonokai#get_palette'](configuration.style, configuration.colors_override)
      vim.fn['sonokai#highlight']('TSParameter', palette.orange, palette.none, 'italic')
      vim.fn['sonokai#highlight']('TSParameterReference', palette.orange, palette.none, 'italic')
      vim.fn['sonokai#highlight']('CmpItemAbbrDeprecated', palette.grey, palette.none)

      -- For wilder.nvim
      vim.cmd [[hi! link WilderDefault Pmenu]]
      vim.cmd [[hi! link WilderSelected PmenuSel]]
      vim.cmd [[hi! link WilderAccent CmpItemAbbrMatch]]
      vim.fn['sonokai#highlight']('WilderSelectedAccent', palette.bg0, palette.bg_blue, 'bold')
    end,
  })
  vim.cmd.colors 'sonokai'
end

return M
