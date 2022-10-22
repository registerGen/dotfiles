local M = {}

M.on_attach = function(_, bufnr)
  vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = true,
      virtual_text = { spacing = 4, prefix = '●' },
      severity_sort = true,
    })

  local signs = { Error = '', Warn = '', Info = '', Hint = '' }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = 'rounded'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
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
