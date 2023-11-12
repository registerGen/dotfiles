local M = {}

M.config = function()
  -- Setup neodev
  require("neodev").setup()

  -- Setup lspconfig
  for server, config in pairs(require("plugincfg.lsp.servers")) do
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {}, {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        require("plugincfg.lsp.ui").on_attach(client, bufnr)
        require("plugincfg.lsp.keymaps").apply_keymaps()
      end,
    }, config))
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
    callback = function(args)
      if not (args.data and args.data.client_id) then
        return
      end

      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      local caps = assert(client.server_capabilities)

      -- Disable hlargs if the server has semantic tokens capability
      if caps.semanticTokensProvider then
        require("hlargs").disable_buf(args.buf)
        vim.api.nvim_create_autocmd("InsertEnter", {
          callback = function()
            require("hlargs").disable_buf(args.buf)
          end,
        })
      end

      -- Enable inlay hints if the server support this
      if caps.inlayHintProvider then
        vim.lsp.inlay_hint.enable(args.buf)
      end
    end,
  })

  vim.cmd("LspStart")
end

return M
