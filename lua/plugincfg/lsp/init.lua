local M = {}

local function on_attach(client, bufnr)
  require('plugincfg.lsp.ui').on_attach(client, bufnr)
  require('aerial').on_attach(client, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr)
end

M.server_config = {
  bashls = {},
  clangd = {
    cmd = { 'clangd', '--offset-encoding=utf-16' },
  },
  cssls = {},
  html = {},
  pyright = {},
  sumneko_lua = require('lua-dev').setup {
    lspconfig = {
      settings = {
        Lua = {
          completion = {
            showWord = 'Disable',
            workSpaceWord = false,
          },
        },
      },
    },
  },
  texlab = {},
  tsserver = {},
  vimls = {},
}

M.config = function()
  for server, config in pairs(M.server_config) do
    require('lspconfig')[server].setup(vim.tbl_deep_extend('force', {}, {
      capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
      on_attach = on_attach,
    }, config))
  end
end

return M
