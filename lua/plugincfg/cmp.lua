local M = {}

M.config = function()
  local cmp = require 'cmp'

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end,
    },
    sources = cmp.config.sources {
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'vsnip' },
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-j>'] = cmp.mapping.scroll_docs(3),
      ['<C-k>'] = cmp.mapping.scroll_docs(-3),
      ['<Tab>'] = cmp.mapping.confirm { select = true },
    },
    formatting = {
      format = require('lspkind').cmp_format {
        mode = 'symbol_text',
        maxwidth = 50,
        before = function(entry, item)
          item.menu = '[' .. entry.source.name .. ']'
          return item
        end,
      },
    },
    window = {
      documentation = {
        border = 'rounded',
      },
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
