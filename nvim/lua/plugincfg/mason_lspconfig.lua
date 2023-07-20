local M = {}

M.config = function()
  local servers = {}
  for server, _ in pairs(require "plugincfg.lsp.servers") do
    if server ~= "clangd" then
      table.insert(servers, server)
    end
  end
  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
