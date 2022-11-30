local M = {}

M.config = function()
  require('neodev').setup()

  for server, config in pairs(require 'plugincfg.lsp.servers') do
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    require('lspconfig')[server].setup(vim.tbl_deep_extend('force', {}, {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        require('plugincfg.lsp.ui').on_attach(client, bufnr)
        require('plugincfg.lsp.keymaps').apply_keymaps()
        require('lsp-inlayhints').on_attach(client, bufnr)
      end,
    }, config))
  end

  vim.cmd 'LspStart'
end

return M
