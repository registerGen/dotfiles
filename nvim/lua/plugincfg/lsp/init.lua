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

        if client.server_capabilities.inlayHintProvider then
          vim.lsp.buf.inlay_hint(bufnr, true)
        end
      end,
    }, config))
  end

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      client.server_capabilities.semanticTokensProvider = nil
    end,
  })

  vim.cmd 'LspStart'
end

return M
