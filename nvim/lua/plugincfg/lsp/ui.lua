local M = {}

local icons = require 'icons'

M.on_attach = function(_, bufnr)
  vim.diagnostic.config {
    virtual_text = {
      spacing = 4,
    },
    float = {
      border = 'rounded',
    },
    update_in_insert = true,
    severity_sort = true,
  }

  local signs = {
    Error = icons.diagnostic.error,
    Warn = icons.diagnostic.warn,
    Info = icons.diagnostic.info,
    Hint = icons.diagnostic.hint,
  }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local id = vim.api.nvim_create_augroup('LspDocumentHighlight', { clear = true })
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    group = id,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.document_highlight()
    end,
  })
  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    group = id,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

return M
