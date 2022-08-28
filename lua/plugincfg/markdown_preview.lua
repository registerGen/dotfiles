local M = {}

M.config = function()
  local id = vim.api.nvim_create_augroup('MarkdownPreview', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    group = id,
    command = 'MarkdownPreview',
  })
  vim.g.mkdp_highlight_css = vim.fn.stdpath 'config' .. '/styles/solarized_dark.css'
  vim.g.mkdp_markdown_css = vim.fn.stdpath 'config' .. '/styles/github.css'
  vim.g.mkdp_theme = 'dark'
end

return M
