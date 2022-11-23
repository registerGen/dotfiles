local M = {}

M.server_config = {
  bashls = {},
  clangd = {
    cmd = { 'clangd', '--offset-encoding=utf-16' },
  },
  pyright = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        completion = {
          showWord = 'Disable',
          workSpaceWord = false,
        },
        workspace = {
          checkThirdParty = false,
        },
      },
    },
  },
  texlab = {},
  vimls = {},
}

M.config = function()
  vim.api.nvim_create_autocmd('BufNewFile', {
    command = 'LspStart',
  })
  require('neodev').setup()
  for server, config in pairs(M.server_config) do
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    require('lspconfig')[server].setup(vim.tbl_deep_extend('force', {}, {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        require('plugincfg.lsp.ui').on_attach(client, bufnr)
        require('lsp-inlayhints').on_attach(client, bufnr)
      end,
    }, config))
  end
end

return M
